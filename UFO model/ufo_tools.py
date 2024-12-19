def create_dict_values(*params):
    dict = {param: param.value for param in params if param.nature == 'external'}
    return dict