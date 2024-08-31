@AbapCatalog.sqlViewName: 'ZCDS_FILTER_T'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'ZDDLS_CDS_32A_ASSOC_FILTER'
define view zcdsv_filter_example_base_t
  as select from snwd_so_inv_head as invoice_header
  association [1..*] to snwd_so_inv_item as invoice_items on $projection.header_guid = invoice_items.parent_key
{
  invoice_header.so_guid  as order_guid,
  invoice_header.node_key as header_guid,
  invoice_items
}
