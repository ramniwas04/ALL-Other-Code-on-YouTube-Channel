@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Inner join'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZDDLS_SAMPLE_05 
 as select from ZDDLS_SAMPLE_04._item as item
  association[*] to makt as _matdesc
     on item.matnr = _matdesc.matnr
  association[*] to vbfa as _docflow
     on item.vbeln = _docflow.vbelv
     and item.posnr = _docflow.posnv
     and _docflow.vbtyp_v = 'C'
     and _docflow.vbtyp_n = 'M'
  {
    
 vbeln,
 posnr,
 matnr,
 _matdesc[spras = 'E'].maktx,
 _docflow[inner].vbeln as invoice,
 _docflow[inner].posnn
}
where vbeln = '0000000149' or
      vbeln = '0000000011'
     
