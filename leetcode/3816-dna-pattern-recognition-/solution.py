import pandas as pd

def analyze_dna_patterns(samples: pd.DataFrame) -> pd.DataFrame:
    df = samples.copy()
    df['has_start'] = df['dna_sequence'].str.startswith('ATG').astype(int)
    df['has_stop'] = df['dna_sequence'].str.endswith(('TAA', 'TAG', 'TGA')).astype(int)
    df['has_atat'] = df['dna_sequence'].str.contains('ATAT').astype(int)
    df['has_ggg'] = df['dna_sequence'].str.contains(r'G{3,}').astype(int)

    return df
