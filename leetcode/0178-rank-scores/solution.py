import pandas as pd

def order_scores(scores: pd.DataFrame) -> pd.DataFrame:
    df = scores.copy()
    df['rank'] = df['score'].rank(method='dense', ascending=False)
    
    return df[['score', 'rank']].sort_values('rank').reset_index(drop=True)
