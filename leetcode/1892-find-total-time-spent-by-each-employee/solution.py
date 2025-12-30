import pandas as pd

def total_time(employees: pd.DataFrame) -> pd.DataFrame:
    df = employees.copy()
    df['total_time'] = df['out_time'] - df['in_time']
    
    df.rename(columns={
        'event_day':'day'
    }, inplace=True)

    df_goruped = df.groupby(['day', 'emp_id'])['total_time'].sum().reset_index()

    return df_goruped
