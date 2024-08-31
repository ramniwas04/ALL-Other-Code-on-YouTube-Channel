@AbapCatalog.sqlViewName: 'YV_SAMPLE_07'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'DDIC'
define view YDDLS_SAMPLE_07_DDIC
  as select from vbak
  association [1..*] to vbap as _item     on  vbak.vbeln = _item.vbeln
  association [1..1] to kna1 as _cust     on  vbak.kunnr = _cust.kunnr
  association [0..*] to vbfa as _doc_flow on  $projection.sales_order = _doc_flow.vbelv
                                          and $projection.posnr       = _doc_flow.posnv
  association [0..*] to makt as _matdesc  on  $projection.matnr = _matdesc.matnr
  with default filter _matdesc.spras = 'E'
{

  key vbeln as sales_order,
      kunnr,
      _cust.name1,
      _item.posnr,
      _item.matnr,
      _item,
      _matdesc,
      _doc_flow
}
