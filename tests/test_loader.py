# import pytest
import pandas as pd
from src.data_loader import load_raw


def test_load_raw_returns_dataframe(tmp_path):
    """
    Unit-Test-Stub: Prüft, dass load_raw für einen gegebenen Pfad
    einen pandas DataFrame zurückgibt.
    """
    # tmp_path ist ein pytest-Feature, das ein temporäres Verzeichnis bereitstellt
    df = load_raw(str(tmp_path))
    assert isinstance(df, pd.DataFrame)
