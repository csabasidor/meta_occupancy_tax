with year_2017 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
        and established_on < '20180101' and terminated_on is NULL 
		or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20180101' and terminated_on >='20171231'
      then 1 else 0 end) year_2017
 		from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300')
      group by municipality_id),
 year_2016 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20170101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20170101' and terminated_on >='20161231' then 1 else 0 end) year_2016
      from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300')
      group by municipality_id),
year_2015 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20160101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20160101' and terminated_on >='20151231' then 1 else 0 end) year_2015
      from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300') 
      group by municipality_id),
year_2014 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20150101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20150101' and terminated_on >='20141231' then 1 else 0 end) year_2014
      from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300') 
      group by municipality_id),
year_2013 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20140101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20140101' and terminated_on >='20131231' then 1 else 0 end) year_2013
      from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300') 
      group by municipality_id),
year_2012 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20130101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20130101' and terminated_on >='20121231' then 1 else 0 end) year_2012
      from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300') 
      group by municipality_id),
year_2011 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20120101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20120101' and terminated_on >='20111231' then 1 else 0 end) year_2011
      from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300') 
      group by municipality_id), 
year_2010 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20110101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20110101' and terminated_on >='20101231' then 1 else 0 end) year_2010
      from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300') 
      group by municipality_id),
year_2009 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20100101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20100101' and terminated_on >='20091231' then 1 else 0 end) year_2009
      from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300')
      group by municipality_id),
year_2008 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20090101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20090101' and terminated_on >='20081231' then 1 else 0 end) year_2008
      from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300') 
      group by municipality_id),
year_2007 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20080101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20080101' and terminated_on >='20071231' then 1 else 0 end) year_2007
      from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300') 
      group by municipality_id),
year_2006 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20070101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20070101' and terminated_on >='20061231' then 1 else 0 end) year_2006
      from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300') 
      group by municipality_id),
year_2005 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20060101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20060101' and terminated_on >='20051231' then 1 else 0 end) year_2005
      from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300') 
      group by municipality_id),
year_2004 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20050101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20050101' and terminated_on >='20041231' then 1 else 0 end) year_2004
      from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300') 
      group by municipality_id),
year_2003 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20040101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20040101' and terminated_on >='20031231' then 1 else 0 end) year_2003
      from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300') 
      group by municipality_id),
year_2002 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20030101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20030101' and terminated_on >='20021231' then 1 else 0 end) year_2002
      from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300') 
      group by municipality_id),    
year_2001 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20020101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20020101' and terminated_on >='20011231' then 1 else 0 end) year_2001
      from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300') 
      group by municipality_id),
year_2000 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20010101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20010101' and terminated_on >='20001231' then 1 else 0 end) year_2000
      from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300') 
      group by municipality_id),
year_1999 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20000101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '20000101' and terminated_on >='19991231' then 1 else 0 end) year_1999
      from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300') 
      group by municipality_id),
year_1998 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '19990101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '19990101' and terminated_on >='19981231' then 1 else 0 end) year_1998
      from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300') 
      group by municipality_id),
year_1997 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '19980101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '19980101' and terminated_on >='19971231' then 1 else 0 end) year_1997
      from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300') 
      group by municipality_id),
year_1996 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '19970101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '19970101' and terminated_on >='19961231' then 1 else 0 end) year_1996
      from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300') 
      group by municipality_id),
year_1995 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '19960101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '19960101' and terminated_on >='19951231' then 1 else 0 end) year_1995
  	  from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300') 
      group by municipality_id),
year_1994 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '19950101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '19950101' and terminated_on >='19941231' then 1 else 0 end) year_1994
      from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300') 
      group by municipality_id),
year_1993 as
 (select municipality_id,
	  sum 
     (case when sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '19940101' and terminated_on is null 
      or
      sk_nace_category_id IN ('55100', '55200', '55300')
      and established_on < '19940101' and terminated_on >= '19931231' then 1 else 0 end) year_1993
	  from ruz.accounting_entities where sk_nace_category_id IN ('55100', '55200', '55300') 
      group by municipality_id),
      part_c as
(
 select id as municipality_id, name_en as name_en from ruz.municipalities)
select * from part_c
join year_1993 USING (municipality_id) 
join year_1994 USING (municipality_id)
join year_1995 USING (municipality_id)
join year_1996 USING (municipality_id)
join year_1997 USING (municipality_id)
join year_1998 USING (municipality_id)
join year_1999 USING (municipality_id)
join year_2000 USING (municipality_id)
join year_2001 USING (municipality_id)
join year_2002 USING (municipality_id)
join year_2003 USING (municipality_id)
join year_2004 USING (municipality_id)
join year_2005 USING (municipality_id)
join year_2006 USING (municipality_id)
join year_2007 USING (municipality_id)
join year_2008 USING (municipality_id)
join year_2009 USING (municipality_id)
join year_2010 USING (municipality_id)
join year_2011 USING (municipality_id)
join year_2012 USING (municipality_id)
join year_2013 USING (municipality_id)
join year_2014 USING (municipality_id)
join year_2015 USING (municipality_id)
join year_2016 USING (municipality_id)
join year_2017 USING (municipality_id)

order by municipality_id
  
      
      
