import pandas as pd

def sales_analysis(product: pd.DataFrame, sales: pd.DataFrame) -> pd.DataFrame:

    df = sales.groupby('product_id').agg(
        min_date = ('sale_date', 'min'),
        max_date = ('sale_date', 'max')
    ).reset_index()

    con = (df['min_date'] >= '2019-01-01') & (df['max_date'] <= '2019-03-31')

    df = df[con][['product_id']].merge(product[['product_id', 'product_name']], how='inner', on='product_id')

    return df
