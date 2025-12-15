import pandas as pd

def article_views(views: pd.DataFrame) -> pd.DataFrame:
    df = views[views['author_id']==views['viewer_id']]
    group_df = df.groupby('author_id')['article_id'].count().reset_index()
    final_df = group_df.rename(columns={'author_id': 'id'})
    return final_df[['id']]
