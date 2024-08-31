@AbapCatalog.sqlViewAppendName: 'ZCDS_SIMPLE_EXT'
@EndUserText.label: 'ZDDLS_CDS_13C_VIEW_EXTENSION_t'
extend view ZCDSV_SIMPLE_t with ZDDLS_CDS_13C_VIEW_EXTENSION_t
{
  so.delivery_status,
  so.billing_status,
  so.created_at,
  so.created_by

}
