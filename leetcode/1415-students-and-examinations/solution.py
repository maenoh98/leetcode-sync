import pandas as pd

def students_and_examinations(students: pd.DataFrame, subjects: pd.DataFrame, examinations: pd.DataFrame) -> pd.DataFrame:
    df = students.merge(subjects, how='cross').sort_values(['student_id', 'subject_name'])
    exams_count = (
        examinations
            .groupby(['student_id', 'subject_name'])
            .size()
            .reset_index(name='attended_exams')
            .fillna({'attended_exams':0})
    )

    df_final = df.merge(exams_count, how='left', on=['student_id', 'subject_name']).fillna({'attended_exams':0})

    return df_final
