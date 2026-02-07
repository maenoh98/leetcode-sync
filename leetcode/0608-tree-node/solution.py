import pandas as pd

def tree_node(tree: pd.DataFrame) -> pd.DataFrame:
    child_cnt = tree.groupby('p_id')['id'].nunique().reset_index(name='c_cnt')

    df = tree.merge(child_cnt, how='left', left_on='id', right_on='p_id')

    df['type'] = df.apply(node_type, axis=1)

    return df[['id', 'type']]

def node_type(nodes: pd.DataFrame):
    if pd.isna(nodes['p_id_x']):
        return 'Root'
    if pd.isna(nodes['c_cnt']):
        return 'Leaf'
    else:
        return 'Inner'
