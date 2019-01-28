create table rpo.new_allacm as
select * from
(select * from rpo.organization_economic_activity_entries 
    where description like '%Ubytovacie služby%' or 
 	description like '%ubytovacie služby%' or
	description like '%ubytovanie%' or
	description like '%Ubytovanie%' or   
	description like '%ubyotovania%' or
    description like '%ubytovacích služieb%'
    order by description ASC) as xxx
    where description not like '%bez ubytovacích zariadení%' or
    description not like '%bez ubytovacích služieb%' or
  	description not like '%bez ubytovania%' or
    description not like '%bez poskytovania ubytovania%' or
    description not like '%bez poskytovania ubytovacích služieb%';