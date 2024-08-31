@AbapCatalog.sqlViewName: 'ZCDS_SAMPLE_T'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'ZDDLS_CDS_00_SIMPLE'
define view ZCDSV_SIMPLE_t
  as select from snwd_so as so
{
  key       so.node_key,
  key       so.so_id as order_id,
            so.buyer_guid,
            so.gross_amount,
            so.currency_code

}
