@AbapCatalog.sqlViewName: 'ZCDS_REVISION1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Call parameterise CDS view'
define view ZCDSV_FOR_REVISION_1
with parameters p_matnr:matnr,
                p_meins:meins 
as select * from ZCDSV_FOR_REVISION(p_matnr:$parameters.p_matnr,p_meins:$parameters.p_meins);
