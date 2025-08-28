# Functions to order the values of 'Mn_i_minus' and 'muii' from a DataFrame which 
# contains the results of a scan with perturvativity or other bounds, 
# and to create mn4, mn5, mn6, mn7, mn8, and mn9 values.

def select_single_value(data):
    """
    Selects a single random value from the given data and returns its index and value.
    """
    selected_value = data.sample(n=1).values.flatten()[0]
    return (data[data == selected_value].index[0], selected_value)

def order_random_values(data, n=3):
    """
    Selects n random values from the given data and orders them and
    keeps the original indices.
    Returns a list of tuples (index, value).
    """
    selected_values = data.sample(n=n).values.flatten()
    ordered_values = sorted(selected_values)
    return [(data[data == val].index[0], val) for val in ordered_values]

def create_mn_values(data):
    """
    Creates mn4, mn5, mn6, mn7, mn8, mn9 values based on the given data.
    The function selects three random values from 'Mn_i_minus' and three values from 'muii',
    orders them, and computes mn7, mn8, and mn9 based on the selected values.
    Returns a list of the computed values.
    """
    mn_indices = order_random_values(data['Mn_i_minus'])

    idx1 = mn_indices[0][0]
    idx2 = mn_indices[1][0]
    idx3 = mn_indices[2][0]
    
    mn4_val = mn_indices[0][1]
    mn5_val = mn_indices[1][1]
    mn6_val = mn_indices[2][1]

    mu11_val = data['muii'][idx1]
    mu22_val = data['muii'][idx2]
    mu33_val = data['muii'][idx3]

    mn7_val = mn4_val + mu11_val
    mn8_val = mn5_val + mu22_val
    mn9_val = mn6_val + mu33_val
    
    return [
        mn4_val, mn5_val, mn6_val,
        mn7_val, mn8_val, mn9_val
    ]

# 