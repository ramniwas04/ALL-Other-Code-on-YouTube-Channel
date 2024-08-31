@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'basic cds'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@AccessControl.auditing.type: #CUSTOM
@AccessControl.auditing.specification:#(ds)
define view entity YDDLS_SMAPLE_01
//   with parameters p_date : datum
   as select from vbak {
    key vbeln,
        vkorg as sales_org,
        vbtyp,
        kunnr,
        ernam
//        $parameters.p_date as today_date
}
where vkorg = '1710'
