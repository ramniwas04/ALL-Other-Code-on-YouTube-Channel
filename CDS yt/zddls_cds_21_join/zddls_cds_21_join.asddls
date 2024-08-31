@AbapCatalog.sqlViewName: 'ZCDSV_JOIN_T'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'ZDDLS_CDS_21_JOIN'
@AbapCatalog.buffering: {
    status: #SWITCHED_OFF,
    type: #NONE,
    numberOfKeyFields: 000
}

define view zcdsv_join
  as select from    snwd_so          as so
    association [1]  to     snwd_bpa         as bpa      on so.buyer_guid = bpa.node_key
    association [0..*] to snwd_so_inv_head as inv_head on so.node_key = inv_head.so_guid
{
  key so.so_id,
      bpa.company_name,
      so.delivery_status,
      inv_head.payment_status,
      @Semantics.currencyCode: true
      so.currency_code as CURRENCY,
      @Semantics.amount.currencyCode: 'CURRENCY'
      so.net_amount
}
