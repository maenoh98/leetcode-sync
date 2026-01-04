import pandas as pd

def largest_orders(orders: pd.DataFrame) -> pd.DataFrame:
    df = orders.groupby('customer_number')['order_number'].count().reset_index()

    df = df.sort_values(by='order_number', ascending=False).reset_index(drop=True)

    return df.iloc[[0]][['customer_number']]
