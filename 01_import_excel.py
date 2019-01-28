from sqlalchemy import create_engine, MetaData, Table
import pandas as pd




exec(open("D:\\2018_Python_testovanie\\csb\\04_engine_gis_zaloha.py").read())



file = 'D:\\001_CS_publik\\rozrobene\\sustainibility_22022019\\occ_tax_cities.xlsx'

data =  pd.ExcelFile(file)
print(data.sheet_names)
df1 = data.parse('abc')

df1.to_sql('city_occ_tax', engine, if_exists='replace')

print(df1[0:6])


