import pandas as pd

def reformat_table(department: pd.DataFrame) -> pd.DataFrame:
        
    df = pd.pivot_table(
        department,
        values='revenue',
        index='id',
        columns='month',
        aggfunc='sum'
    ).reset_index()

    months = [
        "Jan","Feb","Mar","Apr","May","Jun",
        "Jul","Aug","Sep","Oct","Nov","Dec"
    ]

    df.columns = [
        col if col == 'id' else f"{col}_Revenue"
        for col in df.columns
    ]

    df = df.reindex(
        columns=['id'] + [f"{m}_Revenue" for m in months]
    )

    return df
