--set work_mem = '512MB'
SELECT * FROM pg_catalog.pg_tables order by tablename asc

drop table rpo_aac_sk
rpo_ba_acc, rpo_bardejov_acc, rpo_bb_acc, rpo_datacube_cities, rpo_ke_acc, rpo_liptmik_acc, rpo_nitra_acc, rpo_piesta_acc, rpo_pp_acc, rpo_trenteplice_acc, rpo_za_acc

with new_values as ( 
    select 'Bratislava' as municipality,
	sum("2001") "2001", 
    sum("2002") "2002",
    sum("2003") "2003",
    sum("2004") "2004",
    sum("2005") "2005",
    sum("2006") "2006",
    sum("2007") "2007",
    sum("2008") "2008",
    sum("2009") "2009", sum("2010") "2010",
    sum("2011") "2011",
    sum("2012") "2012",
    sum("2013") "2013",
    sum("2014") "2014",
    sum("2015") "2015",
    sum("2016") "2016",
    sum("2017") "2017"
    from rpo_aac_sk where municipality like '%Bratislava%') 
update rpo_aac_sk as tr set
     "2001" = nv."2001",
     "2002" = nv."2002",
     "2003" = nv."2003",
     "2004" = nv."2004",
     "2005" = nv."2005",
     "2006" = nv."2006",
     "2007" = nv."2007",
     "2008" = nv."2008",
     "2009" = nv."2009",
     "2010" = nv."2010",
     "2011" = nv."2011",
     "2012" = nv."2012",
     "2013" = nv."2013",
     "2014" = nv."2014",
     "2015" = nv."2015",
     "2016" = nv."2016",
     "2017" = nv."2017"
from new_values nv where nv.municipality = tr.municipality;

select * from rpo_aac_sk limit 1

create table rpo_ba_acc as
select 'Bratislava'::varchar as municipality,
	sum("2001") "2001", 
    sum("2002") "2002",
    sum("2003") "2003",
    sum("2004") "2004",
    sum("2005") "2005",
    sum("2006") "2006",
    sum("2007") "2007",
    sum("2008") "2008",
    sum("2009") "2009", sum("2010") "2010",
    sum("2011") "2011",
    sum("2012") "2012",
    sum("2013") "2013",
    sum("2014") "2014",
    sum("2015") "2015",
    sum("2016") "2016",
    sum("2017") "2017"
    from rpo_aac_sk where municipality like '%Bratislava%';
    
    
create table rpo_ke_acc as
select 'Košice'::varchar as municipality,
	sum("2001") "2001", 
    sum("2002") "2002",
    sum("2003") "2003",
    sum("2004") "2004",
    sum("2005") "2005",
    sum("2006") "2006",
    sum("2007") "2007",
    sum("2008") "2008",
    sum("2009") "2009", sum("2010") "2010",
    sum("2011") "2011",
    sum("2012") "2012",
    sum("2013") "2013",
    sum("2014") "2014",
    sum("2015") "2015",
    sum("2016") "2016",
    sum("2017") "2017"
    from rpo_aac_sk where municipality like '%Košice%';
    
delete from rpo_aac_sk where municipality like '%Bratislava%';
delete from rpo_aac_sk where municipality like '%Košice%';

select * from rpo_aac_sk where municipality like '%Banská Bystrica%' or municipality like '%Ban. Bystrica%'order by municipality

create table rpo_bb_acc as
select 'Banská Bystrica'::varchar as municipality,
	sum("2001") "2001", 
    sum("2002") "2002",
    sum("2003") "2003",
    sum("2004") "2004",
    sum("2005") "2005",
    sum("2006") "2006",
    sum("2007") "2007",
    sum("2008") "2008",
    sum("2009") "2009", sum("2010") "2010",
    sum("2011") "2011",
    sum("2012") "2012",
    sum("2013") "2013",
    sum("2014") "2014",
    sum("2015") "2015",
    sum("2016") "2016",
    sum("2017") "2017"
    from rpo_aac_sk where municipality like '%Banská Bystrica%' or municipality like '%Ban. Bystrica%';
    
delete from rpo_aac_sk where municipality like '%Banská Bystrica%' or municipality like '%Ban. Bystrica%';



select * from rpo_aac_sk where municipality like '%Bardejov%' order by municipality


create table rpo_bardejov_acc as
select 'Bardejov'::varchar as municipality,
	sum("2001") "2001", 
    sum("2002") "2002",
    sum("2003") "2003",
    sum("2004") "2004",
    sum("2005") "2005",
    sum("2006") "2006",
    sum("2007") "2007",
    sum("2008") "2008",
    sum("2009") "2009", sum("2010") "2010",
    sum("2011") "2011",
    sum("2012") "2012",
    sum("2013") "2013",
    sum("2014") "2014",
    sum("2015") "2015",
    sum("2016") "2016",
    sum("2017") "2017"
    from rpo_aac_sk where municipality like '%Bardejov%';

delete from rpo_aac_sk where municipality like '%Bardejov%';
select * from rpo_aac_sk order by municipality;




select * from rpo_aac_sk where municipality like 'Poprad%';

create table rpo_pp_acc as
select 'Poprad'::varchar as municipality,
	sum("2001") "2001", 
    sum("2002") "2002",
    sum("2003") "2003",
    sum("2004") "2004",
    sum("2005") "2005",
    sum("2006") "2006",
    sum("2007") "2007",
    sum("2008") "2008",
    sum("2009") "2009", sum("2010") "2010",
    sum("2011") "2011",
    sum("2012") "2012",
    sum("2013") "2013",
    sum("2014") "2014",
    sum("2015") "2015",
    sum("2016") "2016",
    sum("2017") "2017"
    from rpo_aac_sk where municipality like 'Poprad%';


select * from rpo_aac_sk where municipality like '%Nitra%';

create table rpo_nitra_acc as
select 'Nitra'::varchar as municipality,
	sum("2001") "2001", 
    sum("2002") "2002",
    sum("2003") "2003",
    sum("2004") "2004",
    sum("2005") "2005",
    sum("2006") "2006",
    sum("2007") "2007",
    sum("2008") "2008",
    sum("2009") "2009", sum("2010") "2010",
    sum("2011") "2011",
    sum("2012") "2012",
    sum("2013") "2013",
    sum("2014") "2014",
    sum("2015") "2015",
    sum("2016") "2016",
    sum("2017") "2017"
    from rpo_aac_sk where municipality like '%Nitra%';
    
select * from rpo_aac_sk where municipality like '%Piešťany%';

create table rpo_piesta_acc as
select 'Piešťany'::varchar as municipality,
	sum("2001") "2001", 
    sum("2002") "2002",
    sum("2003") "2003",
    sum("2004") "2004",
    sum("2005") "2005",
    sum("2006") "2006",
    sum("2007") "2007",
    sum("2008") "2008",
    sum("2009") "2009", sum("2010") "2010",
    sum("2011") "2011",
    sum("2012") "2012",
    sum("2013") "2013",
    sum("2014") "2014",
    sum("2015") "2015",
    sum("2016") "2016",
    sum("2017") "2017"
    from rpo_aac_sk where municipality like '%Piešťany%';
    
select * from rpo_aac_sk where municipality like '%Žilina%'; 

create table rpo_za_acc as
select 'Žilina'::varchar as municipality,
	sum("2001") "2001", 
    sum("2002") "2002",
    sum("2003") "2003",
    sum("2004") "2004",
    sum("2005") "2005",
    sum("2006") "2006",
    sum("2007") "2007",
    sum("2008") "2008",
    sum("2009") "2009", sum("2010") "2010",
    sum("2011") "2011",
    sum("2012") "2012",
    sum("2013") "2013",
    sum("2014") "2014",
    sum("2015") "2015",
    sum("2016") "2016",
    sum("2017") "2017"
    from rpo_aac_sk where municipality like '%Žilina%';

select * from rpo_aac_sk where municipality like '%Trenčianske Teplice%'; 


create table rpo_trenteplice_acc as
select 'Trenčianske Teplice'::varchar as municipality,
	sum("2001") "2001", 
    sum("2002") "2002",
    sum("2003") "2003",
    sum("2004") "2004",
    sum("2005") "2005",
    sum("2006") "2006",
    sum("2007") "2007",
    sum("2008") "2008",
    sum("2009") "2009", sum("2010") "2010",
    sum("2011") "2011",
    sum("2012") "2012",
    sum("2013") "2013",
    sum("2014") "2014",
    sum("2015") "2015",
    sum("2016") "2016",
    sum("2017") "2017"
    from rpo_aac_sk where municipality like '%Trenčianske Teplice%';


select * from rpo_aac_sk where municipality like '%Liptovský Mikuláš%'; 


create table rpo_liptmik_acc as
select 'Liptovský Mikuláš'::varchar as municipality,
	sum("2001") "2001", 
    sum("2002") "2002",
    sum("2003") "2003",
    sum("2004") "2004",
    sum("2005") "2005",
    sum("2006") "2006",
    sum("2007") "2007",
    sum("2008") "2008",
    sum("2009") "2009", sum("2010") "2010",
    sum("2011") "2011",
    sum("2012") "2012",
    sum("2013") "2013",
    sum("2014") "2014",
    sum("2015") "2015",
    sum("2016") "2016",
    sum("2017") "2017"
    from rpo_aac_sk where municipality like '%Liptovský Mikuláš%';

create table rpo_datacube_cities as (
with xxx as (
select * from rpo_ba_acc
union all
select * from rpo_ke_acc
union all
select * from rpo_bb_acc
union all
select * from rpo_trenteplice_acc
union all
select * from rpo_liptmik_acc
union all
select * from rpo_pp_acc
union all
select * from rpo_nitra_acc
union all
select * from rpo_piesta_acc
union all
select * from rpo_za_acc
)
select * from xxx order by municipality) 

select * from rpo_datacube_cities
