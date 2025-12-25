import pandas as pd

def department_highest_salary(employee: pd.DataFrame, department: pd.DataFrame) -> pd.DataFrame:

    dept_max = (
        employee.groupby(by='departmentId')
            .agg({'salary' : 'max'})
            .reset_index()
    )
    
    emp = employee.merge(dept_max, on='departmentId', how='inner')

    filtered_emp = emp[emp['salary_x'] == emp['salary_y']]

    merged_emp = filtered_emp[['name', 'salary_x', 'departmentId']].merge(
        department
        , left_on = 'departmentId'
        , right_on = 'id'
        , how = 'left'
        )
    
    final = merged_emp.drop(columns = ['departmentId', 'id'])
    final.rename(columns={
        'name_x' : 'Employee'
        , 'salary_x' : 'Salary'
        , 'name_y' : 'Department'
    }, inplace = True)

    return final[['Department', 'Employee', 'Salary']]
