# This file was automatically created by FeynRules 2.0.6
# Mathematica version: 7.0 for Linux x86 (64-bit) (November 11, 2008)
# Date: Tue 20 Jan 2015 01:28:29


from .object_library import all_orders, CouplingOrder


QCD = CouplingOrder(name = 'QCD',
                    expansion_order = 99,
                    hierarchy = 1)

QED = CouplingOrder(name = 'QED',
                    expansion_order = 99,
                    hierarchy = 2)

