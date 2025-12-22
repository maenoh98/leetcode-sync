import pandas as pd

def nth_highest_salary(employee: pd.DataFrame, N: int) -> pd.DataFrame:

    employee.drop_duplicates(subset=['salary'], keep='first', inplace=True)
    employee.sort_values(by='salary', ascending=False, inplace=True)
    employee.reset_index(drop=True, inplace=True)
    
    employee.rename(columns={'salary':f'getNthHighestSalary({N})'}, inplace=True)
    
    if 0 < N <= len(employee):
        df = employee.iloc[[N-1]][[f'getNthHighestSalary({N})']]
    else:
        df = pd.DataFrame({
            f'getNthHighestSalary({N})':[None]
        })

    return df
