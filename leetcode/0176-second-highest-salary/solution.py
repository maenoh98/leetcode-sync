import pandas as pd

def second_highest_salary(employee: pd.DataFrame) -> pd.DataFrame:
    col = 'SecondHighestSalary'
    
    emp = (
        employee['salary']
        .dropna()
        .drop_duplicates()
        .sort_values(ascending=False)
        .reset_index(drop=True)
    )

    if len(emp) < 2:
        return pd.DataFrame({col:[None]})

    return pd.DataFrame({col: [emp.iloc[1]]})
