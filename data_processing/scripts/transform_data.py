import pandas as pd

def transform_data(df):
    # Example transformation: lowercase all text in a specific column
    df['text_column'] = df['text_column'].str.lower()
    
    # Additional transformations as needed
    # ...
    
    return df
