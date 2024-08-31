@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Cunsumption 04'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity YDDLS_SAMPLE_05 as select from YDDLS_SAMPLE_04 {
    key sales_order,
    kunnr,
    name1,
    posnr,
    matnr,
    /* Associations */
    _doc_flow[1:vbtyp_n = 'M'].vbeln as invoice,
    _matdesc as material_desc
}
//where sales_order = '0000000011'
