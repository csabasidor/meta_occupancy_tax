--average nights per accommodation facility //susr

insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")


select municipality_id, city, 'susr_avg_night_per_acc' as var_type,
round(vt_susr_n_nights."2008" ::numeric / nullif(vt_susr_n_acc."2008"::numeric, 0), 0) "2008",
round(vt_susr_n_nights."2009" ::numeric / nullif(vt_susr_n_acc."2009"::numeric, 0), 0) "2009",
round(vt_susr_n_nights."2010" ::numeric / nullif(vt_susr_n_acc."2010"::numeric, 0), 0) "2010",
round(vt_susr_n_nights."2011" ::numeric / nullif(vt_susr_n_acc."2011"::numeric, 0), 0) "2011",
round(vt_susr_n_nights."2012" ::numeric / nullif(vt_susr_n_acc."2012"::numeric, 0), 0) "2012",
round(vt_susr_n_nights."2013" ::numeric / nullif(vt_susr_n_acc."2013"::numeric, 0), 0) "2013",
round(vt_susr_n_nights."2014" ::numeric / nullif(vt_susr_n_acc."2014"::numeric, 0), 0) "2014",
round(vt_susr_n_nights."2015" ::numeric / nullif(vt_susr_n_acc."2015"::numeric, 0), 0) "2015",
round(vt_susr_n_nights."2016" ::numeric / nullif(vt_susr_n_acc."2016"::numeric, 0), 0) "2016",
round(vt_susr_n_nights."2017" ::numeric / nullif(vt_susr_n_acc."2017"::numeric, 0), 0) "2017"


from city_base vt_susr_n_nights
join city_base vt_susr_n_acc using(municipality_id, city)
where vt_susr_n_nights.var_type = 'susr_n_nights'
and vt_susr_n_acc.var_type = 'susr_n_acc';

----number of nights //ruz

insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'ruz_n_nights' as var_type,
vt_ruz_n_acc."2008" ::numeric * vt_susr_avg_night_per_acc."2008"::numeric "2008",
vt_ruz_n_acc."2009" ::numeric * vt_susr_avg_night_per_acc."2009"::numeric "2009",
vt_ruz_n_acc."2010" ::numeric * vt_susr_avg_night_per_acc."2010"::numeric "2010",
vt_ruz_n_acc."2011" ::numeric * vt_susr_avg_night_per_acc."2011"::numeric "2011",
vt_ruz_n_acc."2012" ::numeric * vt_susr_avg_night_per_acc."2012"::numeric "2012",
vt_ruz_n_acc."2013" ::numeric * vt_susr_avg_night_per_acc."2013"::numeric "2013",
vt_ruz_n_acc."2014" ::numeric * vt_susr_avg_night_per_acc."2014"::numeric "2014",
vt_ruz_n_acc."2015" ::numeric * vt_susr_avg_night_per_acc."2015"::numeric "2015",
vt_ruz_n_acc."2016" ::numeric * vt_susr_avg_night_per_acc."2016"::numeric "2016",
vt_ruz_n_acc."2017" ::numeric * vt_susr_avg_night_per_acc."2017"::numeric "2017"


from city_base vt_ruz_n_acc
join city_base vt_susr_avg_night_per_acc using(municipality_id, city)
where vt_ruz_n_acc.var_type = 'ruz_n_acc'
and vt_susr_avg_night_per_acc.var_type = 'susr_avg_night_per_acc';

----number of nights //rpo

insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")

select municipality_id, city, 'rpo_n_nights' as var_type,
vt_rpo_n_acc."2008" ::numeric * vt_susr_avg_night_per_acc."2008"::numeric "2008",
vt_rpo_n_acc."2009" ::numeric * vt_susr_avg_night_per_acc."2009"::numeric "2009",
vt_rpo_n_acc."2010" ::numeric * vt_susr_avg_night_per_acc."2010"::numeric "2010",
vt_rpo_n_acc."2011" ::numeric * vt_susr_avg_night_per_acc."2011"::numeric "2011",
vt_rpo_n_acc."2012" ::numeric * vt_susr_avg_night_per_acc."2012"::numeric "2012",
vt_rpo_n_acc."2013" ::numeric * vt_susr_avg_night_per_acc."2013"::numeric "2013",
vt_rpo_n_acc."2014" ::numeric * vt_susr_avg_night_per_acc."2014"::numeric "2014",
vt_rpo_n_acc."2015" ::numeric * vt_susr_avg_night_per_acc."2015"::numeric "2015",
vt_rpo_n_acc."2016" ::numeric * vt_susr_avg_night_per_acc."2016"::numeric "2016",
vt_rpo_n_acc."2017" ::numeric * vt_susr_avg_night_per_acc."2017"::numeric "2017"


from city_base vt_rpo_n_acc
join city_base vt_susr_avg_night_per_acc using(municipality_id, city)
where vt_rpo_n_acc.var_type = 'rpo_n_acc'
and vt_susr_avg_night_per_acc.var_type = 'susr_avg_night_per_acc';


-----ratio of taxable nights
insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'ratio_taxable_nights' as var_type,
round(vt_n_nights_susr."2008" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2008"::numeric, 0), 2) "2008",
round(vt_n_nights_susr."2009" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2009"::numeric, 0), 2) "2009",
round(vt_n_nights_susr."2010" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2010"::numeric, 0), 2) "2010",
round(vt_n_nights_susr."2011" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2011"::numeric, 0), 2) "2011",
round(vt_n_nights_susr."2012" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2012"::numeric, 0), 2) "2012",
round(vt_n_nights_susr."2013" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2013"::numeric, 0), 2) "2013",
round(vt_n_nights_susr."2014" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2014"::numeric, 0), 2) "2014",
round(vt_n_nights_susr."2015" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2015"::numeric, 0), 2) "2015",
round(vt_n_nights_susr."2016" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2016"::numeric, 0), 2) "2016",
round(vt_n_nights_susr."2017" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2017"::numeric, 0), 2) "2017"


from city_base vt_n_nights_susr
join city_base vt_n_nights_real_tax_div_tax_rate using(municipality_id, city)
where vt_n_nights_susr.var_type = 'n_nights_susr'
and vt_n_nights_real_tax_div_tax_rate.var_type = 'n_nights_real_tax_div_tax_rate';


--UPDATE VARIABLE NAME TAGS

update city_base set var_type = 'n_acc_susr' where var_type = 'susr_n_acc';
update city_base set var_type = 'n_acc_ruz' where var_type = 'ruz_n_acc';
update city_base set var_type = 'n_acc_rpo' where var_type = 'rpo_n_acc';
update city_base set var_type = 'n_nights_susr' where var_type = 'susr_n_nights';
update city_base set var_type = 'n_nights_ruz' where var_type = 'ruz_n_nights';
update city_base set var_type = 'n_nights_ruz' where var_type = 'ruz_n_nights';
update city_base set var_type = 'n_nights_rpo' where var_type = 'rpo_n_nights';
update city_base set var_type = 'n_bed_susr' where var_type = 'susr_n_bed';
update city_base set var_type = 'n_tourist_susr' where var_type = 'susr_n_tourist';
update city_base set var_type = 'n_nights_real_tax_div_tax_rate' where var_type = 'nights_as_real_tax_div_tax_rate';


----control check 
select municipality_id, city, count(*) from city_base group by municipality_id, city
order by city;

select * from city_base where 
var_type = 'ratio_taxable_nights' 
and "2008" < 1
and "2009" < 1 
and "2010" < 1 
and "2011" < 1 
and "2012" < 1 
and "2013" < 1 
and "2014" < 1 
and "2015" < 1 
and "2016" < 1 
and "2017" < 1
order by city, var_type;

select municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017"
from city_base
order by var_type, city;

------AVG BED PER ACC SUSR


select municipality_id, city, 'avg_bed_acc' as var_type,
round(vt_n_bed_susr."2008" ::numeric / nullif(vt_n_acc_susr."2008"::numeric, 0), 2) "2008",
round(vt_n_bed_susr."2009" ::numeric / nullif(vt_n_acc_susr."2009"::numeric, 0), 2) "2009",
round(vt_n_bed_susr."2010" ::numeric / nullif(vt_n_acc_susr."2010"::numeric, 0), 2) "2010",
round(vt_n_bed_susr."2011" ::numeric / nullif(vt_n_acc_susr."2011"::numeric, 0), 2) "2011",
round(vt_n_bed_susr."2012" ::numeric / nullif(vt_n_acc_susr."2012"::numeric, 0), 2) "2012",
round(vt_n_bed_susr."2013" ::numeric / nullif(vt_n_acc_susr."2013"::numeric, 0), 2) "2013",
round(vt_n_bed_susr."2014" ::numeric / nullif(vt_n_acc_susr."2014"::numeric, 0), 2) "2014",
round(vt_n_bed_susr."2015" ::numeric / nullif(vt_n_acc_susr."2015"::numeric, 0), 2) "2015",
round(vt_n_bed_susr."2016" ::numeric / nullif(vt_n_acc_susr."2016"::numeric, 0), 2) "2016",
round(vt_n_bed_susr."2017" ::numeric / nullif(vt_n_acc_susr."2017"::numeric, 0), 2) "2017"


from city_base vt_n_bed_susr
join city_base vt_n_acc_susr using(municipality_id, city)
where vt_n_bed_susr.var_type = 'n_bed_susr'
and vt_n_acc_susr.var_type = 'n_acc_susr';

---

insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017" from city_base_avg where 
var_type in ('avg_bed_acc_susr', 'avg_n_nights_bed_susr')
order by var_type


-----
insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'n_bed_ruz' as var_type,
round(vt_n_acc_ruz."2008" ::numeric * nullif(vt_avg_bed_acc_susr."2008"::numeric, 0), 0) "2008",
round(vt_n_acc_ruz."2009" ::numeric * nullif(vt_avg_bed_acc_susr."2009"::numeric, 0), 0) "2009",
round(vt_n_acc_ruz."2010" ::numeric * nullif(vt_avg_bed_acc_susr."2010"::numeric, 0), 0) "2010",
round(vt_n_acc_ruz."2011" ::numeric * nullif(vt_avg_bed_acc_susr."2011"::numeric, 0), 0) "2011",
round(vt_n_acc_ruz."2012" ::numeric * nullif(vt_avg_bed_acc_susr."2012"::numeric, 0), 0) "2012",
round(vt_n_acc_ruz."2013" ::numeric * nullif(vt_avg_bed_acc_susr."2013"::numeric, 0), 0) "2013",
round(vt_n_acc_ruz."2014" ::numeric * nullif(vt_avg_bed_acc_susr."2014"::numeric, 0), 0) "2014",
round(vt_n_acc_ruz."2015" ::numeric * nullif(vt_avg_bed_acc_susr."2015"::numeric, 0), 0) "2015",
round(vt_n_acc_ruz."2016" ::numeric * nullif(vt_avg_bed_acc_susr."2016"::numeric, 0), 0) "2016",
round(vt_n_acc_ruz."2017" ::numeric * nullif(vt_avg_bed_acc_susr."2017"::numeric, 0), 0) "2017"


from city_base vt_n_acc_ruz
join city_base vt_avg_bed_acc_susr using(municipality_id, city)
where vt_n_acc_ruz.var_type = 'n_acc_ruz'
and vt_avg_bed_acc_susr.var_type = 'avg_bed_acc_susr';

------
insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'n_bed_rpo' as var_type,
round(vt_n_acc_rpo."2008" ::numeric * nullif(vt_avg_bed_acc_susr."2008"::numeric, 0), 0) "2008",
round(vt_n_acc_rpo."2009" ::numeric * nullif(vt_avg_bed_acc_susr."2009"::numeric, 0), 0) "2009",
round(vt_n_acc_rpo."2010" ::numeric * nullif(vt_avg_bed_acc_susr."2010"::numeric, 0), 0) "2010",
round(vt_n_acc_rpo."2011" ::numeric * nullif(vt_avg_bed_acc_susr."2011"::numeric, 0), 0) "2011",
round(vt_n_acc_rpo."2012" ::numeric * nullif(vt_avg_bed_acc_susr."2012"::numeric, 0), 0) "2012",
round(vt_n_acc_rpo."2013" ::numeric * nullif(vt_avg_bed_acc_susr."2013"::numeric, 0), 0) "2013",
round(vt_n_acc_rpo."2014" ::numeric * nullif(vt_avg_bed_acc_susr."2014"::numeric, 0), 0) "2014",
round(vt_n_acc_rpo."2015" ::numeric * nullif(vt_avg_bed_acc_susr."2015"::numeric, 0), 0) "2015",
round(vt_n_acc_rpo."2016" ::numeric * nullif(vt_avg_bed_acc_susr."2016"::numeric, 0), 0) "2016",
round(vt_n_acc_rpo."2017" ::numeric * nullif(vt_avg_bed_acc_susr."2017"::numeric, 0), 0) "2017"


from city_base vt_n_acc_rpo
join city_base vt_avg_bed_acc_susr using(municipality_id, city)
where vt_n_acc_rpo.var_type = 'n_acc_rpo'
and vt_avg_bed_acc_susr.var_type = 'avg_bed_acc_susr';
----
insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'n_nights_ruz_p_bed' as var_type,
round(vt_n_bed_ruz."2008" ::numeric * nullif(vt_avg_n_nights_bed_susr."2008"::numeric, 0), 0) "2008",
round(vt_n_bed_ruz."2009" ::numeric * nullif(vt_avg_n_nights_bed_susr."2009"::numeric, 0), 0) "2009",
round(vt_n_bed_ruz."2010" ::numeric * nullif(vt_avg_n_nights_bed_susr."2010"::numeric, 0), 0) "2010",
round(vt_n_bed_ruz."2011" ::numeric * nullif(vt_avg_n_nights_bed_susr."2011"::numeric, 0), 0) "2011",
round(vt_n_bed_ruz."2012" ::numeric * nullif(vt_avg_n_nights_bed_susr."2012"::numeric, 0), 0) "2012",
round(vt_n_bed_ruz."2013" ::numeric * nullif(vt_avg_n_nights_bed_susr."2013"::numeric, 0), 0) "2013",
round(vt_n_bed_ruz."2014" ::numeric * nullif(vt_avg_n_nights_bed_susr."2014"::numeric, 0), 0) "2014",
round(vt_n_bed_ruz."2015" ::numeric * nullif(vt_avg_n_nights_bed_susr."2015"::numeric, 0), 0) "2015",
round(vt_n_bed_ruz."2016" ::numeric * nullif(vt_avg_n_nights_bed_susr."2016"::numeric, 0), 0) "2016",
round(vt_n_bed_ruz."2017" ::numeric * nullif(vt_avg_n_nights_bed_susr."2017"::numeric, 0), 0) "2017"


from city_base vt_n_bed_ruz
join city_base vt_avg_n_nights_bed_susr using(municipality_id, city)
where vt_n_bed_ruz.var_type = 'n_bed_ruz'
and vt_avg_n_nights_bed_susr.var_type = 'avg_n_nights_bed_susr';

-----
insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'n_nights_rpo_p_bed' as var_type,
round(vt_n_bed_rpo."2008" ::numeric * nullif(vt_avg_n_nights_bed_susr."2008"::numeric, 0), 0) "2008",
round(vt_n_bed_rpo."2009" ::numeric * nullif(vt_avg_n_nights_bed_susr."2009"::numeric, 0), 0) "2009",
round(vt_n_bed_rpo."2010" ::numeric * nullif(vt_avg_n_nights_bed_susr."2010"::numeric, 0), 0) "2010",
round(vt_n_bed_rpo."2011" ::numeric * nullif(vt_avg_n_nights_bed_susr."2011"::numeric, 0), 0) "2011",
round(vt_n_bed_rpo."2012" ::numeric * nullif(vt_avg_n_nights_bed_susr."2012"::numeric, 0), 0) "2012",
round(vt_n_bed_rpo."2013" ::numeric * nullif(vt_avg_n_nights_bed_susr."2013"::numeric, 0), 0) "2013",
round(vt_n_bed_rpo."2014" ::numeric * nullif(vt_avg_n_nights_bed_susr."2014"::numeric, 0), 0) "2014",
round(vt_n_bed_rpo."2015" ::numeric * nullif(vt_avg_n_nights_bed_susr."2015"::numeric, 0), 0) "2015",
round(vt_n_bed_rpo."2016" ::numeric * nullif(vt_avg_n_nights_bed_susr."2016"::numeric, 0), 0) "2016",
round(vt_n_bed_rpo."2017" ::numeric * nullif(vt_avg_n_nights_bed_susr."2017"::numeric, 0), 0) "2017"


from city_base vt_n_bed_rpo
join city_base vt_avg_n_nights_bed_susr using(municipality_id, city)
where vt_n_bed_rpo.var_type = 'n_bed_rpo'
and vt_avg_n_nights_bed_susr.var_type = 'avg_n_nights_bed_susr';

--------------------------------------
insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'occupancy_susr' as var_type,
round(vt_n_nights_susr."2008" ::numeric / nullif(vt_n_bed_susr."2008"::numeric*365, 0), 4) "2008",
round(vt_n_nights_susr."2009" ::numeric / nullif(vt_n_bed_susr."2009"::numeric*365, 0), 4) "2009",
round(vt_n_nights_susr."2010" ::numeric / nullif(vt_n_bed_susr."2010"::numeric*365, 0), 4) "2010",
round(vt_n_nights_susr."2011" ::numeric / nullif(vt_n_bed_susr."2011"::numeric*365, 0), 4) "2011",
round(vt_n_nights_susr."2012" ::numeric / nullif(vt_n_bed_susr."2012"::numeric*365, 0), 4) "2012",
round(vt_n_nights_susr."2013" ::numeric / nullif(vt_n_bed_susr."2013"::numeric*365, 0), 4) "2013",
round(vt_n_nights_susr."2014" ::numeric / nullif(vt_n_bed_susr."2014"::numeric*365, 0), 4) "2014",
round(vt_n_nights_susr."2015" ::numeric / nullif(vt_n_bed_susr."2015"::numeric*365, 0), 4) "2015",
round(vt_n_nights_susr."2016" ::numeric / nullif(vt_n_bed_susr."2016"::numeric*365, 0), 4) "2016",
round(vt_n_nights_susr."2017" ::numeric / nullif(vt_n_bed_susr."2017"::numeric*365, 0), 4) "2017"


from city_base vt_n_nights_susr
join city_base vt_n_bed_susr using(municipality_id, city)
where vt_n_nights_susr.var_type = 'n_nights_susr'
and vt_n_bed_susr.var_type = 'n_bed_susr';



-------------------------------------
insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'n_nights_ruz_by_occupancy' as var_type,
round(vt_occupancy_susr."2008" ::numeric * nullif(vt_n_bed_ruz."2008"::numeric*365, 0), 2) "2008",
round(vt_occupancy_susr."2009" ::numeric * nullif(vt_n_bed_ruz."2009"::numeric*365, 0), 2) "2009",
round(vt_occupancy_susr."2010" ::numeric * nullif(vt_n_bed_ruz."2010"::numeric*365, 0), 2) "2010",
round(vt_occupancy_susr."2011" ::numeric * nullif(vt_n_bed_ruz."2011"::numeric*365, 0), 2) "2011",
round(vt_occupancy_susr."2012" ::numeric * nullif(vt_n_bed_ruz."2012"::numeric*365, 0), 2) "2012",
round(vt_occupancy_susr."2013" ::numeric * nullif(vt_n_bed_ruz."2013"::numeric*365, 0), 2) "2013",
round(vt_occupancy_susr."2014" ::numeric * nullif(vt_n_bed_ruz."2014"::numeric*365, 0), 2) "2014",
round(vt_occupancy_susr."2015" ::numeric * nullif(vt_n_bed_ruz."2015"::numeric*365, 0), 2) "2015",
round(vt_occupancy_susr."2016" ::numeric * nullif(vt_n_bed_ruz."2016"::numeric*365, 0), 2) "2016",
round(vt_occupancy_susr."2017" ::numeric * nullif(vt_n_bed_ruz."2017"::numeric*365, 0), 2) "2017"


from city_base vt_occupancy_susr
join city_base vt_n_bed_ruz using(municipality_id, city)
where vt_occupancy_susr.var_type = 'occupancy_susr'
and vt_n_bed_ruz.var_type = 'n_bed_ruz';

------
insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'n_nights_rpo_by_occupancy' as var_type,
round(vt_occupancy_susr."2008" ::numeric * nullif(vt_n_bed_rpo."2008"::numeric*365, 0), 2) "2008",
round(vt_occupancy_susr."2009" ::numeric * nullif(vt_n_bed_rpo."2009"::numeric*365, 0), 2) "2009",
round(vt_occupancy_susr."2010" ::numeric * nullif(vt_n_bed_rpo."2010"::numeric*365, 0), 2) "2010",
round(vt_occupancy_susr."2011" ::numeric * nullif(vt_n_bed_rpo."2011"::numeric*365, 0), 2) "2011",
round(vt_occupancy_susr."2012" ::numeric * nullif(vt_n_bed_rpo."2012"::numeric*365, 0), 2) "2012",
round(vt_occupancy_susr."2013" ::numeric * nullif(vt_n_bed_rpo."2013"::numeric*365, 0), 2) "2013",
round(vt_occupancy_susr."2014" ::numeric * nullif(vt_n_bed_rpo."2014"::numeric*365, 0), 2) "2014",
round(vt_occupancy_susr."2015" ::numeric * nullif(vt_n_bed_rpo."2015"::numeric*365, 0), 2) "2015",
round(vt_occupancy_susr."2016" ::numeric * nullif(vt_n_bed_rpo."2016"::numeric*365, 0), 2) "2016",
round(vt_occupancy_susr."2017" ::numeric * nullif(vt_n_bed_rpo."2017"::numeric*365, 0), 2) "2017"


from city_base vt_occupancy_susr
join city_base vt_n_bed_rpo using(municipality_id, city)
where vt_occupancy_susr.var_type = 'occupancy_susr'
and vt_n_bed_rpo.var_type = 'n_bed_rpo';

-----------------------------------
insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'taxable_nights_ruz' as var_type,
round(vt_ratio_taxable_nights."2008" ::numeric * nullif(vt_n_nights_ruz."2008"::numeric, 0), 2) "2008",
round(vt_ratio_taxable_nights."2009" ::numeric * nullif(vt_n_nights_ruz."2009"::numeric, 0), 2) "2009",
round(vt_ratio_taxable_nights."2010" ::numeric * nullif(vt_n_nights_ruz."2010"::numeric, 0), 2) "2010",
round(vt_ratio_taxable_nights."2011" ::numeric * nullif(vt_n_nights_ruz."2011"::numeric, 0), 2) "2011",
round(vt_ratio_taxable_nights."2012" ::numeric * nullif(vt_n_nights_ruz."2012"::numeric, 0), 2) "2012",
round(vt_ratio_taxable_nights."2013" ::numeric * nullif(vt_n_nights_ruz."2013"::numeric, 0), 2) "2013",
round(vt_ratio_taxable_nights."2014" ::numeric * nullif(vt_n_nights_ruz."2014"::numeric, 0), 2) "2014",
round(vt_ratio_taxable_nights."2015" ::numeric * nullif(vt_n_nights_ruz."2015"::numeric, 0), 2) "2015",
round(vt_ratio_taxable_nights."2016" ::numeric * nullif(vt_n_nights_ruz."2016"::numeric, 0), 2) "2016",
round(vt_ratio_taxable_nights."2017" ::numeric * nullif(vt_n_nights_ruz."2017"::numeric, 0), 2) "2017"

from city_base vt_ratio_taxable_nights
join city_base vt_n_nights_ruz using(municipality_id, city)
where vt_ratio_taxable_nights.var_type = 'ratio_taxable_nights'
and vt_n_nights_ruz.var_type = 'n_nights_ruz';

----
insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'taxable_nights_rpo' as var_type,
round(vt_ratio_taxable_nights."2008" ::numeric * nullif(vt_n_nights_rpo."2008"::numeric, 0), 2) "2008",
round(vt_ratio_taxable_nights."2009" ::numeric * nullif(vt_n_nights_rpo."2009"::numeric, 0), 2) "2009",
round(vt_ratio_taxable_nights."2010" ::numeric * nullif(vt_n_nights_rpo."2010"::numeric, 0), 2) "2010",
round(vt_ratio_taxable_nights."2011" ::numeric * nullif(vt_n_nights_rpo."2011"::numeric, 0), 2) "2011",
round(vt_ratio_taxable_nights."2012" ::numeric * nullif(vt_n_nights_rpo."2012"::numeric, 0), 2) "2012",
round(vt_ratio_taxable_nights."2013" ::numeric * nullif(vt_n_nights_rpo."2013"::numeric, 0), 2) "2013",
round(vt_ratio_taxable_nights."2014" ::numeric * nullif(vt_n_nights_rpo."2014"::numeric, 0), 2) "2014",
round(vt_ratio_taxable_nights."2015" ::numeric * nullif(vt_n_nights_rpo."2015"::numeric, 0), 2) "2015",
round(vt_ratio_taxable_nights."2016" ::numeric * nullif(vt_n_nights_rpo."2016"::numeric, 0), 2) "2016",
round(vt_ratio_taxable_nights."2017" ::numeric * nullif(vt_n_nights_rpo."2017"::numeric, 0), 2) "2017"

from city_base vt_ratio_taxable_nights
join city_base vt_n_nights_rpo using(municipality_id, city)
where vt_ratio_taxable_nights.var_type = 'ratio_taxable_nights'
and vt_n_nights_rpo.var_type = 'n_nights_rpo';

----
insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'tax_ruz' as var_type,
round(vt_taxable_nights_ruz."2008" ::numeric * nullif(vt_tax_rate."2008"::numeric, 0), 2) "2008",
round(vt_taxable_nights_ruz."2009" ::numeric * nullif(vt_tax_rate."2009"::numeric, 0), 2) "2009",
round(vt_taxable_nights_ruz."2010" ::numeric * nullif(vt_tax_rate."2010"::numeric, 0), 2) "2010",
round(vt_taxable_nights_ruz."2011" ::numeric * nullif(vt_tax_rate."2011"::numeric, 0), 2) "2011",
round(vt_taxable_nights_ruz."2012" ::numeric * nullif(vt_tax_rate."2012"::numeric, 0), 2) "2012",
round(vt_taxable_nights_ruz."2013" ::numeric * nullif(vt_tax_rate."2013"::numeric, 0), 2) "2013",
round(vt_taxable_nights_ruz."2014" ::numeric * nullif(vt_tax_rate."2014"::numeric, 0), 2) "2014",
round(vt_taxable_nights_ruz."2015" ::numeric * nullif(vt_tax_rate."2015"::numeric, 0), 2) "2015",
round(vt_taxable_nights_ruz."2016" ::numeric * nullif(vt_tax_rate."2016"::numeric, 0), 2) "2016",
round(vt_taxable_nights_ruz."2017" ::numeric * nullif(vt_tax_rate."2017"::numeric, 0), 2) "2017"

from city_base vt_taxable_nights_ruz
join city_base vt_tax_rate using(municipality_id, city)
where vt_taxable_nights_ruz.var_type = 'taxable_nights_ruz'
and vt_tax_rate.var_type = 'tax_rate';
-------
insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'tax_rpo' as var_type,
round(vt_taxable_nights_rpo."2008" ::numeric * nullif(vt_tax_rate."2008"::numeric, 0), 2) "2008",
round(vt_taxable_nights_rpo."2009" ::numeric * nullif(vt_tax_rate."2009"::numeric, 0), 2) "2009",
round(vt_taxable_nights_rpo."2010" ::numeric * nullif(vt_tax_rate."2010"::numeric, 0), 2) "2010",
round(vt_taxable_nights_rpo."2011" ::numeric * nullif(vt_tax_rate."2011"::numeric, 0), 2) "2011",
round(vt_taxable_nights_rpo."2012" ::numeric * nullif(vt_tax_rate."2012"::numeric, 0), 2) "2012",
round(vt_taxable_nights_rpo."2013" ::numeric * nullif(vt_tax_rate."2013"::numeric, 0), 2) "2013",
round(vt_taxable_nights_rpo."2014" ::numeric * nullif(vt_tax_rate."2014"::numeric, 0), 2) "2014",
round(vt_taxable_nights_rpo."2015" ::numeric * nullif(vt_tax_rate."2015"::numeric, 0), 2) "2015",
round(vt_taxable_nights_rpo."2016" ::numeric * nullif(vt_tax_rate."2016"::numeric, 0), 2) "2016",
round(vt_taxable_nights_rpo."2017" ::numeric * nullif(vt_tax_rate."2017"::numeric, 0), 2) "2017"

from city_base vt_taxable_nights_rpo
join city_base vt_tax_rate using(municipality_id, city)
where vt_taxable_nights_rpo.var_type = 'taxable_nights_rpo'
and vt_tax_rate.var_type = 'tax_rate';







------------------

insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
-----------------
insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'rat_acc_ruz' as var_type,
round(vt_n_acc_ruz."2008" ::numeric*100 / nullif(vt_n_acc_susr."2008"::numeric, 0), 2) "2008",
round(vt_n_acc_ruz."2009" ::numeric*100 / nullif(vt_n_acc_susr."2009"::numeric, 0), 2) "2009",
round(vt_n_acc_ruz."2010" ::numeric*100 / nullif(vt_n_acc_susr."2010"::numeric, 0), 2) "2010",
round(vt_n_acc_ruz."2011" ::numeric*100 / nullif(vt_n_acc_susr."2011"::numeric, 0), 2) "2011",
round(vt_n_acc_ruz."2012" ::numeric*100 / nullif(vt_n_acc_susr."2012"::numeric, 0), 2) "2012",
round(vt_n_acc_ruz."2013" ::numeric*100 / nullif(vt_n_acc_susr."2013"::numeric, 0), 2) "2013",
round(vt_n_acc_ruz."2014" ::numeric*100 / nullif(vt_n_acc_susr."2014"::numeric, 0), 2) "2014",
round(vt_n_acc_ruz."2015" ::numeric*100 / nullif(vt_n_acc_susr."2015"::numeric, 0), 2) "2015",
round(vt_n_acc_ruz."2016" ::numeric*100 / nullif(vt_n_acc_susr."2016"::numeric, 0), 2) "2016",
round(vt_n_acc_ruz."2017" ::numeric*100 / nullif(vt_n_acc_susr."2017"::numeric, 0), 2) "2017"


from city_base vt_n_acc_ruz
join city_base vt_n_acc_susr using(municipality_id, city)
where vt_n_acc_ruz.var_type = 'n_acc_ruz'
and vt_n_acc_susr.var_type = 'n_acc_susr';

---


--------------
insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'rat_acc_rpo' as var_type,
round(vt_n_acc_rpo."2008" ::numeric*100 / nullif(vt_n_acc_susr."2008"::numeric, 0), 2) "2008",
round(vt_n_acc_rpo."2009" ::numeric*100 / nullif(vt_n_acc_susr."2009"::numeric, 0), 2) "2009",
round(vt_n_acc_rpo."2010" ::numeric*100 / nullif(vt_n_acc_susr."2010"::numeric, 0), 2) "2010",
round(vt_n_acc_rpo."2011" ::numeric*100 / nullif(vt_n_acc_susr."2011"::numeric, 0), 2) "2011",
round(vt_n_acc_rpo."2012" ::numeric*100 / nullif(vt_n_acc_susr."2012"::numeric, 0), 2) "2012",
round(vt_n_acc_rpo."2013" ::numeric*100 / nullif(vt_n_acc_susr."2013"::numeric, 0), 2) "2013",
round(vt_n_acc_rpo."2014" ::numeric*100 / nullif(vt_n_acc_susr."2014"::numeric, 0), 2) "2014",
round(vt_n_acc_rpo."2015" ::numeric*100 / nullif(vt_n_acc_susr."2015"::numeric, 0), 2) "2015",
round(vt_n_acc_rpo."2016" ::numeric*100 / nullif(vt_n_acc_susr."2016"::numeric, 0), 2) "2016",
round(vt_n_acc_rpo."2017" ::numeric*100 / nullif(vt_n_acc_susr."2017"::numeric, 0), 2) "2017"


from city_base vt_n_acc_rpo
join city_base vt_n_acc_susr using(municipality_id, city)
where vt_n_acc_rpo.var_type = 'n_acc_rpo'
and vt_n_acc_susr.var_type = 'n_acc_susr';


select municipality_id, city, var_type, 
round("2008"::numeric, 2), 
round("2009"::numeric, 2), 
round("2010"::numeric, 2),
round("2011"::numeric, 2), 
round("2012"::numeric, 2), 
round("2013"::numeric, 2),
round("2014"::numeric, 2), 
round("2015"::numeric, 2), 
round("2016"::numeric, 2), 
round("2017"::numeric, 2) 
from city_base 
where municipality_id in ('508438', '582000', '599981', '510262', '500011', '523381', '517402')
and var_type = 'ratio_taxable_nights'
order by var_type, city;
-----

insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'rat_nights_ruz_susr' as var_type,
round(vt_n_nights_ruz."2008" ::numeric*100 / nullif(vt_n_nights_susr."2008"::numeric, 0), 2) "2008",
round(vt_n_nights_ruz."2009" ::numeric*100 / nullif(vt_n_nights_susr."2009"::numeric, 0), 2) "2009",
round(vt_n_nights_ruz."2010" ::numeric*100 / nullif(vt_n_nights_susr."2010"::numeric, 0), 2) "2010",
round(vt_n_nights_ruz."2011" ::numeric*100 / nullif(vt_n_nights_susr."2011"::numeric, 0), 2) "2011",
round(vt_n_nights_ruz."2012" ::numeric*100 / nullif(vt_n_nights_susr."2012"::numeric, 0), 2) "2012",
round(vt_n_nights_ruz."2013" ::numeric*100 / nullif(vt_n_nights_susr."2013"::numeric, 0), 2) "2013",
round(vt_n_nights_ruz."2014" ::numeric*100 / nullif(vt_n_nights_susr."2014"::numeric, 0), 2) "2014",
round(vt_n_nights_ruz."2015" ::numeric*100 / nullif(vt_n_nights_susr."2015"::numeric, 0), 2) "2015",
round(vt_n_nights_ruz."2016" ::numeric*100 / nullif(vt_n_nights_susr."2016"::numeric, 0), 2) "2016",
round(vt_n_nights_ruz."2017" ::numeric*100 / nullif(vt_n_nights_susr."2017"::numeric, 0), 2) "2017"


from city_base vt_n_nights_ruz
join city_base vt_n_nights_susr using(municipality_id, city)
where vt_n_nights_ruz.var_type = 'n_nights_ruz'
and vt_n_nights_susr.var_type = 'n_nights_susr';

-----
insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'rat_nights_rpo_susr' as var_type,
round(vt_n_nights_rpo."2008" ::numeric*100 / nullif(vt_n_nights_susr."2008"::numeric, 0), 2) "2008",
round(vt_n_nights_rpo."2009" ::numeric*100 / nullif(vt_n_nights_susr."2009"::numeric, 0), 2) "2009",
round(vt_n_nights_rpo."2010" ::numeric*100 / nullif(vt_n_nights_susr."2010"::numeric, 0), 2) "2010",
round(vt_n_nights_rpo."2011" ::numeric*100 / nullif(vt_n_nights_susr."2011"::numeric, 0), 2) "2011",
round(vt_n_nights_rpo."2012" ::numeric*100 / nullif(vt_n_nights_susr."2012"::numeric, 0), 2) "2012",
round(vt_n_nights_rpo."2013" ::numeric*100 / nullif(vt_n_nights_susr."2013"::numeric, 0), 2) "2013",
round(vt_n_nights_rpo."2014" ::numeric*100 / nullif(vt_n_nights_susr."2014"::numeric, 0), 2) "2014",
round(vt_n_nights_rpo."2015" ::numeric*100 / nullif(vt_n_nights_susr."2015"::numeric, 0), 2) "2015",
round(vt_n_nights_rpo."2016" ::numeric*100 / nullif(vt_n_nights_susr."2016"::numeric, 0), 2) "2016",
round(vt_n_nights_rpo."2017" ::numeric*100 / nullif(vt_n_nights_susr."2017"::numeric, 0), 2) "2017"


from city_base vt_n_nights_rpo
join city_base vt_n_nights_susr using(municipality_id, city)
where vt_n_nights_rpo.var_type = 'n_nights_rpo'
and vt_n_nights_susr.var_type = 'n_nights_susr';
---
insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'rat_nights_rpo_tax_real' as var_type,
round(vt_n_nights_rpo."2008" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2008"::numeric, 0), 2) "2008",
round(vt_n_nights_rpo."2009" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2009"::numeric, 0), 2) "2009",
round(vt_n_nights_rpo."2010" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2010"::numeric, 0), 2) "2010",
round(vt_n_nights_rpo."2011" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2011"::numeric, 0), 2) "2011",
round(vt_n_nights_rpo."2012" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2012"::numeric, 0), 2) "2012",
round(vt_n_nights_rpo."2013" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2013"::numeric, 0), 2) "2013",
round(vt_n_nights_rpo."2014" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2014"::numeric, 0), 2) "2014",
round(vt_n_nights_rpo."2015" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2015"::numeric, 0), 2) "2015",
round(vt_n_nights_rpo."2016" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2016"::numeric, 0), 2) "2016",
round(vt_n_nights_rpo."2017" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2017"::numeric, 0), 2) "2017"


from city_base vt_n_nights_rpo
join city_base vt_n_nights_real_tax_div_tax_rate  using(municipality_id, city)
where vt_n_nights_rpo.var_type = 'n_nights_rpo'
and vt_n_nights_real_tax_div_tax_rate .var_type = 'n_nights_real_tax_div_tax_rate';


-----
insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'rat_nights_ruz_tax_real' as var_type,
round(vt_n_nights_ruz."2008" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2008"::numeric, 0), 2) "2008",
round(vt_n_nights_ruz."2009" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2009"::numeric, 0), 2) "2009",
round(vt_n_nights_ruz."2010" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2010"::numeric, 0), 2) "2010",
round(vt_n_nights_ruz."2011" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2011"::numeric, 0), 2) "2011",
round(vt_n_nights_ruz."2012" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2012"::numeric, 0), 2) "2012",
round(vt_n_nights_ruz."2013" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2013"::numeric, 0), 2) "2013",
round(vt_n_nights_ruz."2014" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2014"::numeric, 0), 2) "2014",
round(vt_n_nights_ruz."2015" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2015"::numeric, 0), 2) "2015",
round(vt_n_nights_ruz."2016" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2016"::numeric, 0), 2) "2016",
round(vt_n_nights_ruz."2017" ::numeric*100 / nullif(vt_n_nights_real_tax_div_tax_rate."2017"::numeric, 0), 2) "2017"


from city_base vt_n_nights_ruz
join city_base vt_n_nights_real_tax_div_tax_rate  using(municipality_id, city)
where vt_n_nights_ruz.var_type = 'n_nights_ruz'
and vt_n_nights_real_tax_div_tax_rate .var_type = 'n_nights_real_tax_div_tax_rate';


-----



select municipality_id, city, 'avg_nights_ruz_rpo_tax_susr' as var_type, 

round(SUM("2008"::numeric)/4, 0) "2008",
round(SUM("2009"::numeric)/4, 0) "2009",
round(SUM("2010"::numeric)/4, 0) "2010",
round(SUM("2011"::numeric)/4, 0) "2011",
round(SUM("2012"::numeric)/4, 0) "2012",
round(SUM("2013"::numeric)/4, 0) "2013",
round(SUM("2014"::numeric)/4, 0) "2014",
round(SUM("2015"::numeric)/4, 0) "2015",
round(SUM("2016"::numeric)/4, 0) "2016",
round(SUM("2017"::numeric)/4, 0) "2017"

from city_base
where var_type in ('n_nights_real_tax_div_tax_rate', 'n_nights_ruz', 'n_nights_rpo', 'n_nights_susr')
and municipality_id in ('508438', '582000', '599981', '510262', '500011', '523381', '517402')
group by municipality_id, city
order by var_type, city;


-----
insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'avg_acc_ruz_rpo_susr' as var_type, 

round(SUM("2008"::numeric)/3, 0) "2008",
round(SUM("2009"::numeric)/3, 0) "2009",
round(SUM("2010"::numeric)/3, 0) "2010",
round(SUM("2011"::numeric)/3, 0) "2011",
round(SUM("2012"::numeric)/3, 0) "2012",
round(SUM("2013"::numeric)/3, 0) "2013",
round(SUM("2014"::numeric)/3, 0) "2014",
round(SUM("2015"::numeric)/3, 0) "2015",
round(SUM("2016"::numeric)/3, 0) "2016",
round(SUM("2017"::numeric)/3, 0) "2017"

from city_base
where var_type in ('n_acc_rpo', 'n_acc_ruz', 'n_acc_susr')
--and municipality_id in ('508438', '582000', '599981', '510262', '500011', '523381', '517402')
group by municipality_id, city
order by var_type, city


-----
select municipality_id, city, 'rat_avg_acc_rrs_susr' as var_type,
round(vt_n_avg_acc_ruz_rpo_susr."2008" ::numeric*100 / nullif(vt_n_acc_susr."2008"::numeric, 0), 2) "2008",
round(vt_n_avg_acc_ruz_rpo_susr."2009" ::numeric*100 / nullif(vt_n_acc_susr."2009"::numeric, 0), 2) "2009",
round(vt_n_avg_acc_ruz_rpo_susr."2010" ::numeric*100 / nullif(vt_n_acc_susr."2010"::numeric, 0), 2) "2010",
round(vt_n_avg_acc_ruz_rpo_susr."2011" ::numeric*100 / nullif(vt_n_acc_susr."2011"::numeric, 0), 2) "2011",
round(vt_n_avg_acc_ruz_rpo_susr."2012" ::numeric*100 / nullif(vt_n_acc_susr."2012"::numeric, 0), 2) "2012",
round(vt_n_avg_acc_ruz_rpo_susr."2013" ::numeric*100 / nullif(vt_n_acc_susr."2013"::numeric, 0), 2) "2013",
round(vt_n_avg_acc_ruz_rpo_susr."2014" ::numeric*100 / nullif(vt_n_acc_susr."2014"::numeric, 0), 2) "2014",
round(vt_n_avg_acc_ruz_rpo_susr."2015" ::numeric*100 / nullif(vt_n_acc_susr."2015"::numeric, 0), 2) "2015",
round(vt_n_avg_acc_ruz_rpo_susr."2016" ::numeric*100 / nullif(vt_n_acc_susr."2016"::numeric, 0), 2) "2016",
round(vt_n_avg_acc_ruz_rpo_susr."2017" ::numeric*100 / nullif(vt_n_acc_susr."2017"::numeric, 0), 2) "2017"


from city_base vt_n_avg_acc_ruz_rpo_susr
join city_base vt_n_acc_susr  using(municipality_id, city)
where vt_n_avg_acc_ruz_rpo_susr.var_type = 'avg_acc_ruz_rpo_susr'
and vt_n_acc_susr .var_type = 'n_acc_susr';



-----
insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'n_nights_ruz_rpo_susr' as var_type,
round(vt_avg_acc_ruz_rpo_susr."2008" ::numeric * nullif(vt_avg_night_per_acc_susr."2008"::numeric, 0), 0) "2008",
round(vt_avg_acc_ruz_rpo_susr."2009" ::numeric * nullif(vt_avg_night_per_acc_susr."2009"::numeric, 0), 0) "2009",
round(vt_avg_acc_ruz_rpo_susr."2010" ::numeric * nullif(vt_avg_night_per_acc_susr."2010"::numeric, 0), 0) "2010",
round(vt_avg_acc_ruz_rpo_susr."2011" ::numeric * nullif(vt_avg_night_per_acc_susr."2011"::numeric, 0), 0) "2011",
round(vt_avg_acc_ruz_rpo_susr."2012" ::numeric * nullif(vt_avg_night_per_acc_susr."2012"::numeric, 0), 0) "2012",
round(vt_avg_acc_ruz_rpo_susr."2013" ::numeric * nullif(vt_avg_night_per_acc_susr."2013"::numeric, 0), 0) "2013",
round(vt_avg_acc_ruz_rpo_susr."2014" ::numeric * nullif(vt_avg_night_per_acc_susr."2014"::numeric, 0), 0) "2014",
round(vt_avg_acc_ruz_rpo_susr."2015" ::numeric * nullif(vt_avg_night_per_acc_susr."2015"::numeric, 0), 0) "2015",
round(vt_avg_acc_ruz_rpo_susr."2016" ::numeric * nullif(vt_avg_night_per_acc_susr."2016"::numeric, 0), 0) "2016",
round(vt_avg_acc_ruz_rpo_susr."2017" ::numeric * nullif(vt_avg_night_per_acc_susr."2017"::numeric, 0), 0) "2017"

from city_base vt_avg_acc_ruz_rpo_susr
join city_base vt_avg_night_per_acc_susr using(municipality_id, city)
where vt_avg_acc_ruz_rpo_susr.var_type = 'avg_acc_ruz_rpo_susr'
and vt_avg_night_per_acc_susr.var_type = 'avg_night_per_acc_susr';
----
select distinct(var_type) from city_base
where var_type in ('n_nights_rpo', 'n_nights_ruz', 'n_nights_susr', 'n_nights_ruz_rpo_susr', 'n_nights_real_tax_div_tax_rate' )
order by var_type


-------
insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'n_nights_est' as var_type, 

round(SUM("2008"::numeric)/5, 0) "2008",
round(SUM("2009"::numeric)/5, 0) "2009",
round(SUM("2010"::numeric)/5, 0) "2010",
round(SUM("2011"::numeric)/5, 0) "2011",
round(SUM("2012"::numeric)/5, 0) "2012",
round(SUM("2013"::numeric)/5, 0) "2013",
round(SUM("2014"::numeric)/5, 0) "2014",
round(SUM("2015"::numeric)/5, 0) "2015",
round(SUM("2016"::numeric)/5, 0) "2016",
round(SUM("2017"::numeric)/5, 0) "2017"

from city_base
where var_type in ('n_nights_rpo', 'n_nights_ruz', 'n_nights_susr', 'n_nights_ruz_rpo_susr', 'n_nights_real_tax_div_tax_rate' )
group by municipality_id, city
order by var_type, city;

---

select municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017" from city_base where var_type = 'n_nights_est'
-------
select municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017" 
from city_base
where var_type in ('n_nights_ruz', 'n_nights_rpo') and municipality_id in ('508438', '582000', '599981', '510262', '500011', '523381', '517402')
order by var_type, city;

----
select municipality_id, city, 'rat_nights_est_susr' as var_type,
round(vt_n_nights_est."2008" ::numeric*100 / nullif(vt_n_nights_susr."2008"::numeric, 0), 2) "2008",
round(vt_n_nights_est."2009" ::numeric*100 / nullif(vt_n_nights_susr."2009"::numeric, 0), 2) "2009",
round(vt_n_nights_est."2010" ::numeric*100 / nullif(vt_n_nights_susr."2010"::numeric, 0), 2) "2010",
round(vt_n_nights_est."2011" ::numeric*100 / nullif(vt_n_nights_susr."2011"::numeric, 0), 2) "2011",
round(vt_n_nights_est."2012" ::numeric*100 / nullif(vt_n_nights_susr."2012"::numeric, 0), 2) "2012",
round(vt_n_nights_est."2013" ::numeric*100 / nullif(vt_n_nights_susr."2013"::numeric, 0), 2) "2013",
round(vt_n_nights_est."2014" ::numeric*100 / nullif(vt_n_nights_susr."2014"::numeric, 0), 2) "2014",
round(vt_n_nights_est."2015" ::numeric*100 / nullif(vt_n_nights_susr."2015"::numeric, 0), 2) "2015",
round(vt_n_nights_est."2016" ::numeric*100 / nullif(vt_n_nights_susr."2016"::numeric, 0), 2) "2016",
round(vt_n_nights_est."2017" ::numeric*100 / nullif(vt_n_nights_susr."2017"::numeric, 0), 2) "2017"


from city_base vt_n_nights_est
join city_base vt_n_nights_susr  using(municipality_id, city)
where vt_n_nights_est.var_type = 'n_nights_est'
and vt_n_nights_susr .var_type = 'n_nights_susr';

------
insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
with taxable_nights as (
with avg_tax_ratio as (
select municipality_id, city,
round(("2008" + "2009" + "2010" + "2011" + "2012" + "2013" + "2014" + "2015" + "2016" + "2017")::numeric / 10, 2) as avga
from city_base where var_type = 'ratio_taxable_nights'
group by municipality_id, city, avga),

final_nights_est as 
(select municipality_id, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017" from city_base where var_type = 'n_nights_est')

select * from avg_tax_ratio
join final_nights_est using (municipality_id))

select municipality_id, city, 'f_tax_nights_est' as var_type,

round("2008"::numeric * avga, 0) "2008",
round("2009"::numeric * avga, 0) "2009",
round("2010"::numeric * avga, 0) "2010",
round("2011"::numeric * avga, 0) "2011",
round("2012"::numeric * avga, 0) "2012",
round("2013"::numeric * avga, 0) "2013",
round("2014"::numeric * avga, 0) "2014",
round("2015"::numeric * avga, 0) "2015",
round("2016"::numeric * avga, 0) "2016",
round("2017"::numeric * avga, 0) "2017"
from taxable_nights
where city not in ('Bratislava', 'Piešťany', 'Trenčianske Teplice')
order by city

----with taxable_nights as (
with avg_tax_ratio as (
select municipality_id, city,
round(("2008" + "2009" + "2010" + "2011" + "2012" + "2013" + "2014" + "2015" + "2016" + "2017")::numeric / 10, 2) as avga
from city_base where var_type = 'ratio_taxable_nights'
group by municipality_id, city, avga),

final_nights_est as 
(select municipality_id, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017" from city_base where var_type = 'n_nights_est')

select * from avg_tax_ratio
join final_nights_est using (municipality_id))

select municipality_id, city, 'f_tax_nights_est' as var_type,

round("2008"::numeric * avga, 0) "2008",
round("2009"::numeric * avga, 0) "2009",
round("2010"::numeric * avga, 0) "2010",
round("2011"::numeric * avga, 0) "2011",
round("2012"::numeric * avga, 0) "2012",
round("2013"::numeric * avga, 0) "2013",
round("2014"::numeric * avga, 0) "2014",
round("2015"::numeric * avga, 0) "2015",
round("2016"::numeric * avga, 0) "2016",
round("2017"::numeric * avga, 0) "2017"
from taxable_nights
where city not in ('Bratislava', 'Piešťany', 'Trenčianske Teplice')
order by city
-----------
with f_min_ratios_nights as (
with min_ratios as (
with ratios as (
select municipality_id, city, array["2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017"] xx 
from city_base
where var_type = 'ratio_taxable_nights' and city not in ('Trenčianske Teplice', 'Piešťany'))

select municipality_id, min(len) as min_tax_ratio
from ratios, unnest(ratios.xx) len
group by 1),

final_nights_est as 
(select municipality_id, city, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017" from city_base where var_type = 'n_nights_est')

select * from min_ratios 
join final_nights_est using(municipality_id))

select municipality_id, city, 'min_f_tax_nights_est' as var_type,

round("2008"::numeric * min_tax_ratio::numeric, 0) "2008",
round("2009"::numeric * min_tax_ratio::numeric, 0) "2009",
round("2010"::numeric * min_tax_ratio::numeric, 0) "2010",
round("2011"::numeric * min_tax_ratio::numeric, 0) "2011",
round("2012"::numeric * min_tax_ratio::numeric, 0) "2012",
round("2013"::numeric * min_tax_ratio::numeric, 0) "2013",
round("2014"::numeric * min_tax_ratio::numeric, 0) "2014",
round("2015"::numeric * min_tax_ratio::numeric, 0) "2015",
round("2016"::numeric * min_tax_ratio::numeric, 0) "2016",
round("2017"::numeric * min_tax_ratio::numeric, 0) "2017"
from f_min_ratios_nights
where city not in ('Bratislava', 'Piešťany', 'Trenčianske Teplice')
order by city
-----------------------

select municipality_id, city, 'rat_tax_nights_est_susr' as var_type,
round(vt_f_tax_nights_est."2008" ::numeric*100 / nullif(vt_n_nights_susr."2008"::numeric, 0), 2) "2008",
round(vt_f_tax_nights_est."2009" ::numeric*100 / nullif(vt_n_nights_susr."2009"::numeric, 0), 2) "2009",
round(vt_f_tax_nights_est."2010" ::numeric*100 / nullif(vt_n_nights_susr."2010"::numeric, 0), 2) "2010",
round(vt_f_tax_nights_est."2011" ::numeric*100 / nullif(vt_n_nights_susr."2011"::numeric, 0), 2) "2011",
round(vt_f_tax_nights_est."2012" ::numeric*100 / nullif(vt_n_nights_susr."2012"::numeric, 0), 2) "2012",
round(vt_f_tax_nights_est."2013" ::numeric*100 / nullif(vt_n_nights_susr."2013"::numeric, 0), 2) "2013",
round(vt_f_tax_nights_est."2014" ::numeric*100 / nullif(vt_n_nights_susr."2014"::numeric, 0), 2) "2014",
round(vt_f_tax_nights_est."2015" ::numeric*100 / nullif(vt_n_nights_susr."2015"::numeric, 0), 2) "2015",
round(vt_f_tax_nights_est."2016" ::numeric*100 / nullif(vt_n_nights_susr."2016"::numeric, 0), 2) "2016",
round(vt_f_tax_nights_est."2017" ::numeric*100 / nullif(vt_n_nights_susr."2017"::numeric, 0), 2) "2017"


from city_base vt_f_tax_nights_est
join city_base vt_n_nights_susr  using(municipality_id, city)
where vt_f_tax_nights_est.var_type = 'f_tax_nights_est'
and vt_n_nights_susr .var_type = 'n_nights_susr';


--------------------
select municipality_id, city, 'rat_tax_nights_est_susr' as var_type,
round(vt_min_f_tax_nights_est."2008" ::numeric*100 / nullif(vt_n_nights_susr."2008"::numeric, 0), 2) "2008",
round(vt_min_f_tax_nights_est."2009" ::numeric*100 / nullif(vt_n_nights_susr."2009"::numeric, 0), 2) "2009",
round(vt_min_f_tax_nights_est."2010" ::numeric*100 / nullif(vt_n_nights_susr."2010"::numeric, 0), 2) "2010",
round(vt_min_f_tax_nights_est."2011" ::numeric*100 / nullif(vt_n_nights_susr."2011"::numeric, 0), 2) "2011",
round(vt_min_f_tax_nights_est."2012" ::numeric*100 / nullif(vt_n_nights_susr."2012"::numeric, 0), 2) "2012",
round(vt_min_f_tax_nights_est."2013" ::numeric*100 / nullif(vt_n_nights_susr."2013"::numeric, 0), 2) "2013",
round(vt_min_f_tax_nights_est."2014" ::numeric*100 / nullif(vt_n_nights_susr."2014"::numeric, 0), 2) "2014",
round(vt_min_f_tax_nights_est."2015" ::numeric*100 / nullif(vt_n_nights_susr."2015"::numeric, 0), 2) "2015",
round(vt_min_f_tax_nights_est."2016" ::numeric*100 / nullif(vt_n_nights_susr."2016"::numeric, 0), 2) "2016",
round(vt_min_f_tax_nights_est."2017" ::numeric*100 / nullif(vt_n_nights_susr."2017"::numeric, 0), 2) "2017"


from city_base vt_min_f_tax_nights_est
join city_base vt_n_nights_susr  using(municipality_id, city)
where vt_min_f_tax_nights_est.var_type = 'min_f_tax_nights_est'
and vt_n_nights_susr .var_type = 'n_nights_susr';

---------
insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'tax_min_est' as var_type,
round(vt_min_f_tax_nights_est."2008" ::numeric * nullif(vt_tax_rate."2008"::numeric, 0), 2) "2008",
round(vt_min_f_tax_nights_est."2009" ::numeric * nullif(vt_tax_rate."2009"::numeric, 0), 2) "2009",
round(vt_min_f_tax_nights_est."2010" ::numeric * nullif(vt_tax_rate."2010"::numeric, 0), 2) "2010",
round(vt_min_f_tax_nights_est."2011" ::numeric * nullif(vt_tax_rate."2011"::numeric, 0), 2) "2011",
round(vt_min_f_tax_nights_est."2012" ::numeric * nullif(vt_tax_rate."2012"::numeric, 0), 2) "2012",
round(vt_min_f_tax_nights_est."2013" ::numeric * nullif(vt_tax_rate."2013"::numeric, 0), 2) "2013",
round(vt_min_f_tax_nights_est."2014" ::numeric * nullif(vt_tax_rate."2014"::numeric, 0), 2) "2014",
round(vt_min_f_tax_nights_est."2015" ::numeric * nullif(vt_tax_rate."2015"::numeric, 0), 2) "2015",
round(vt_min_f_tax_nights_est."2016" ::numeric * nullif(vt_tax_rate."2016"::numeric, 0), 2) "2016",
round(vt_min_f_tax_nights_est."2017" ::numeric * nullif(vt_tax_rate."2017"::numeric, 0), 2) "2017"


from city_base vt_min_f_tax_nights_est
join city_base vt_tax_rate  using(municipality_id, city)
where vt_min_f_tax_nights_est.var_type = 'min_f_tax_nights_est'
and vt_tax_rate .var_type = 'tax_rate';

------
insert into city_base (municipality_id, city, var_type, "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")
select municipality_id, city, 'tax_est' as var_type,
round(vt_f_tax_nights_est."2008" ::numeric * nullif(vt_tax_rate."2008"::numeric, 0), 2) "2008",
round(vt_f_tax_nights_est."2009" ::numeric * nullif(vt_tax_rate."2009"::numeric, 0), 2) "2009",
round(vt_f_tax_nights_est."2010" ::numeric * nullif(vt_tax_rate."2010"::numeric, 0), 2) "2010",
round(vt_f_tax_nights_est."2011" ::numeric * nullif(vt_tax_rate."2011"::numeric, 0), 2) "2011",
round(vt_f_tax_nights_est."2012" ::numeric * nullif(vt_tax_rate."2012"::numeric, 0), 2) "2012",
round(vt_f_tax_nights_est."2013" ::numeric * nullif(vt_tax_rate."2013"::numeric, 0), 2) "2013",
round(vt_f_tax_nights_est."2014" ::numeric * nullif(vt_tax_rate."2014"::numeric, 0), 2) "2014",
round(vt_f_tax_nights_est."2015" ::numeric * nullif(vt_tax_rate."2015"::numeric, 0), 2) "2015",
round(vt_f_tax_nights_est."2016" ::numeric * nullif(vt_tax_rate."2016"::numeric, 0), 2) "2016",
round(vt_f_tax_nights_est."2017" ::numeric * nullif(vt_tax_rate."2017"::numeric, 0), 2) "2017"


from city_base vt_f_tax_nights_est
join city_base vt_tax_rate  using(municipality_id, city)
where vt_f_tax_nights_est.var_type = 'f_tax_nights_est'
and vt_tax_rate .var_type = 'tax_rate';

-------
select municipality_id, city, 'rat_tax_est_real' as var_type,
round(vt_tax_est."2008" ::numeric*100 / nullif(vt_tax_real."2008"::numeric, 0), 2) "2008",
round(vt_tax_est."2009" ::numeric*100 / nullif(vt_tax_real."2009"::numeric, 0), 2) "2009",
round(vt_tax_est."2010" ::numeric*100 / nullif(vt_tax_real."2010"::numeric, 0), 2) "2010",
round(vt_tax_est."2011" ::numeric*100 / nullif(vt_tax_real."2011"::numeric, 0), 2) "2011",
round(vt_tax_est."2012" ::numeric*100 / nullif(vt_tax_real."2012"::numeric, 0), 2) "2012",
round(vt_tax_est."2013" ::numeric*100 / nullif(vt_tax_real."2013"::numeric, 0), 2) "2013",
round(vt_tax_est."2014" ::numeric*100 / nullif(vt_tax_real."2014"::numeric, 0), 2) "2014",
round(vt_tax_est."2015" ::numeric*100 / nullif(vt_tax_real."2015"::numeric, 0), 2) "2015",
round(vt_tax_est."2016" ::numeric*100 / nullif(vt_tax_real."2016"::numeric, 0), 2) "2016",
round(vt_tax_est."2017" ::numeric*100 / nullif(vt_tax_real."2017"::numeric, 0), 2) "2017"


from city_base vt_tax_est
join city_base vt_tax_real  using(municipality_id, city)
where vt_tax_est.var_type = 'tax_est'
and vt_tax_real .var_type = 'tax_real';


-----

select municipality_id, city, 'rat_tax_min_est_real' as var_type,
round(vt_tax_min_est."2008" ::numeric*100 / nullif(vt_tax_real."2008"::numeric, 0), 2) "2008",
round(vt_tax_min_est."2009" ::numeric*100 / nullif(vt_tax_real."2009"::numeric, 0), 2) "2009",
round(vt_tax_min_est."2010" ::numeric*100 / nullif(vt_tax_real."2010"::numeric, 0), 2) "2010",
round(vt_tax_min_est."2011" ::numeric*100 / nullif(vt_tax_real."2011"::numeric, 0), 2) "2011",
round(vt_tax_min_est."2012" ::numeric*100 / nullif(vt_tax_real."2012"::numeric, 0), 2) "2012",
round(vt_tax_min_est."2013" ::numeric*100 / nullif(vt_tax_real."2013"::numeric, 0), 2) "2013",
round(vt_tax_min_est."2014" ::numeric*100 / nullif(vt_tax_real."2014"::numeric, 0), 2) "2014",
round(vt_tax_min_est."2015" ::numeric*100 / nullif(vt_tax_real."2015"::numeric, 0), 2) "2015",
round(vt_tax_min_est."2016" ::numeric*100 / nullif(vt_tax_real."2016"::numeric, 0), 2) "2016",
round(vt_tax_min_est."2017" ::numeric*100 / nullif(vt_tax_real."2017"::numeric, 0), 2) "2017"


from city_base vt_tax_min_est
join city_base vt_tax_real  using(municipality_id, city)
where vt_tax_min_est.var_type = 'tax_min_est'
and vt_tax_real .var_type = 'tax_real';


select municipality_id, city, var_type,
round("2008"::numeric, 0) "2008",
round("2009"::numeric, 0) "2009",
round("2010"::numeric, 0) "2010",
round("2011"::numeric, 0) "2011",
round("2012"::numeric, 0) "2012",
round("2013"::numeric, 0) "2013",
round("2014"::numeric, 0) "2014",
round("2015"::numeric, 0) "2015",
round("2016"::numeric, 0) "2016",
round("2017"::numeric, 0) "2017"
from city_base where var_type = 'tax_est'
order by city

----
select municipality_id, city, var_type,
round("2008"::numeric, 0) "2008",
round("2009"::numeric, 0) "2009",
round("2010"::numeric, 0) "2010",
round("2011"::numeric, 0) "2011",
round("2012"::numeric, 0) "2012",
round("2013"::numeric, 0) "2013",
round("2014"::numeric, 0) "2014",
round("2015"::numeric, 0) "2015",
round("2016"::numeric, 0) "2016",
round("2017"::numeric, 0) "2017"
from city_base where var_type = 'tax_min_est'
order by city
