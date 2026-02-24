import pandas as pd

def find_valid_emails(users: pd.DataFrame) -> pd.DataFrame:
    df = users[users["email"].str.contains(r'^[A-Za-z0-9_]+@[A-Za-z]+\.com$', regex=True)]

    return df.sort_values('user_id')
