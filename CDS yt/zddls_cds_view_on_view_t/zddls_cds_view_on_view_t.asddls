@AbapCatalog.sqlViewName: 'ZCDS_V_ON_VIEW'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'ZDDLS_CDS_VIew_on_view'
define view ZCDSV_VIew_on_view_t
  as select from ZCDSV_SIMPLE_t
    inner join   snwd_bpa as bpa on bpa.node_key = ZCDSV_SIMPLE_t.buyer_guid
{
  key bpa.bp_id,
      bpa.company_name,
      ZCDSV_SIMPLE_t.currency_code,
      ZCDSV_SIMPLE_t.gross_amount
}
