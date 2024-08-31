@AbapCatalog.sqlViewAppendName: 'ZDDLS_CDS_SMPLE1'
@EndUserText.label: 'ZDDLS_CDS_smple_ext'
extend view ZCDSV_smple with ZDDLS_CDS_smple_ext1
{
  head.auart,
  head.audat,
  unit_conversion( quantity => itm.kwmeng,
                      source_unit => itm.vrkme,
                      target_unit => itm.vrkme ) as converted_qty
}
