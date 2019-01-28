#In order for reuse, create own engine
from sqlalchemy import create_engine, MetaData, Table
import pandas as pd

exec(open("path to engine").read())
file = 'path to file'
data =  pd.ExcelFile(file)
print(data.sheet_names)
df1 = data.parse('abc')

df1.to_sql('city_occ_tax', engine, if_exists='replace')




