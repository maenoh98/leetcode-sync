import pandas as pd

def most_friends(request_accepted: pd.DataFrame) -> pd.DataFrame:
    df1 = (
        request_accepted[['requester_id', 'accepter_id']]
        .rename(columns={
            'requester_id' : 'id',
            'accepter_id' : 'num'
        })
        )

    df2 = (
        request_accepted[['accepter_id', 'requester_id']]
        .rename(columns={
            'accepter_id' : 'id',
            'requester_id' : 'num'
        })
        )

    df_union = pd.concat([df1, df2], ignore_index=True).drop_duplicates()

    df = df_union.groupby('id')['num'].nunique().reset_index().sort_values(['num'], ascending=False)

    return df.head(1)
