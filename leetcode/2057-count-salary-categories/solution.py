import pandas as pd

def salary_categories(salary):
    if salary < 20000:
        return 'Low Salary'
    elif (salary >= 20000) & (salary <= 50000):
        return 'Average Salary'
    else:
        return 'High Salary'

def count_salary_categories(accounts: pd.DataFrame) -> pd.DataFrame:
    all_categories = ['Low Salary', 'Average Salary', 'High Salary']

    df = accounts.copy()
    df['category'] = df['income'].apply(salary_categories)

    final_df = (
        df.groupby('category')['account_id']
        .count()
        .reindex(all_categories, fill_value=0)
        .reset_index(name='accounts_count')
    )

    return final_df
