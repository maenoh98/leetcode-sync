import pandas as pd

def find_managers(employee: pd.DataFrame) -> pd.DataFrame:
    df = employee.groupby('managerId')['id'].count().reset_index(name='cnt')
    df2 = df.merge(employee[['id', 'name']], how='inner', left_on='managerId', right_on='id')

    return df2[df2['cnt']>=5][['name']]
