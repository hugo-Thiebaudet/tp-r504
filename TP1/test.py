import pytest
import fonctiond as f 

def test_1():
		assert f.puissance(2,3) == 8
		assert f.puissance(2,2) == 4

def test_2():
		assert f.puissance(-6,2) == 36
		assert f.puissance(-5,3) == -125
