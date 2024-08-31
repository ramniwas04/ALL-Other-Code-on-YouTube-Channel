@AbapCatalog.sqlViewName: 'ZCDS_SIMPL_ASSOC'
@AbapCatalog.compiler.compareFilter: false
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'ZDDLS_CDS_30_ASSOC_SIMPLE'

define view zcdsv_simple_assoc_examples
  as select from snwd_so as so

  association [1..1]    to snwd_bpa       
    as business_partners
     on so.buyer_guid = business_partners.node_key


  --    left outer join snwd_so_inv_head as inv_head
  --        on so.node_key = inv_head.so_guid
  association [0..*] to snwd_so_inv_head as invoice_headers   on so.node_key = invoice_headers.so_guid
{
  key so.so_id                            as order_id,
      so.delivery_status,
      invoice_headers.payment_status,
      invoice_headers.currency_code       as CURRENCY,
      sum( invoice_headers.gross_amount ) as total_gross_amount
}
where
  business_partners.company_name = 'SAP'
group by
  so.so_id,
  so.delivery_status,
  invoice_headers.payment_status,
  invoice_headers.currency_code
having
  sum( invoice_headers.gross_amount ) > 3000
