import pandas as pd

def find_classes(courses: pd.DataFrame) -> pd.DataFrame:
    df = courses.groupby('class')['student'].nunique().reset_index(name='cnt')

    return df[df['cnt'] >= 5][['class']]
