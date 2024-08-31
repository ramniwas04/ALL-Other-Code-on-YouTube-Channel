@AbapCatalog.sqlViewName: 'ZDDLS_CDS_30'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'association'
define view zcdsv_simple_assoc_example
  as select from snwd_so as so
  association [1]    to snwd_bpa         as bp  on so.buyer_guid = bp.node_key
  association [0..1] to snwd_so_inv_head as inv on so.node_key = inv.so_guid
{
  key so.so_id                as order_id,
      so.buyer_guid, 
      so.delivery_status,
      inv.payment_status,
      inv.currency_code,
      bp
//      sum( inv.gross_amount ) as total_gross_amount
}
//where
//  bp.company_name = 'SAP'
//group by
//  so.so_id,
//  so.delivery_status,
//  inv.payment_status,
//  inv.currency_code
//having
//  sum(
//    inv.gross_amount
//  ) > 1
