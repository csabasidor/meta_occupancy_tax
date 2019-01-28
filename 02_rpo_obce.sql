--set work_mem = '512MB'
create table rpo_aac_sk as (
with fy2001 as (
with year_add as (
	with y_add as (
        select * from rpo.organization_address_entries where organization_id in (
				with y_ as (select * from rpo.organizations	where id in 
                            (select distinct(organization_id) from rpo.new_allacm where effective_from < '20020101' and effective_to is null or effective_from < '20020101' and effective_to >= '20011231'
                            )
                            )
	select id from y_ where established_on < '20020101' and terminated_on is null or established_on < '20020101' and terminated_on >= '20011231'
        																		  )
    				)
	select distinct on (organization_id) municipality, count(distinct(organization_id)) "2001" from y_add where effective_from < '20020101' and effective_to is null or effective_from < '20020101' and effective_to >= '20011231'
	group by  organization_id, municipality order by organization_id, "2001" desc
					)
select municipality, count(*) "2001" from year_add group by municipality order by "2001" desc),

fy2002 as (
with year_add as (
	with y_add as (
        select * from rpo.organization_address_entries where organization_id in (
				with y_ as (select * from rpo.organizations	where id in 
                            (select distinct(organization_id) from rpo.new_allacm where effective_from < '20030101' and effective_to is null or effective_from < '20030101' and effective_to >= '20021231'
                            )
                            )
	select id from y_ where established_on < '20030101' and terminated_on is null or established_on < '20030101' and terminated_on >= '20021231'
        																		  )
    				)
	select distinct on (organization_id) municipality, count(distinct(organization_id)) "2002" from y_add where effective_from < '20030101' and effective_to is null or effective_from < '20030101' and effective_to >= '20021231'
	group by  organization_id, municipality order by organization_id, "2002" desc
					)
select municipality, count(*) "2002" from year_add group by municipality order by "2002" desc),

fy2003 as (
with year_add as (
	with y_add as (
        select * from rpo.organization_address_entries where organization_id in (
				with y_ as (select * from rpo.organizations	where id in 
                            (select distinct(organization_id) from rpo.new_allacm where effective_from < '20040101' and effective_to is null or effective_from < '20040101' and effective_to >= '20031231'
                            )
                            )
	select id from y_ where established_on < '20040101' and terminated_on is null or established_on < '20040101' and terminated_on >= '20031231'
        																		  )
    				)
	select distinct on (organization_id) municipality, count(distinct(organization_id)) "2003" from y_add where effective_from < '20040101' and effective_to is null or effective_from < '20040101' and effective_to >= '20031231'
	group by  organization_id, municipality order by organization_id, "2003" desc
					)
select municipality, count(*) "2003" from year_add group by municipality order by "2003" desc),

fy2004 as (
with year_add as (
	with y_add as (
        select * from rpo.organization_address_entries where organization_id in (
				with y_ as (select * from rpo.organizations	where id in 
                            (select distinct(organization_id) from rpo.new_allacm where effective_from < '20050101' and effective_to is null or effective_from < '20050101' and effective_to >= '20041231'
                            )
                            )
	select id from y_ where established_on < '20050101' and terminated_on is null or established_on < '20050101' and terminated_on >= '20041231'
        																		  )
    				)
	select distinct on (organization_id) municipality, count(distinct(organization_id)) "2004" from y_add where effective_from < '20050101' and effective_to is null or effective_from < '20050101' and effective_to >= '20041231'
	group by  organization_id, municipality order by organization_id, "2004" desc
					)
select municipality, count(*) "2004" from year_add group by municipality order by "2004" desc),

fy2005 as (
with year_add as (
	with y_add as (
        select * from rpo.organization_address_entries where organization_id in (
				with y_ as (select * from rpo.organizations	where id in 
                            (select distinct(organization_id) from rpo.new_allacm where effective_from < '20060101' and effective_to is null or effective_from < '20060101' and effective_to >= '20051231'
                            )
                            )
	select id from y_ where established_on < '20060101' and terminated_on is null or established_on < '20060101' and terminated_on >= '20051231'
        																		  )
    				)
	select distinct on (organization_id) municipality, count(distinct(organization_id)) "2005" from y_add where effective_from < '20060101' and effective_to is null or effective_from < '20060101' and effective_to >= '20051231'
	group by  organization_id, municipality order by organization_id, "2005" desc
					)
select municipality, count(*) "2005" from year_add group by municipality order by "2005" desc),

fy2006 as (
with year_add as (
	with y_add as (
        select * from rpo.organization_address_entries where organization_id in (
				with y_ as (select * from rpo.organizations	where id in 
                            (select distinct(organization_id) from rpo.new_allacm where effective_from < '20070101' and effective_to is null or effective_from < '20070101' and effective_to >= '20061231'
                            )
                            )
	select id from y_ where established_on < '20070101' and terminated_on is null or established_on < '20070101' and terminated_on >= '20061231'
        																		  )
    				)
	select distinct on (organization_id) municipality, count(distinct(organization_id)) "2006" from y_add where effective_from < '20070101' and effective_to is null or effective_from < '20070101' and effective_to >= '20061231'
	group by  organization_id, municipality order by organization_id, "2006" desc
					)
select municipality, count(*) "2006" from year_add group by municipality order by "2006" desc),

fy2007 as (
with year_add as (
	with y_add as (
        select * from rpo.organization_address_entries where organization_id in (
				with y_ as (select * from rpo.organizations	where id in 
                            (select distinct(organization_id) from rpo.new_allacm where effective_from < '20080101' and effective_to is null or effective_from < '20080101' and effective_to >= '20071231'
                            )
                            )
	select id from y_ where established_on < '20080101' and terminated_on is null or established_on < '20080101' and terminated_on >= '20071231'
        																		  )
    				)
	select distinct on (organization_id) municipality, count(distinct(organization_id)) "2007" from y_add where effective_from < '20080101' and effective_to is null or effective_from < '20080101' and effective_to >= '20071231'
	group by  organization_id, municipality order by organization_id, "2007" desc
					)
select municipality, count(*) "2007" from year_add group by municipality order by "2007" desc),

fy2008 as (
with year_add as (
	with y_add as (
        select * from rpo.organization_address_entries where organization_id in (
				with y_ as (select * from rpo.organizations	where id in 
                            (select distinct(organization_id) from rpo.new_allacm where effective_from < '20090101' and effective_to is null or effective_from < '20090101' and effective_to >= '20081231'
                            )
                            )
	select id from y_ where established_on < '20090101' and terminated_on is null or established_on < '20090101' and terminated_on >= '20081231'
        																		  )
    				)
	select distinct on (organization_id) municipality, count(distinct(organization_id)) "2008" from y_add where effective_from < '20090101' and effective_to is null or effective_from < '20090101' and effective_to >= '20081231'
	group by  organization_id, municipality order by organization_id, "2008" desc
					)
select municipality, count(*) "2008" from year_add group by municipality order by "2008" desc),

fy2009 as (
with year_add as (
	with y_add as (
        select * from rpo.organization_address_entries where organization_id in (
				with y_ as (select * from rpo.organizations	where id in 
                            (select distinct(organization_id) from rpo.new_allacm where effective_from < '20100101' and effective_to is null or effective_from < '20100101' and effective_to >= '20091231'
                            )
                            )
	select id from y_ where established_on < '20100101' and terminated_on is null or established_on < '20100101' and terminated_on >= '20091231'
        																		  )
    				)
	select distinct on (organization_id) municipality, count(distinct(organization_id)) "2009" from y_add where effective_from < '20100101' and effective_to is null or effective_from < '20100101' and effective_to >= '20091231'
	group by  organization_id, municipality order by organization_id, "2009" desc
					)
select municipality, count(*) "2009" from year_add group by municipality order by "2009" desc),

fy2010 as (
with year_add as (
	with y_add as (
        select * from rpo.organization_address_entries where organization_id in (
				with y_ as (select * from rpo.organizations	where id in 
                            (select distinct(organization_id) from rpo.new_allacm where effective_from < '20110101' and effective_to is null or effective_from < '20110101' and effective_to >= '20101231'
                            )
                            )
	select id from y_ where established_on < '20110101' and terminated_on is null or established_on < '20110101' and terminated_on >= '20101231'
        																		  )
    				)
	select distinct on (organization_id) municipality, count(distinct(organization_id)) "2010" from y_add where effective_from < '20110101' and effective_to is null or effective_from < '20110101' and effective_to >= '20101231'
	group by  organization_id, municipality order by organization_id, "2010" desc
					)
select municipality, count(*) "2010" from year_add group by municipality order by "2010" desc),

fy2011 as (
with year_add as (
	with y_add as (
        select * from rpo.organization_address_entries where organization_id in (
				with y_ as (select * from rpo.organizations	where id in 
                            (select distinct(organization_id) from rpo.new_allacm where effective_from < '20120101' and effective_to is null or effective_from < '20120101' and effective_to >= '20111231'
                            )
                            )
	select id from y_ where established_on < '20120101' and terminated_on is null or established_on < '20120101' and terminated_on >= '20111231'
        																		  )
    				)
	select distinct on (organization_id) municipality, count(distinct(organization_id)) "2011" from y_add where effective_from < '20120101' and effective_to is null or effective_from < '20120101' and effective_to >= '20111231'
	group by  organization_id, municipality order by organization_id, "2011" desc
					)
select municipality, count(*) "2011" from year_add group by municipality order by "2011" desc),

fy2012 as (
with year_add as (
	with y_add as (
        select * from rpo.organization_address_entries where organization_id in (
				with y_ as (select * from rpo.organizations	where id in 
                            (select distinct(organization_id) from rpo.new_allacm where effective_from < '20130101' and effective_to is null or effective_from < '20130101' and effective_to >= '20121231'
                            )
                            )
	select id from y_ where established_on < '20130101' and terminated_on is null or established_on < '20130101' and terminated_on >= '20121231'
        																		  )
    				)
	select distinct on (organization_id) municipality, count(distinct(organization_id)) "2012" from y_add where effective_from < '20130101' and effective_to is null or effective_from < '20130101' and effective_to >= '20121231'
	group by  organization_id, municipality order by organization_id, "2012" desc
					)
select municipality, count(*) "2012" from year_add group by municipality order by "2012" desc),

fy2013 as (
with year_add as (
	with y_add as (
        select * from rpo.organization_address_entries where organization_id in (
				with y_ as (select * from rpo.organizations	where id in 
                            (select distinct(organization_id) from rpo.new_allacm where effective_from < '20140101' and effective_to is null or effective_from < '20140101' and effective_to >= '20131231'
                            )
                            )
	select id from y_ where established_on < '20140101' and terminated_on is null or established_on < '20140101' and terminated_on >= '20131231'
        																		  )
    				)
	select distinct on (organization_id) municipality, count(distinct(organization_id)) "2013" from y_add where effective_from < '20140101' and effective_to is null or effective_from < '20140101' and effective_to >= '20131231'
	group by  organization_id, municipality order by organization_id, "2013" desc
					)
select municipality, count(*) "2013" from year_add group by municipality order by "2013" desc),

fy2014 as (
with year_add as (
	with y_add as (
        select * from rpo.organization_address_entries where organization_id in (
				with y_ as (select * from rpo.organizations	where id in 
                            (select distinct(organization_id) from rpo.new_allacm where effective_from < '20150101' and effective_to is null or effective_from < '20150101' and effective_to >= '20141231'
                            )
                            )
	select id from y_ where established_on < '20150101' and terminated_on is null or established_on < '20150101' and terminated_on >= '20141231'
        																		  )
    				)
	select distinct on (organization_id) municipality, count(distinct(organization_id)) "2014" from y_add where effective_from < '20150101' and effective_to is null or effective_from < '20150101' and effective_to >= '20141231'
	group by  organization_id, municipality order by organization_id, "2014" desc
					)
select municipality, count(*) "2014" from year_add group by municipality order by "2014" desc),

fy2015 as (
with year_add as (
	with y_add as (
        select * from rpo.organization_address_entries where organization_id in (
				with y_ as (select * from rpo.organizations	where id in 
                            (select distinct(organization_id) from rpo.new_allacm where effective_from < '20160101' and effective_to is null or effective_from < '20160101' and effective_to >= '20151231'
                            )
                            )
	select id from y_ where established_on < '20160101' and terminated_on is null or established_on < '20160101' and terminated_on >= '20151231'
        																		  )
    				)
	select distinct on (organization_id) municipality, count(distinct(organization_id)) "2015" from y_add where effective_from < '20160101' and effective_to is null or effective_from < '20160101' and effective_to >= '20151231'
	group by  organization_id, municipality order by organization_id, "2015" desc
					)
select municipality, count(*) "2015" from year_add group by municipality order by "2015" desc),

fy2016 as (
with year_add as (
	with y_add as (
        select * from rpo.organization_address_entries where organization_id in (
				with y_ as (select * from rpo.organizations	where id in 
                            (select distinct(organization_id) from rpo.new_allacm where effective_from < '20170101' and effective_to is null or effective_from < '20170101' and effective_to >= '20161231'
                            )
                            )
	select id from y_ where established_on < '20170101' and terminated_on is null or established_on < '20170101' and terminated_on >= '20161231'
        																		  )
    				)
	select distinct on (organization_id) municipality, count(distinct(organization_id)) "2016" from y_add where effective_from < '20170101' and effective_to is null or effective_from < '20170101' and effective_to >= '20161231'
	group by  organization_id, municipality order by organization_id, "2016" desc
					)
select municipality, count(*) "2016" from year_add group by municipality order by "2016" desc),

fy2017 as (
with year_add as (
	with y_add as (
        select * from rpo.organization_address_entries where organization_id in (
				with y_ as (select * from rpo.organizations	where id in 
                            (select distinct(organization_id) from rpo.new_allacm where effective_from < '20180101' and effective_to is null or effective_from < '20180101' and effective_to >= '20171231'
                            )
                            )
	select id from y_ where established_on < '20180101' and terminated_on is null or established_on < '20180101' and terminated_on >= '20171231'
        																		  )
    				)
	select distinct on (organization_id) municipality, count(distinct(organization_id)) "2017" from y_add where effective_from < '20180101' and effective_to is null or effective_from < '20180101' and effective_to >= '20171231'
	group by  organization_id, municipality order by organization_id, "2017" desc
					)
select municipality, count(*) "2017" from year_add group by municipality order by "2017" desc)


select * from fy2001
full outer join fy2002 using (municipality)
full outer join fy2003 using (municipality)
full outer join fy2004 using (municipality)
full outer join fy2005 using (municipality)
full outer join fy2006 using (municipality)
full outer join fy2007 using (municipality)
full outer join fy2008 using (municipality)
full outer join fy2009 using (municipality)
full outer join fy2010 using (municipality)
full outer join fy2011 using (municipality)
full outer join fy2012 using (municipality)
full outer join fy2013 using (municipality)
full outer join fy2014 using (municipality)
full outer join fy2015 using (municipality)
full outer join fy2016 using (municipality)
full outer join fy2017 using (municipality)

order by municipality)
