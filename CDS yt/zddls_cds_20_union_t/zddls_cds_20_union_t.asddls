@AbapCatalog.sqlViewName: 'ZCDS_UNION_T'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'ZDDLS_CDS_20_UNION'
define view zcdsv_union_t as
select from snwd_so as so
  inner join snwd_bpa as bpa 
     on so.buyer_guid = bpa.node_key
 { 
    key bpa.bp_id,
    bpa.company_name,
    sum( gross_amount ) as total_gross_amount,
    'small' as category
 }
group by bpa.bp_id, bpa.company_name
having sum( gross_amount ) < 10000000
 
union all 
 
select from snwd_so as so
  inner join snwd_bpa as bpa 
     on so.buyer_guid = bpa.node_key
 { 
   key bpa.bp_id,
   bpa.company_name,
   sum( gross_amount ) as total_gross_amount,
   'large' as category
 }
group by bpa.bp_id, bpa.company_name
having sum( gross_amount ) >= 10000000  
