@AbapCatalog.sqlViewName: 'ZCDS_REVISION'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS view for revision'
@OData.publish: true
define view ZCDSV_FOR_REVISION 
with parameters p_matnr:matnr,
                p_meins:meins
as select from vbak as header
left outer join vbap as item on header.vbeln = item.vbeln {
 key header.vbeln as sales_order,
     case  header.auart   
     when 'TA' then 'Domestic'
     when  'CCFU' then 'International' 
     else 'other'
     end as sales_document,
     header.netwr as net_prise,
     item.matnr   as material,
     item.netwr   as net_value ,
     @Semantics.currencyCode: true
     item.meins   as unit_measure ,
     item.netpr   as net_price  ,
     
     @Semantics.amount.currencyCode: 'unit_measure'
     item.fmeng as quantity,
     item.arktx as sort_text,
     item.spart as division
     }
where item.matnr = $parameters.p_matnr
and   item.meins = $parameters.p_meins;
