@AbapCatalog.sqlViewName: 'ZCDS_ODATA_D'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS View for odata service'
@OData.publish: true
define view ZCDS_simple_odata as select from vbak
association [1..1] to vbap as _vbAP
    on vbak.vbeln = _vbAP.vbeln {
    
    key vbak.vbeln as sales_ord,
        _vbAP.posnr as line_item
}
