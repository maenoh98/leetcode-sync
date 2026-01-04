import pandas as pd

def categorize_products(activities: pd.DataFrame) -> pd.DataFrame:
    df = (
        activities.groupby('sell_date')['product']
        .apply(lambda s: ','.join(sorted(s.unique())))
        .reset_index(name='products')
    )

    df['num_sold'] = df['products'].str.count(',')+1

    return df[['sell_date', 'num_sold', 'products']]
