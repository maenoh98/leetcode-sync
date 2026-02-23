import pandas as pd

def analyze_subscription_conversion(user_activity: pd.DataFrame) -> pd.DataFrame:
    df = user_activity[user_activity['activity_type']=='paid'][['user_id']].drop_duplicates('user_id')

    trial = (
        user_activity[user_activity['activity_type']=='free_trial']
        .groupby('user_id')['activity_duration']
        .mean()
        .round(2)
        .reset_index(name='trial_avg_duration')
    )

    paid = (
        user_activity[user_activity['activity_type']=='paid']
        .groupby('user_id')['activity_duration']
        .mean()
        .reset_index(name='paid_avg_duration')
    ) 

    paid['paid_avg_duration'] = (paid['paid_avg_duration'] + 1e-8).round(2)

    df = (df.merge(trial, how='left', on='user_id')).merge(paid, how='left', on='user_id')

    return df
