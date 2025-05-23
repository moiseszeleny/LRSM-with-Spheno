################################################################################
#
# Copyright (c) 2009 The MadGraph5_aMC@NLO Development team and Contributors
#
# This file is a part of the MadGraph5_aMC@NLO project, an application which 
# automatically generates Feynman diagrams and matrix elements for arbitrary
# high-energy processes in the Standard Model and beyond.
#
# It is subject to the MadGraph5_aMC@NLO license which should accompany this 
# distribution.
#
# For more information, visit madgraph.phys.ucl.ac.be and amcatnlo.web.cern.ch
#
################################################################################
"""A user friendly command line interface to access all MadGraph5_aMC@NLO features.
   Uses the cmd package for command interpretation and tab completion.
"""

from __future__ import absolute_import
import os
import logging
import pydoc
import sys
import time
import optparse
import subprocess
import shutil
import copy
import multiprocessing
import signal
import tempfile
import itertools
import os
import six.moves.cPickle


import madgraph
from madgraph import MG4DIR, MG5DIR, MadGraph5Error
import madgraph.interface.extended_cmd as cmd
import madgraph.interface.madgraph_interface as mg_interface
import madgraph.interface.madevent_interface as me_interface
import madgraph.interface.extended_cmd as extended_cmd
import madgraph.interface.amcatnlo_run_interface as run_interface
import madgraph.interface.launch_ext_program as launch_ext
import madgraph.interface.loop_interface as Loop_interface
import madgraph.fks.fks_common as fks_common
import madgraph.fks.fks_base as fks_base
import madgraph.fks.fks_helas_objects as fks_helas
import madgraph.iolibs.export_fks as export_fks
import madgraph.iolibs.export_v4 as export_v4
import madgraph.iolibs.helas_call_writers as helas_call_writers
import madgraph.loop.loop_base_objects as loop_base_objects
import madgraph.core.diagram_generation as diagram_generation
import madgraph.core.helas_objects as helas_objects

import madgraph.various.cluster as cluster
import madgraph.various.misc as misc
import madgraph.various.banner as banner_mod
from six.moves import range

#usefull shortcut
pjoin = os.path.join


logger = logging.getLogger('cmdprint') # -> stdout
logger_stderr = logging.getLogger('fatalerror') # ->stderr

# a new function for the improved NLO generation
glob_directories_map = []
def generate_directories_fks_async(i):
        
    arglist = glob_directories_map[i]
    
    curr_exporter = arglist[0]
    mefile = arglist[1]
    curr_fortran_model = arglist[2]
    ime = arglist[3]
    nme = arglist[4]
    path = arglist[5]
    olpopts = arglist[6]
    
    infile = open(mefile,'rb')
    me = six.moves.cPickle.load(infile)
    infile.close()      
    
    calls, splitorders = curr_exporter.generate_directories_fks(me, curr_fortran_model, ime, nme, path, olpopts)

    nexternal = curr_exporter.proc_characteristic['nexternal']
    ninitial = curr_exporter.proc_characteristic['ninitial']
    max_n_matched_jets = curr_exporter.proc_characteristic['max_n_matched_jets']
    splitting_types = curr_exporter.proc_characteristic['splitting_types']
    #processes = me.born_matrix_element.get('processes')
    processes = me.born_me.get('processes')
    
    #only available after export has been done, so has to be returned from here
    max_loop_vertex_rank = -99
    if me.virt_matrix_element:
        max_loop_vertex_rank = me.virt_matrix_element.get_max_loop_vertex_rank()  
    if six.PY2:
        return [calls, curr_exporter.fksdirs, max_loop_vertex_rank, ninitial, nexternal, processes, max_n_matched_jets, splitting_types, splitorders]
    else:
        return [calls, curr_exporter.fksdirs, max_loop_vertex_rank, ninitial, nexternal, None,max_n_matched_jets, splitting_types, splitorders]

class CheckFKS(mg_interface.CheckValidForCmd):


    def check_display(self, args):
        """ Check the arguments of the display diagrams command in the context
        of the Loop interface."""
        
        mg_interface.MadGraphCmd.check_display(self,args)
        
        if args[0] in ['diagrams', 'processes'] and len(args)>=3 \
                and args[1] not in ['born','loop','virt','real']:
            raise self.InvalidCmd("Can only display born, loop (virt) or real diagrams, not %s."%args[1])
        # rename args[1] if it is 'virt'
        if len(args) > 1:
            if args[1] == 'virt':
                args[1] = 'loop' 

    def check_add(self, args):

        # this is for the Sudakov approximation of EW corrections
        logger.warning('Generating a process including the Sudakov approximation of EW corrections.\n' + \
                       'Please cite arxiv:2110.03714, arxiv:2309.00452')
        if "--ewsudakov" in args:
            self.ewsudakov = True
            args.remove('--ewsudakov')
        
        super(CheckFKS, self).check_add(args)        
        if '$' in args:
            raise self.InvalidCmd('$ syntax not valid for aMC@NLO. $$ syntax is on the other hand a valid syntax.')

    def check_tutorial(self, args):
        """check the validity of the line"""
        if len(args) == 0:
            #this means mg5 tutorial
            args.append('aMCatNLO')
        else:
            return mg_interface.CheckValidForCmd.check_tutorial(self,args)

    def check_output(self, args):
        """ check the validity of the line"""
                  
        if args and args[0] == 'ewsudakovsa':
            self._export_format = 'ewsudsa'
            args.pop(0)
        else:
            self._export_format = 'NLO'

        forbidden_formats = ['madevent', 'standalone']
        

        if not hasattr(self, '_fks_multi_proc') or not self._fks_multi_proc:
            text = 'No processes generated. Please generate a process first.'
            raise self.InvalidCmd(text)

        if not self._curr_model:
            text = 'No model found. Please import a model first and then retry.'
            raise self.InvalidCmd(text)

        if args and args[0][0] != '-':
            if args[0] in forbidden_formats:
                text = 'You generated a NLO process, which cannot be exported in %s mode.\n' % args[0]
                text+= 'Please use the command "output DIR_NAME".\n'
                raise self.InvalidCmd(text)

            # This is a path
            path = args.pop(0)
            # Check for special directory treatment
            if path == 'auto':
                self.get_default_path()
            elif path != 'auto':
                self._export_dir = path
        else:
            # No valid path
            self.get_default_path()

        self._export_dir = os.path.realpath(self._export_dir)

                
    def check_launch(self, args, options):
        """check the validity of the line. args are DIR and MODE
        MODE being LO, NLO, aMC@NLO or aMC@LO. If no mode is passed, aMC@NLO is used"""
        # modify args in order to be DIR 
        # mode being either standalone or madevent
        
        if not args:
            if self._done_export:
                args.append(self._done_export[0])
                args.append('auto')

                return
            else:
                self.help_launch()
                raise self.InvalidCmd('No default location available, please specify location.')
        
        if len(args) > 2:
            self.help_launch()
            return self.InvalidCmd, 'Invalid Syntax: Too many argument'

        elif len(args) == 2:
            if not args[1] in ['LO', 'NLO', 'aMC@NLO', 'aMC@LO', 'auto']:
                raise self.InvalidCmd('%s is not a valid mode, please use "LO", "NLO", "aMC@NLO" or "aMC@LO"' % args[1])
        else:
            #check if args[0] is path or mode
            if args[0] in ['LO', 'NLO', 'aMC@NLO', 'aMC@LO', 'auto'] and self._done_export:
                args.insert(0, self._done_export[0])
            elif os.path.isdir(args[0]) or os.path.isdir(pjoin(MG5DIR, args[0]))\
                    or os.path.isdir(pjoin(MG4DIR, args[0])):
                args.append('auto')
            else:
                self.help_launch()
                raise self.InvalidCmd('%s is not a valid process directory nor run mode' % args[0])

        mode = args[1]
        
        # search for a valid path
        if os.path.isdir(args[0]):
            path = os.path.realpath(args[0])
        elif os.path.isdir(pjoin(MG5DIR,args[0])):
            path = pjoin(MG5DIR,args[0])
        elif  MG4DIR and os.path.isdir(pjoin(MG4DIR,args[0])):
            path = pjoin(MG4DIR,args[0])
        else:    
            raise self.InvalidCmd('%s is not a valid directory' % args[0])
        args[0] = path
                
        # inform where we are for future command
        self._done_export = [path, mode]

        # check for incompatible options/modes
        if options['multicore'] and options['cluster']:
            raise self.InvalidCmd('options -m (--multicore) and -c (--cluster)' + \
                    ' are not compatible. Please choose one.')
        if mode == 'NLO' and options['reweightonly']:
            raise self.InvalidCmd('option -r (--reweightonly) needs mode "aMC@NLO" or "aMC@LO"')


class CheckFKSWeb(mg_interface.CheckValidForCmdWeb, CheckFKS):
    pass

class CompleteFKS(mg_interface.CompleteForCmd):
    
    def complete_display(self, text, line, begidx, endidx):
        """Complete the display command in the context of the FKS interface"""

        args = self.split_arg(line[0:begidx])

        if len(args) == 2 and args[1] in ['diagrams', 'processes']:
            return self.list_completion(text, ['born', 'loop', 'virt', 'real'])
        else:
            return mg_interface.MadGraphCmd.complete_display(self, text, line,
                                                                 begidx, endidx)


    def complete_output(self, text, line, begidx, endidx):
        """Complete the output command in the context of the FKS interface"""
        #don't propose directory use by MG_ME
        forbidden_names = ['MadGraphII', 'Template', 'pythia-pgs', 'CVS',
                            'Calculators', 'MadAnalysis', 'SimpleAnalysis',
                            'mg5', 'DECAY', 'EventConverter', 'Models',
                            'ExRootAnalysis', 'HELAS', 'Transfer_Fct', 'aloha', 
                            'madgraph', 'bin', 'tests', 'input', 'vendor', 'models']
        
        #name of the run =>proposes old run name
        args = self.split_arg(line[0:begidx])
        if len(args) >= 1: 
            if len(args) > 1 and args[1] == 'aloha':
                try:
                    return self.aloha_complete_output(text, line, begidx, endidx)
                except Exception as error:
                    print(error)
            # Directory continuation
            if args[-1].endswith(os.path.sep):
                return [name for name in self.path_completion(text,
                        pjoin(*[a for a in args if a.endswith(os.path.sep)]),
                        only_dirs = True) if name not in forbidden_names]

            # directory names
            content = [name for name in self.path_completion(text, '.', only_dirs = True) \
                       if name not in forbidden_names]
            return self.list_completion(text, content)


    def complete_launch(self, text, line, begidx, endidx, formatting=True):
        """ complete the launch command"""
        args = self.split_arg(line[0:begidx])

        # Directory continuation
        if args[-1].endswith(os.path.sep):
            return self.path_completion(text,
                                        pjoin(*[a for a in args if a.endswith(os.path.sep)]),
                                        only_dirs = True)
        # Format
        if len(args) == 1:
            out = {'Path from ./': self.path_completion(text, '.', only_dirs = True)}
            if MG5DIR != os.path.realpath('.'):
                out['Path from %s' % MG5DIR] =  self.path_completion(text,
                                     MG5DIR, only_dirs = True, relative=False)
            if MG4DIR and MG4DIR != os.path.realpath('.') and MG4DIR != MG5DIR:
                out['Path from %s' % MG4DIR] =  self.path_completion(text,
                                     MG4DIR, only_dirs = True, relative=False)

        if len(args) == 2:
            modes = ['aMC@NLO', 'NLO', 'aMC@LO', 'LO']
            return self.list_completion(text, modes, line)
            
        #option
        if len(args) >= 3:
            out={}

        if line[0:begidx].endswith('--laststep='):
            opt = ['parton', 'pythia', 'pgs','delphes','auto']
            out['Options'] = self.list_completion(text, opt, line)
        else:

            opt = ['-f', '-c', '-m', '-i', '-x', '-r', '-p', '-o', '-n', 'a',
                    '--force', '--cluster', '--multicore', '--interactive',
                    '--nocompile', '--reweightonly', '--parton', '--only_generation', '--name', '--appl_start_grid']
            out['Options'] = self.list_completion(text, opt, line)
        

        return self.deal_multiple_categories(out, formatting)

class HelpFKS(mg_interface.HelpToCmd):

    def help_display(self):   
        mg_interface.MadGraphCmd.help_display(self)
        logger.info("   In aMC@NLO5, after display diagrams, the user can add the option")
        logger.info("   \"born\", \"virt\" or \"real\" to display only the corresponding diagrams.")

    def help_launch(self):
        """help for launch command"""
        _launch_parser.print_help()

class aMCatNLOInterface(CheckFKS, CompleteFKS, HelpFKS, Loop_interface.CommonLoopInterface):
    
    _fks_display_opts = ['real_diagrams', 'born_diagrams', 'virt_diagrams', 
                         'real_processes', 'born_processes', 'virt_processes']

    _nlo_modes_for_completion = ['all','real']
    display_expansion = False

    def __init__(self, mgme_dir = '', *completekey, **stdin):
        """ Special init tasks for the Loop Interface """
        mg_interface.MadGraphCmd.__init__(self, mgme_dir = '', *completekey, **stdin)
        self.setup()

    def setup(self):
        """ Special tasks when switching to this interface """

        # Refresh all the interface stored value as things like generated
        # processes and amplitudes are not to be reused in between different
        # interfaces
        # Clear history, amplitudes and matrix elements when a model is imported
        # Remove previous imports, generations and outputs from history
        self.history.clean(remove_bef_last='import',
                           to_keep=['set','load','import', 'define'])
        # Reset amplitudes and matrix elements
        self._done_export=False
        self._curr_amps = diagram_generation.AmplitudeList()
        self._curr_matrix_elements = helas_objects.HelasMultiProcess()
        self._v4_export_formats = []
        self._nlo_modes_for_completion = ['all','real']
        self._export_formats = [ 'madevent', 'aloha' ]
        # Do not force NLO model as the user might have asked for reals only.
        # It will anyway be forced later if he attempts virt= or all=.
        self.validate_model(loop_type='real_init', stop=False)
        # Set where to look for CutTools installation.
        # In further versions, it will be set in the same manner as _mgme_dir so that
        # the user can chose its own CutTools distribution.
        self._cuttools_dir=str(pjoin(self._mgme_dir,'vendor','CutTools'))
        if not os.path.isdir(pjoin(self._cuttools_dir, 'src','cts')):
            logger.warning(('Warning: Directory %s is not a valid CutTools directory.'+\
                           'Using default CutTools instead.') % \
                             self._cuttools_dir)
            self._cuttools_dir=str(pjoin(self._mgme_dir,'vendor','CutTools'))
        # Set where to look for IREGI installation
        self._iregi_dir=str(os.path.join(self._mgme_dir,'vendor','IREGI','src'))
        if not os.path.isdir(self._iregi_dir):
            logger.warning(('Warning: Directory %s is not a valid IREGI directory.'+\
                            'Using default IREGI instead.')%\
                           self._iregi_dir)
            self._iregi_dir=str(os.path.join(self._mgme_dir,'vendor','IREGI','src'))

    def do_display(self, line, output=sys.stdout):
        # if we arrive here it means that a _fks_display_opts has been chosen
        args = self.split_arg(line)
        #check the validity of the arguments
        self.check_display(args)

        if args[0] in ['diagrams', 'processes', 'diagrams_text']:
            get_amps_dict = {'real': self._fks_multi_proc.get_real_amplitudes,
                             'born': self._fks_multi_proc.get_born_amplitudes,
                             'loop': self._fks_multi_proc.get_virt_amplitudes}
            if args[0] == 'diagrams':
                if len(args)>=2 and args[1] in list(get_amps_dict.keys()):
                    get_amps = get_amps_dict[args[1]]
                    self._curr_amps = get_amps()
                    #check that if one requests the virt diagrams, there are virt_amplitudes
                    if args[1] == 'loop' and len(self._curr_amps) == 0:
                        raise self.InvalidCmd('No virtuals have been generated')
                    self.draw(' '.join(args[2:]), Dtype = args[1])
                else:
                    for diag_type, get_amps in get_amps_dict.items():
                        self._curr_amps = get_amps()
                        if self._curr_amps:
                            self.draw(' '.join(args[1:]), Dtype=diag_type)

                # set _curr_amps back to empty
                self._curr_amps = diagram_generation.AmplitudeList()

            if args[0] == 'diagrams_text':
                if len(args)>=2 and args[1] in list(get_amps_dict.keys()):
                    get_amps = get_amps_dict[args[1]]
                    self._curr_amps = get_amps()
                    #check that if one requests the virt diagrams, there are virt_amplitudes
                    if args[1] in ['virt', 'loop'] and len(self._curr_amps) == 0:
                        raise self.InvalidCmd('No virtuals have been generated')
                    text = "\n".join([amp.nice_string() for amp in self._curr_amps])
                else:
                    text = 'Born diagrams:\n' 
                    text += '\n'.join(amp.nice_string() for amp in get_amps_dict['born']())
                    text += '\n\nReal diagrams:'
                    text += '\n'.join(amp.nice_string() for amp in get_amps_dict['real']())
                    text += '\n\nLoop diagrams:\n'
                    text += '\n'.join(amp.nice_string() for amp in get_amps_dict['loop']())
                pydoc.pager(text)

                # set _curr_amps back to empty
                self._curr_amps = diagram_generation.AmplitudeList()
                    
            elif args[0] == 'processes':
                if len(args)>=2 and args[1] in list(get_amps_dict.keys()):
                    get_amps = get_amps_dict[args[1]]
                    self._curr_amps = get_amps()
                    #check that if one requests the virt diagrams, there are virt_amplitudes
                    if args[1] in ['virt', 'loop'] and len(self._curr_amps) == 0:
                        raise self.InvalidCmd('No virtuals have been generated')
                    print('\n'.join(amp.nice_string_processes() for amp in self._curr_amps))
                else:
                    print('Born processes:')
                    print('\n'.join(amp.nice_string_processes() for amp in get_amps_dict['born']()))
                    print('Real processes:')
                    print('\n'.join(amp.nice_string_processes() for amp in get_amps_dict['real']()))
                    print('Loop processes:')
                    print('\n'.join(amp.nice_string_processes() for amp in get_amps_dict['loop']()))
                # set _curr_amps back to empty
                self._curr_amps = diagram_generation.AmplitudeList()

        else:
            mg_interface.MadGraphCmd.do_display(self,line,output)

    def do_add(self, line, *args,**opt):
        
        args = self.split_arg(line)
        # Check the validity of the arguments
        self.ewsudakov = False

        self.check_add(args)

        if args[0] == 'model':
            return self.add_model(args[1:])
        elif args[0] != 'process': 
            raise self.InvalidCmd("The add command can only be used with process or model")
        else:
            if any ([a.startswith("--loop_filter=") for a in args]):
                for a in args:
                    if a.startswith("--loop_filter="):
                        self._fks_multi_proc['loop_filter'] = a.split('=',1)[1]
                        args.remove(a)
                        break

            line = ' '.join(args[1:])

        proc_type=self.extract_process_type(line)
        if proc_type[1] not in ['real', 'LOonly']:
            run_interface.check_compiler(self.options, block=False)
        #validate_model will reset self._generate_info; to avoid
        #this store it
        
        if not aMCatNLOInterface.display_expansion:
            if proc_type[2] != ['QCD'] and proc_type[1] == 'all':
                aMCatNLOInterface.display_expansion = True
                if 'QED' in proc_type[2]:
                    logger.info(
"""------------------------------------------------------------------------
This computation involves NLO EW corrections.
Please also cite ref. 'arXiv:1804.10017' when using results from this code.
------------------------------------------------------------------------
""", '$MG:BOLD')
                else:
                    logger.info(
"""------------------------------------------------------------------------
This computation involve not SM-QCD corrections at NLO.
Please also cite ref. 'arXiv:1804.10017' when using results from this code.
------------------------------------------------------------------------
""", '$MG:BOLD')


        geninfo = self._generate_info

        # this warning is to remind us that for the moment adding EW sudakov
        # corrections lacks the LO2 contributions unless EW corrections are
        # also computed
        if self.ewsudakov and not 'QED' in proc_type[2]:
            logger.warning('The EW Sudakov corrections might be incomplete.' + \
                           'They will not include contributions of QCD origin ' + \
                           'stemming from the LO2, if it exists.')

        self.validate_model(proc_type[1], coupling_type=proc_type[2])
        self._generate_info = geninfo

        #now generate the amplitudes as usual
        #self.options['group_subprocesses'] = 'False'
        collect_mirror_procs = False
        ignore_six_quark_processes = self.options['ignore_six_quark_processes']
        if ',' in line:
            myprocdef, line = mg_interface.MadGraphCmd.extract_decay_chain_process(self,line)
            if myprocdef.are_decays_perturbed():
                raise MadGraph5Error("Decay processes cannot be perturbed")
        else:
            myprocdef = mg_interface.MadGraphCmd.extract_process(self,line)

        self.proc_validity(myprocdef,'aMCatNLO_%s'%proc_type[1])

        # set the orders
        # if some orders have been set by the user,
        # check that all the orders of the model have been specified
        # set to default those which have not been specified and warn the user
        if myprocdef['orders'] and not all([o in list(myprocdef['orders'].keys()) for o in myprocdef['model'].get_coupling_orders()]):
            for o in myprocdef['model'].get_coupling_orders():
                if o not in list(myprocdef['orders'].keys()):
                    myprocdef['orders'][o] = self.options['default_unset_couplings']
                    logger.warning(('%s order is missing in the process definition. It will be set to "default unser couplings": %s\n' + \
                                   'If this is not what you need, please regenerate with the correct orders.') % (o,myprocdef['orders'][o]))

        # raise a warning if squared-orders constraints are not of the '<=' kind
        if myprocdef['sqorders_types'] and any([v != '<=' for v in  myprocdef['sqorders_types'].values()]):
            raise MadGraph5Error('The squared-order constraints passed are not \'<=\'.\n Other kind of squared-order constraints are not supported at NLO')

        # this is in case no orders have been passed
        if not myprocdef['squared_orders'] and not myprocdef['orders']:
            # find the minimum weighted order, then extract the values for the varius
            # couplings in the model
            weighted = diagram_generation.MultiProcess.find_optimal_process_orders(myprocdef)
            if not weighted:
                raise MadGraph5Error('\nProcess orders cannot be determined automatically. \n' + \
                                      'Please specify them from the command line.')

            # this is a very rough attempt, and works only to guess QED/QCD
            qed, qcd = fks_common.get_qed_qcd_orders_from_weighted(len(myprocdef['legs']), 
                                                                   self._curr_model.get('order_hierarchy'), 
                                                                   weighted['WEIGHTED'])

            if qed < 0 or qcd < 0:
                raise MadGraph5Error('\nAutomatic process-order determination lead to negative constraints:\n' + \
                      ('QED: %d,  QCD: %d\n' % (qed, qcd)) + \
                      'Please specify the coupling orders from the command line.')
            if self.options['nlo_mixed_expansion']:
                orders = {'QED': 2*qed, 'QCD': 2*qcd}
                # set all the other coupling to zero
                for o in myprocdef['model'].get_coupling_orders():
                    if o not in ['QED', 'QCD']:
                        orders[o] = 0

                myprocdef.set('squared_orders', orders)
                # warn the user of what happened
                logger.info(('Setting the born squared orders automatically in the process definition to %s.\n' + \
                                'If this is not what you need, please regenerate with the correct orders.'), 
                                ' '.join(['%s^2<=%s' %(k,v) if v else '%s=%s' % (k,v) for k,v in myprocdef['squared_orders'].items()]), 
                                '$MG:BOLD')
            else:
                orders = {'QED': qed, 'QCD': qcd}
                sqorders = {'QED': 2*qed, 'QCD': 2*qcd}
                # set all the other coupling to zero
                for o in myprocdef['model'].get_coupling_orders():
                    if o not in ['QED', 'QCD']:
                        orders[o] = 0
                        sqorders[o] = 0

                myprocdef.set('orders', orders)
                myprocdef.set('squared_orders', sqorders)
                # warn the user of what happened
                logger.info(('Setting the born orders automatically in the process definition to %s.\n' + \
                                'If this is not what you need, please regenerate with the correct orders.'), 
                                ' '.join(['%s<=%s' %(k,v) if v else '%s=%s' % (k,v) for k,v in myprocdef['orders'].items()]), 
                                '$MG:BOLD')                

        # now check that all couplings that are there in orders also appear
        # in squared_orders. If not, set the corresponding one
        for k, v in myprocdef['orders'].items():
            if k not in myprocdef['squared_orders'].keys():
                myprocdef['squared_orders'][k] = 2*v 
                logger.warning('Order %s is not constrained as squared_orders. Using: %s^2=%d' % (k,k,2*v) )

        # check that all the couplings of the model have been constrained
        # in the squared orders, otherwise set the others to zero
        for o in myprocdef['model'].get('coupling_orders'):
            if o not in myprocdef['squared_orders'].keys():
                logger.warning('No squared order constraint for order %s. Setting to 0' % o)
                myprocdef['squared_orders'][o] = 0 

        myprocdef['born_sq_orders'] = copy.copy(myprocdef['squared_orders'])
        # split all orders in the model, for the moment it's the simplest solution
        # mz02/2014
        #if proc_type[1] != 'only':
        myprocdef['split_orders'] += [o for o in myprocdef['model'].get('coupling_orders') \
                if o not in myprocdef['split_orders']]

        # now set the squared orders
        if not myprocdef['squared_orders']:
            logger.warning('No squared orders have been provided, will be guessed by the order constraints')
            for ord, val in myprocdef['orders'].items():
                myprocdef['squared_orders'][ord] = 2 * val

        # then increase the orders which are perturbed
        for pert in myprocdef['perturbation_couplings']:

            if not self.options['nlo_mixed_expansion'] and pert not in proc_type[2]:
                    continue


            # if orders have been specified increase them
            if list(myprocdef['orders'].keys()) != ['WEIGHTED']:
                try:
                    myprocdef['orders'][pert] += 1
                except KeyError:
                    # if the order is not specified
                    # then MG does not put any bound on it
                    ###myprocdef['orders'][pert] = 99
                    pass
                try:
                    myprocdef['squared_orders'][pert] += 2
                except KeyError:
                    # the order is not provided, assume
                    # it is originally zero
                    myprocdef['squared_orders'][pert] = 2

        # update also the WEIGHTED entry
        if 'WEIGHTED' in list(myprocdef['orders'].keys()):
            myprocdef['orders']['WEIGHTED'] += 1 * \
                    max([myprocdef.get('model').get('order_hierarchy')[ord] for \
                    ord in myprocdef['perturbation_couplings']])

            myprocdef['squared_orders']['WEIGHTED'] += 2 * \
                    max([myprocdef.get('model').get('order_hierarchy')[ord] for \
                    ord in myprocdef['perturbation_couplings']])
        # if [orders] have not been specified, 
        # finally set perturbation_couplings to **all** the coupling orders 
        # avaliable in the model.
        # This is necessary because when doing EW corrections one only specifies
        # squared-orders constraints. In that case, all kind of splittings/loop-particles
        # must be included
        if not myprocdef['orders'] and self.options['nlo_mixed_expansion']:
            myprocdef['perturbation_couplings'] = list(myprocdef['model']['coupling_orders'])

        self._curr_proc_defs.append(myprocdef)

        # if the new nlo process generation mode is enabled, the number of cores to be
        # used has to be passed
        # ncores_for_proc_gen has the following meaning
        #   0 : do things the old way
        #   > 0 use ncores_for_proc_gen
        #   -1 : use all cores
        if self.options['low_mem_multicore_nlo_generation']:
            if self.options['nb_core']:
                self.ncores_for_proc_gen = int(self.options['nb_core'])
            else:
                self.ncores_for_proc_gen = -1
        else:
            self.ncores_for_proc_gen = 0

        # check if any initial-state leg contains leptons. If so, switch 
        # include_lepton_initiated_processes to True
        lep_ids = [11, -11, 13, -13, 15, -15]
        initial_ids = sum([l['ids'] for l in myprocdef['legs'] if not l['state']], [])
        if any([idd in lep_ids for idd in initial_ids]) and \
                not self.options['include_lepton_initiated_processes']:
            logger.warning('The process definition has leptons in the initial state')
            logger.warning('The flag \'include_lepton_initiated_processes\' will be set to True')
            self.do_set('include_lepton_initiated_processes True')

        # this is the options dictionary to pass to the FKSMultiProcess
        fks_options = {'OLP': self.options['OLP'],
                       'ignore_six_quark_processes': self.options['ignore_six_quark_processes'],
                       'init_lep_split': self.options['include_lepton_initiated_processes'],
                       'ncores_for_proc_gen': self.ncores_for_proc_gen,
                       'ewsudakov': self.ewsudakov,
                       'nlo_mixed_expansion': self.options['nlo_mixed_expansion'],
                       'loop_filter':self._fks_multi_proc['loop_filter'] if hasattr(self, '_fks_multi_proc') else None}

        fksproc =fks_base.FKSMultiProcess(myprocdef,fks_options)
        try:
            self._fks_multi_proc.add(fksproc)
        except AttributeError: 
            self._fks_multi_proc = fksproc
            self._fks_multi_proc['loop_filter'] = fks_options['loop_filter']

        if not aMCatNLOInterface.display_expansion and  self.options['nlo_mixed_expansion']:
            base = {}
            for amp in self._fks_multi_proc.get_born_amplitudes():
                nb_part = len(amp['process']['legs'])
                for diag in amp['diagrams']:   
                    if nb_part not in  base:
                        base[nb_part] = diag.get('orders')
                    elif base[nb_part] != diag.get('orders'):
                        aMCatNLOInterface.display_expansion = True
                        logger.info(
"""------------------------------------------------------------------------
This computation can involve not only purely SM-QCD corrections at NLO.
Please also cite ref. 'arXiv:1804.10017' when using results from this code.
------------------------------------------------------------------------
""", '$MG:BOLD')
                        break
                else:
                    continue
                break




    def do_output(self, line):
        """Main commands: Initialize a new Template or reinitialize one"""
        
        args = self.split_arg(line)
        # Check Argument validity
        self.check_output(args)
        
        noclean = '-noclean' in args
        force = '-f' in args 
        nojpeg = '-nojpeg' in args
        main_file_name = ""
        try:
            main_file_name = args[args.index('-name') + 1]
        except Exception:
            pass

        # For NLO, the group_subprocesses is automatically set to false
        group_processes = False
        # initialize the writer
        if self._export_format in ['NLO','ewsudsa']:
            output_type_dict = {'NLO': 'amcatnlo', 'ewsudsa': 'ewsudsa'}
            self._curr_exporter = export_v4.ExportV4Factory(self, noclean, 
                      output_type=output_type_dict[self._export_format],
                      group_subprocesses=group_processes)
            
            self._curr_exporter.pass_information_from_cmd(self)

        # check if a dir with the same name already exists
        if not force and not noclean and os.path.isdir(self._export_dir)\
               and self._export_format in ['NLO', 'ewsudsa']:
            # Don't ask if user already specified force or noclean
            logger.info('INFO: directory %s already exists.' % self._export_dir)
            logger.info('If you continue this directory will be deleted and replaced.')
            answer = self.ask('Do you want to continue?', 'y', ['y','n'], 
                                                timeout=self.options['timeout'])
            if answer != 'y':
                raise self.InvalidCmd('Stopped by user request')

        # if one gets here either used -f or answered yes to the question about
        # removing the dir
        if os.path.exists(self._export_dir):
            shutil.rmtree(self._export_dir)

        # Make a Template Copy
        if self._export_format in ['NLO', 'ewsudsa']:
            self._curr_exporter.copy_fkstemplate(self._curr_model)

        # Reset _done_export, since we have new directory
        self._done_export = False

        # Perform export and finalize right away
        self.export(nojpeg, main_file_name, group_processes=group_processes)

        # Pass potential new information generated during the export.
        self._curr_exporter.pass_information_from_cmd(self)

        # Automatically run finalize
        self.finalize(nojpeg)
            
        # Generate the virtuals if from OLP
        if self.options['OLP']!='MadLoop':
            self._curr_exporter.generate_virtuals_from_OLP(
              self.born_processes_for_olp,self._export_dir,self.options['OLP'])
                
        # Remember that we have done export
        self._done_export = (self._export_dir, self._export_format)

        # Reset _export_dir, so we don't overwrite by mistake later
        self._export_dir = None

    # Export a matrix element  
    def export(self, nojpeg = False, main_file_name = "", group_processes=False):
        """Export a generated amplitude to file"""

        self._curr_helas_model = helas_call_writers.FortranUFOHelasCallWriter(self._curr_model)
        def generate_matrix_elements(self, group=False):
            """Helper function to generate the matrix elements before
            exporting"""

            # Sort amplitudes according to number of diagrams,
            # to get most efficient multichannel output
            self._curr_amps.sort(key = lambda a: a.get_number_of_diagrams(), reverse=True)
                
            cpu_time1 = time.time()
            ndiags = 0
            if not self._curr_matrix_elements.get_matrix_elements():
                if group:
                    raise MadGraph5Error("Cannot group subprocesses when "+\
                                                              "exporting to NLO")
                else:
                    self._curr_matrix_elements = \
                             fks_helas.FKSHelasMultiProcess(\
                                self._fks_multi_proc, 
                                loop_optimized= self.options['loop_optimized_output'])
                    
                    if not self.options['low_mem_multicore_nlo_generation']: 
                        # generate the code the old way
                        ndiags = sum([len(me.get('diagrams')) for \
                                      me in self._curr_matrix_elements.\
                                      get_matrix_elements()])
                        # assign a unique id number to all process and
                        # generate a list of possible PDF combinations
                        uid = 0 
                        initial_states=[]
                        for me in self._curr_matrix_elements.get_matrix_elements():
                            uid += 1 # update the identification number
                            me.get('processes')[0].set('uid', uid)
                            try:
                                initial_states.append(sorted(list(set((p.get_initial_pdg(1),p.get_initial_pdg(2)) for \
                                                                      p in me.born_me.get('processes')))))
                            except IndexError:
                                initial_states.append(sorted(list(set((p.get_initial_pdg(1)) for \
                                                                      p in me.born_me.get('processes')))))
                        
                            for fksreal in me.real_processes:
                            # Pick out all initial state particles for the two beams
                                try:
                                    initial_states.append(sorted(list(set((p.get_initial_pdg(1),p.get_initial_pdg(2)) for \
                                                                 p in fksreal.matrix_element.get('processes')))))
                                except IndexError:
                                    initial_states.append(sorted(list(set((p.get_initial_pdg(1)) for \
                                                                 p in fksreal.matrix_element.get('processes')))))
                                    
                            
                        # remove doubles from the list
                        checked = []
                        for e in initial_states:
                            if e not in checked:
                                checked.append(e)
                        initial_states=checked

                        self._curr_matrix_elements.set('initial_states',initial_states)

                    else:
                        #new NLO generation
                        if self._curr_matrix_elements['has_loops']:
                            self._curr_exporter.opt['mp'] = True
                        self._curr_exporter.model = self._curr_model
                        ndiags = 0

            cpu_time2 = time.time()
            return ndiags, cpu_time2 - cpu_time1

        # Start of the actual routine

        ndiags, cpu_time = generate_matrix_elements(self, group=group_processes)
        calls = 0
        splitorders = []

        path = self._export_dir

        if self._export_format in ['NLO', 'ewsudsa']:
            path = os.path.join(path, 'SubProcesses')

            #_curr_matrix_element is a FKSHelasMultiProcess Object 
            self._fks_directories = []
            proc_charac = self._curr_exporter.proc_characteristic 
            for charac in ['has_isr', 'has_fsr', 'has_loops']:
                proc_charac[charac] = self._curr_matrix_elements[charac]

            # prepare for the generation
            # glob_directories_map is for the new NLO generation
            global glob_directories_map
            glob_directories_map = []

            # Save processes instances generated
            self.born_processes_for_olp = []
            self.born_processes = []
            for ime, me in \
                enumerate(self._curr_matrix_elements.get('matrix_elements')):
                if not self.options['low_mem_multicore_nlo_generation']:
                    #me is a FKSHelasProcessFromReals
                    calls_dir, splitorders_dir = \
                            self._curr_exporter.generate_directories_fks(me, 
                            self._curr_helas_model, 
                            ime, len(self._curr_matrix_elements.get('matrix_elements')), 
                            path,self.options['OLP'])
                    calls += calls_dir
                    splitorders += [so for so in splitorders_dir if so not in splitorders]
                    self._fks_directories.extend(self._curr_exporter.fksdirs)
                    self.born_processes_for_olp.append(me.born_me.get('processes')[0])
                    self.born_processes.append(me.born_me.get('processes'))
                else:
                    glob_directories_map.append(\
                            [self._curr_exporter, me, self._curr_helas_model, 
                             ime, len(self._curr_matrix_elements.get('matrix_elements')), 
                             path, self.options['OLP']])

            if self.options['low_mem_multicore_nlo_generation']:
                # start the pool instance with a signal instance to catch ctr+c
                logger.info('Writing directories...')
                if six.PY3:
                    ctx = multiprocessing.get_context('fork') # spawn is default for 3.8 and does not work
                else:
                    ctx = multiprocessing
                original_sigint_handler = signal.signal(signal.SIGINT, signal.SIG_IGN)
                if self.ncores_for_proc_gen < 0: # use all cores
                    pool = ctx.Pool(maxtasksperchild=1)
                else:
                    pool = ctx.Pool(processes=self.ncores_for_proc_gen,maxtasksperchild=1)
                signal.signal(signal.SIGINT, original_sigint_handler)
                try:
                    # the very large timeout passed to get is to be able to catch
                    # KeyboardInterrupts
                    diroutputmap = pool.map_async(generate_directories_fks_async,
                                                  list(range(len(glob_directories_map)))).get(9999999)
                except KeyboardInterrupt:
                    pool.terminate()
                    raise KeyboardInterrupt 
    
                pool.close()
                pool.join()
                
                #clean up tmp files containing final matrix elements
                for mefile in self._curr_matrix_elements.get('matrix_elements'):
                    os.remove(mefile)

                for charac in ['nexternal', 'ninitial', 'splitting_types']:
                    proc_charac[charac] = self._curr_exporter.proc_characteristic[charac]
                # ninitial and nexternal

                
                proc_charac['nexternal'] = max([diroutput[4] for diroutput in diroutputmap])
                ninitial_set = set([diroutput[3] for diroutput in diroutputmap])
                if len(ninitial_set) != 1:
                    raise MadGraph5Error("Invalid ninitial values: %s" % ' ,'.join(list(ninitial_set)))    
                proc_charac['ninitial'] = list(ninitial_set)[0]
                
                #  max_n_matched_jets
                njet_set = set([int(diroutput[6]) for diroutput in diroutputmap])
                proc_charac['max_n_matched_jets'] = max(njet_set)

                self.born_processes = []
                self.born_processes_for_olp = []
                max_loop_vertex_ranks = []
                
                # transform proc_charac['splitting_types'] into a set
                splitting_types = set(proc_charac['splitting_types'])
                for diroutput in diroutputmap:
                    splitting_types = splitting_types.union(set(diroutput[7]))
                    calls = calls + diroutput[0]
                    splitorders += [so for so in diroutput[8] if so not in splitorders]
                    self._fks_directories.extend(diroutput[1])
                    max_loop_vertex_ranks.append(diroutput[2])
                    if six.PY2:
                        self.born_processes.extend(diroutput[5])
                        self.born_processes_for_olp.append(diroutput[5][0])

                # transform proc_charac['splitting_types'] back to a list
                proc_charac['splitting_types'] = list(splitting_types)

            else:
                max_loop_vertex_ranks = [me.get_max_loop_vertex_rank() for \
                                         me in self._curr_matrix_elements.get_virt_matrix_elements()]

            card_path = os.path.join(path, os.path.pardir, 'SubProcesses', \
                                     'procdef_mg5.dat')
            
            if self.options['loop_optimized_output'] and \
               len(max_loop_vertex_ranks) > 0:
                self._curr_exporter.write_coef_specs_file(max_loop_vertex_ranks)
            if self._generate_info:
                self._curr_exporter.write_procdef_mg5(card_path, #
                                self._curr_model['name'],
                                self._generate_info)
                try:
                    cmd.Cmd.onecmd(self, 'history .')
                except Exception:
                    logger.debug('fail to run command \"history cmd\"')
                    pass
            subproc_path = os.path.join(path, os.path.pardir, 'SubProcesses', \
                                     'initial_states_map.dat')
            nmaxpdf = self._curr_exporter.write_init_map(subproc_path,
                                self._curr_matrix_elements.get('initial_states'))
            self._curr_exporter.write_maxproc_files(nmaxpdf, 
                                os.path.join(path, os.path.pardir, 'SubProcesses'))

            self._curr_exporter.write_orderstag_file(splitorders, self._export_dir)

        cpu_time1 = time.time()


    def do_launch(self, line):
        """Main commands: Ask for editing the parameters and then execute the code (NLO or aMC@(N)LO)
        """
        old_cwd = os.getcwd()
        argss = self.split_arg(line)
        # check argument validity and normalise argument
        (options, argss) = _launch_parser.parse_args(argss)
        options = options.__dict__
        self.check_launch(argss, options)
        if not os.path.isdir(os.path.join(os.getcwd(), argss[0], 'Events')):
            self.do_switch('ML5')
            return mg_interface.MadGraphCmd.do_launch(self,line)
#        if self.options['automatic_html_opening']:
#            misc.open_file(os.path.join(os.getcwd(), argss[0], 'crossx.html'))
#            self.options['automatic_html_opening'] = False

        if options['interactive']:
            if isinstance(self, extended_cmd.CmdShell):
                ME = run_interface.aMCatNLOCmdShell(me_dir=argss[0], options=self.options)
            else:
                ME = run_interface.aMCatNLOCmd(me_dir=argss[0],options=self.options)
                ME.pass_in_web_mode()
            # transfer interactive configuration
            config_line = [l for l in self.history if l.strip().startswith('set')]
            for line in config_line:
                ME.exec_cmd(line)
            stop = self.define_child_cmd_interface(ME)                
            return stop

        ext_program = launch_ext.aMCatNLOLauncher(argss[0], self, run_mode=argss[1],
                                                  shell = isinstance(self, extended_cmd.CmdShell),
                                                  **options)
        ext_program.run()
        
                    
   
class aMCatNLOInterfaceWeb(mg_interface.CheckValidForCmdWeb, aMCatNLOInterface):
    pass

_launch_usage = "launch [DIRPATH] [MODE] [options]\n" + \
                "-- execute the aMC@NLO output present in DIRPATH\n" + \
                "   By default DIRPATH is the latest created directory\n" + \
                "   MODE can be either LO, NLO, aMC@NLO or aMC@LO (if omitted, it is asked in a separate question)\n" + \
                "     If mode is set to LO/NLO, no event generation will be performed, but only the \n" + \
                "     computation of the total cross-section and the filling of parton-level histograms \n" + \
                "     specified in the DIRPATH/SubProcesses/madfks_plot.f file.\n" + \
                "     If mode is set to aMC@LO/aMC@NLO, after the cross-section computation, a .lhe \n" + \
                "     event file is generated which will be showered with the MonteCarlo specified \n" + \
                "     in the run_card.dat\n"

_launch_parser = misc.OptionParser(usage=_launch_usage)
_launch_parser.add_option("-f", "--force", default=False, action='store_true',
                                help="Use the card present in the directory for the launch, without editing them")
_launch_parser.add_option("-c", "--cluster", default=False, action='store_true',
                            help="Submit the jobs on the cluster")
_launch_parser.add_option("-i", "--interactive", default=False, action='store_true',
                            help="Use interactive consol")
_launch_parser.add_option("-m", "--multicore", default=False, action='store_true',
                            help="Submit the jobs on multicore mode")
_launch_parser.add_option("-x", "--nocompile", default=False, action='store_true',
                            help="Skip compilation. Ignored if no executable is found")
_launch_parser.add_option("-r", "--reweightonly", default=False, action='store_true',
                            help="Skip integration and event generation, just run reweight on the" + \
                                 " latest generated event files (see list in SubProcesses/nevents_unweighted)")
_launch_parser.add_option("-p", "--parton", default=False, action='store_true',
                            help="Stop the run after the parton level file generation (you need " + \
                                    "to shower the file in order to get physical results)")
_launch_parser.add_option("-o", "--only_generation", default=False, action='store_true',
                            help="Skip grid set up, just generate events starting from " + \
                            "the last available results")
# the last option is different from the corresponding in amcatnlo_run_interface as it stores the 
# 'name' entry of the options, not the run_name one
_launch_parser.add_option("-n", "--name", default=False, dest='name',
                            help="Provide a name to the run")
_launch_parser.add_option("-R", "--reweight", default=False, action='store_true',
                            help="Run the reweight module (reweighting by different model parameter")
_launch_parser.add_option("-M", "--madspin", default=False, action='store_true',
                            help="Run the madspin package")



