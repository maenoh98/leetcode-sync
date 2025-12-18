import pandas as pd
import numpy as np

def calculate_special_bonus(employees: pd.DataFrame) -> pd.DataFrame:
    con1 = employees['employee_id'] % 2 == 1
    con2 = employees['name'].str[0] != 'M'
    employees['bonus'] = np.where(con1 & con2, employees['salary'], 0)
    return employees.sort_values(by='employee_id')[['employee_id', 'bonus']]
