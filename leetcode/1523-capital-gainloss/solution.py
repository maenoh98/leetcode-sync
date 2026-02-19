import pandas as pd

def capital_gainloss(stocks: pd.DataFrame) -> pd.DataFrame:
    stocks['capital_price'] = (
        stocks
        .apply(lambda row: -row['price'] 
            if row['operation']=='Buy' 
            else row['price'],
            axis=1)
        )

    df = stocks.groupby('stock_name')['capital_price'].sum().reset_index(name='capital_gain_loss')

    return df
