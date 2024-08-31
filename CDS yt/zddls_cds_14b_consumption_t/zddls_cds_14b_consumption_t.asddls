@AbapCatalog.sqlViewName: 'ZCDS_CONSUME_V'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'ZDDLS_CDS_14B_CONSUMPTION'
define view zcdsv_consume_param_view_t 
as select from ZCDSV_14A_INPUT_PARAMETE_t( customer_name : 'SAP' ) as vwp
{
  vwp.param_customer_name                   
}
