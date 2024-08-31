@AbapCatalog.sqlViewName: 'ZV_RAM_PRACTICE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS View Creation'
define view ZCDS_RAM_practice
  as select from    snwd_so_i as soi
    left outer join snwd_pd   as pd on soi.product_guid = pd.node_key
{
//  key soi.node_key                    as so_item_guid,
      @Semantics.currencyCode: true
      soi.currency_code,
      @Semantics.amount.currencyCode: 'currency_code'
      // Aliaase must be defined for result of aggregate function
      sum(soi.gross_amount)           as total_gross,
      //    pd.product_id,
      // Aliaase must be defined for build in function
      substring( pd.product_id, 4, 4) as short_pd_id,
      case pd.type_code
        when 'PR' then 'Product'
        when 'AD' then 'Advertisment'
        else pd.type_code
        end                           as long_ty_code,
      //      pd.type_code,
      pd.category 

}
where
  pd.category <> 'Software'
//All fields of the select list must be contained in  the group by
//list except aliases and those field which used in aggregate function
group by
//  soi.node_key,
  soi.currency_code,
  pd.product_id,
  pd.type_code,
  pd.category
