import pandas as pd

def find_customers(customers: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    df = customers[~customers['id'].isin(orders['customerId'])]
    df.drop(columns=['id'], inplace=True)
    df.columns = ['Customers']
    return df
