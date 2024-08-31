@AbapCatalog.sqlViewName: 'ZCDSV_IN_PAR_T'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'ZDDLS_CDS_14A_INPUT_PARAMETERS'
define view ZCDSV_14A_INPUT_PARAMETE_t
  with parameters
    customer_name : abap.char(80)
  as select from snwd_so  as so
    join         snwd_bpa as bpa on bpa.node_key = so.buyer_guid
{
  key so.so_id as order_id,
  $parameters.customer_name as param_customer_name,
  
  case 
    when bpa.company_name = $parameters.customer_name then 'Found it!'
    else                                                   'Not found'
  end as found_customer 
                     
}
where bpa.company_name = $parameters.customer_name
