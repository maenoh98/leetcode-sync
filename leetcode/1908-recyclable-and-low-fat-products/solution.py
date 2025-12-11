import pandas as pd

def find_products(products: pd.DataFrame) -> pd.DataFrame:
    con1 = products['low_fats']=='Y'
    con2 = products['recyclable']=='Y'
    df = products[con1 & con2]
    return df[['product_id']]
