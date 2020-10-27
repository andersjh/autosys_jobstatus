pip install wheel
del *.whl
python setup.py bdist_wheel
copy dist\*