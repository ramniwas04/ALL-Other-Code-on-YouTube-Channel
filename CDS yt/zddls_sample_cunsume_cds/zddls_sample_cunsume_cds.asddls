@AbapCatalog.sqlViewName: 'ZSQL_SAMPLE_CUNS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Access controll'
define view ZDDLS_sample_cunsume_cds
  as select from zcds_sample_01
{

  key so,
      cust,
      waerk,
      netwr,
      vkorg,
      syst_client,
      syst_date,
      syst_lang,
      /* Associations */
      _item
}



//INHERIT FOR GRANT 
