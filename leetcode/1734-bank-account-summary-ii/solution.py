import pandas as pd

def account_summary(users: pd.DataFrame, transactions: pd.DataFrame) -> pd.DataFrame:
    df = transactions.groupby('account')['amount'].sum().reset_index(name='balance')
    df2 = df[df['balance'] > 10000].merge(users, how='inner', on='account')
    df2 = df2.rename(columns={
        'name':'NAME',
        'balance':'BALANCE'
    })
    return df2[['NAME', 'BALANCE']]
