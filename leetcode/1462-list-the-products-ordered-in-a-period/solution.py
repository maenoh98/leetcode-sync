import pandas as pd

def list_products(products: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    con = (orders['order_date'] >= '2020-02-01') & (orders['order_date'] <= '2020-02-29')

    df = orders[con].groupby('product_id')['unit'].sum().reset_index(name='unit')

    con2 = df['unit'] >= 100

    df2 = df[con2].merge(products, how='inner', on='product_id').drop(columns='product_id')

    return df2[['product_name', 'unit']]
