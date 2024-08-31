@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Left outer join cardinality'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZDDLS_SAMPLE_04
  as select from vbak
  association [0..1] to vbap as _item 
  on vbak.vbeln = _item.vbeln
  with default filter _item.netwr > 500
{
  key vbak.vbeln as so,
      @EndUserText.label: 'Customer'
      @EndUserText.quickInfo: 'Customer Info'
      vbak.kunnr,
      vbak.waerk,
      vbak.vkorg,
      vbak.vbtyp,
      @Semantics.amount.currencyCode: 'waerk'
      vbak.netwr,                 
      _item.posnr,
      _item.matnr,
      _item.vrkme,
      @Semantics.amount.currencyCode: 'waerk'
      currency_conversion( amount => vbak.netwr, 
                           source_currency => vbak.waerk, 
                           target_currency => cast( 'USD' as abap.cuky( 3 ) ), 
                           exchange_rate_date => $session.system_date ) as converted_amt,
      cast( 'USD' as abap.cuky ) as converted_cuky,                    
      @Semantics.quantity.unitOfMeasure: 'vrkme'
      _item.kwmeng,
       @Semantics.quantity.unitOfMeasure: 'converted_unit'
      unit_conversion( quantity => _item.kwmeng, 
                      source_unit => _item.vrkme, 
                      target_unit => cast( 'G' as abap.unit( 3 ) ),
                      error_handling => 'SET_TO_NULL'
//                      client => $session.client  
                      )  as converted_qty,
       cast( 'G' as abap.unit( 3 )   )  as converted_unit,               
      _item
}
where _item.vrkme = 'KG'



/*

• SQL functions
    Ø Numeric functions
        ○ ABS(arg)
        ○ CEIL(arg)
        ○ DIV(arg1, arg2)
        ○ DIVISION(arg1, arg2, dec)
        ○ FLOOR(arg)
        ○ MOD(arg1, arg2)
        ○ ROUND(arg, pos)
    Ø String functions
        ○ CONCAT(arg1, arg2)
        ○ CONCAT_WITH_SPACE(arg1, arg2, spaces)
        ○ INSTR(arg, sub)
        ○ LEFT/RIGHT(arg, len) 
        ○ LENGTH(arg)
        ○ LOWER/UPPER(arg)
        ○ LPAD/RPAD(arg, len, src)
        ○ LTRIM/RTRIM(arg, char)
        ○ REPLACE(arg1, arg2, arg3)
        ○ SUBSTRING(arg, pos, len)
    Ø Coalesce function
    
• Special functions
    Ø Conversion functions
    Ø Date functions and time functions
        ○ Type conversion functions
        ○ Unit and Currency Conversion Functions
*/








/*
Unit Conversion performed based on T006 table TCODE CUNI
Client
Error handling. 
'FAIL_ON_ERROR': an error raises an exception (default) 
'SET_TO_NULL': the result is set to the null value 
'KEEP_UNCONVERTED': the source value is not changed.
*/

/*
Optional
exchange_rate_type  :- M  TCURR-KURST
client
round               :- X/'TRUE' (It wil be rounded instead of truncation)
error_handling      :- 'FAIL_ON_ERROR'
decimal_shift       :- X/'TRUE' (decimal places of the source value are moved as specified by the decimal places of the source currency )
--0.2679  => 0.27 * 10^2   X :- --0.2679  => 0.27 * 10^(2-2)
decimal_shift_back  :- X/'TRUE' (decimal places of the result are moved as specified by the decimal places of the target currency )
/*
















 











/*
Annotation specified before the element
It will add further semantics and technical info



EndUserText.label
EndUserText.quickInfo
Display annotation in ALV cl_salv_gui_table_ida
//Se63 TCODe
//      _item.posnr,
//      _item.matnr KWEMNG VRKME

Semantics.amount.currencyCode
Semantics.currencyCode
Semantics.quantity.unitOfMeasure
Semantics.unitOfMeasure


CL_DD_DDL_ANNOTATION_SERVICE
The methods of the class CL_DD_DDL_ANNOTATION_SERVICE collect all annotations belonging to the CDS entity in the following order:
◾Annotations from metadata extensions
◾Direct annotations from the data definition
◾Indirect annotations (derived and inherited annotations



*/






/*
[min..max] =>[max]
max> min   0...n
[0..1]
[*] => [0..*]
[1] => [0..1]

*/










/*
.
This work same as left outer join =>
[0..1] [1..1] => TO ONE
[0..*] [1..*] or any other => TO MANY
demo_cds_wrong_cardinality_1.
demo_cds_explicit_card_1







-- Cardinality [min..max]
◾max cannot be 0.
◾An asterisk * for max means any number of rows.
◾min can be omitted (set to 0 if omitted). => [1] = [0..1] , [*] = [0..*]
◾min cannot be *.
◾Default value [min..1]
◾When a CDS association is used in a WHERE condition,
  1 must be specified for max.
-->A cardinality is specified to document the semantics of the data model and,
--in some database systems, for optimizations
*/
























/*
1:N
N:1

*/







/*
1:N left outer join  :- it will create join even we don't fetch data from rhs table
N:1 left outer join  :- it will not create join if we don't fetch data from rhs table
*/



//When to one join is used (Specifies the cardinality of a left outer join):-
/*
-> select no contain any fields from RHS then optimization take plae
-> Aggregate function  count(*) is used then optimization take plae
*/
