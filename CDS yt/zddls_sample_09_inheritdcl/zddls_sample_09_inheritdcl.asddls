@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Inherit dcl condition'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@AccessControl.auditing.type: #CUSTOM
@AccessControl.auditing.specification: 'xyz'
define view entity ZDDLS_sample_09_inheritdcl 
as select from vbak {
      key   vbeln                    as so,
        kunnr                    as cust,
        ernam,
//        waerk,
//        netwr,
        vkorg,
        vbtyp
}
