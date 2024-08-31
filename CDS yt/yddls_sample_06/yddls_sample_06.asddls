@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consume 5'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity YDDLS_SAMPLE_06 as select from YDDLS_SAMPLE_05 {
    key sales_order,
    kunnr,
    name1,
    posnr,
    matnr,
    invoice,
    /* Associations */
    material_desc
}
