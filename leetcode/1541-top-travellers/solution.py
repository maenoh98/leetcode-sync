import pandas as pd

def top_travellers(users: pd.DataFrame, rides: pd.DataFrame) -> pd.DataFrame:
    df = rides.groupby('user_id')['distance'].sum().reset_index(name='travelled_distance')
    
    df = df.merge(users, how='right', left_on='user_id', right_on='id').fillna(0).sort_values(by=['travelled_distance', 'name'], ascending=[False, True])

    return df[['name', 'travelled_distance']]
