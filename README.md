# meta_occupancy_tax
Methodological set of queries for identifying potential stakeholders with obligation to occupancy tax created over slovensko.digital's RUZ and RPO with the combination of SUSR's datacube data and municipality data.

## 01_import_excel.py  
Regular basic python script for importing Excel spreadsheets into pgsql database.  

## 02_ruz_acc_municipality.sql  
Query for extracting annual number accommodation service providers by registered seat and NACE ID from the RUZ API

## 03a_rpo_acc_key_words.sql  
Query for extracting business activities relevant for accommodation serivces prosivison by key words (exclusion of bias words) copying the ISIC methodlogy from the RPO API.  

## 03b_rpo_municipality.sql 
Query for combining results of 3a with registered municipalities.  

## 03c_rpo_cleaning_city_data.sql  
Cleaning and formating queris for 3b results.

## 04_tax_calculations.sql
Set of queries used for calcuation over the merged extracted data for identifying deviations and risks in occupanccy tax collection.



# Source list of pilot municipalities regulation on occupancy tax  
Banská Bystrica: http://www.banskabystrica.sk/vseobecne-zavazne-nariadenia-mesta-vzn.phtml?id3=1622  
Bratislava: https://www.bratislava.sk/sk/legislativa-mesta  
Košice: https://www.kosice.sk/vzn  
Liptovský Mikuláš: http://www.mikulas.sk/sk/_zlozka.php?zlozka=64  
Nitra: https://www.nitra.sk/zobraz/sekciu/vzn  
Poprad: https://www.poprad.sk/vzn.phtml?id3=878  
Žilina: http://www.zilina.sk/mesto-zilina-uradna-tabula-mesta-vseobecne-zavazne-nariadenia-vzn-podla-datumu  

# Source list of pilot municipalities' annual accounts
Banská Bystrica: http://www.banskabystrica.sk/rozpocty-a-zaverecne-ucty-minulych-rokov.phtml?id3=24210  
Bratislava: https://www.bratislava.sk/sk/zaverecny-ucet  
Košice: https://www.kosice.sk/mesto/ekonomika  
Liptovský Mikuláš: http://www.mikulas.sk/sk/_zlozka.php?zlozka=62  
Nitra: https://www.nitra.sk/zobraz/sekciu/zaverecny-ucet  
Poprad: https://www.poprad.sk/rozpocet-mesta.phtml?id3=652  
Žilina:http://www.zilina.sk/mesto-zilina-uradna-tabula-mesta-rozpocet-mesta  
