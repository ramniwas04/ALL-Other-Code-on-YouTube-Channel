@AbapCatalog.sqlViewName: 'ZCDS_EXPO_ASSO_T'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Exposed association'
define view ZCDSV_exposed_asso
  as select from zcdsv_assoc_types_t
{
  business_partners.bp_role,
  business_partners.company_name
}
