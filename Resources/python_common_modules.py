import pandas as pd
from collections import defaultdict
from pandas.testing import assert_frame_equal

excel_path= 'Data/drop_down_menu_data.xlsx'
csv_path=   'nameprice.csv'

def CombineCsvFiles(file1, file2, combined_file):
    df1 = pd.read_csv(file1,header=None)
    df2 = pd.read_csv(file2,header=None)
    combined_df = pd.concat([df1, df2], axis=1, ignore_index=True)
    combined_df.columns = ['name', 'price']
    combined_df.to_csv(combined_file, index=False)

def MatchData(num):
    df1= pd.read_excel(excel_path)
    df2= pd.read_csv(csv_path)
    sorting_criteria = defaultdict(lambda: (None, None, None, None), {
    1: ('name', 1, 'price', 1),
    2: ('name', 0, 'price', 1),
    3: ('price', 1, 'name', 1),
    4: ('price', 0, 'name', 1)
    })
    print(sorting_criteria[int(num)])
    column1,criteria1,column2,criteria2 = sorting_criteria[int(num)]
    df1['price'] = df1['price'].str.replace('$', '').astype(float)
    df2['price'] = df2['price'].str.replace('$', '').astype(float)
    df1 = df1.sort_values(by=[column1, column2], ascending=[bool(criteria1), bool(criteria2)], ignore_index=True)
    try:
        assert_frame_equal(df1, df2)
        truth_value = True
    except AssertionError:
        truth_value = False
    return truth_value

def GetMessage(truth_value):
    if int(truth_value) == 1:
        message = 'Success: Test passed - Items are correctly displayed!'
    else:
        message = 'Fail: Test failed - Items are not correctly displayed!'
    return message

def ShoppingCartAdd(file):
    shopping_cart_df = pd.read_csv(file, header=None)
    shopping_cart_df[0] = shopping_cart_df[0].apply(lambda x: f"add-to-cart-sauce-labs-{x}")
    shopping_cart_list = shopping_cart_df[0].tolist()
    return shopping_cart_list

def CartList(file):
    shopping_cart_df = pd.read_csv(file, header=None)
    shopping_cart_df[0] = shopping_cart_df[0].apply(lambda x: f"{x}")
    shopping_cart_list = shopping_cart_df[0].tolist()
    shopping_cart_list = shopping_cart_list[1:]
    shopping_cart_list = [item.replace('Sauce Labs ', '').lower() for item in shopping_cart_list]
    return shopping_cart_list

def UserList(file):
    shopping_cart_df = pd.read_csv(file, header=None)
    shopping_cart_list = shopping_cart_df[0].tolist()
    shopping_cart_list = [item.replace('-', ' ').lower() for item in shopping_cart_list]
    return shopping_cart_list

def MatchList(l1,l2):
    l1 = sorted(l1)
    l2 = sorted(l2)
    if l1 == l2:
        truth_value = True
    else:
        truth_value = False
    return  truth_value

def GetMessageCart(truth_value):
    if int(truth_value) == 1:
        message = 'Success: Test passed - Items addition is successful'
    else:
        message = 'Fail: Test failed - Items are not added!'
    return message