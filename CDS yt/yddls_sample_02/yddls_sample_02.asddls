@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: ' CDS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Yddls_Sample_02

  as select from vbak
  association [1..*] to vbap as _item on vbak.vbeln = _item.vbeln
{
  key vbeln as so, --this is mandatory since we used in on condition(Exposed association)
      vkorg as sales_org,
      vbtyp,
      ernam,

      //      head.vkgrp
      //      count(*) as count_num

      //      0.23       as num_lit,
      //      'cds'      as char_lit
      _item
}
-->A cardinality is specified to document the semantics of the data model and,
--in some database systems, for optimizations.

/*
-- Cardinality [min..max]
◾max cannot be 0.
◾An asterisk * for max means any number of rows.
◾min can be omitted (set to 0 if omitted). => [1] = [0..1] , [*] = [0..*]
◾min cannot be *.
◾Default value [min..1]

This work same as left outer join =>
[0..1] [1..1] => TO ONE
[0..*] [1..*] or any other => TO MANY
demo_cds_wrong_cardinality_1.
demo_cds_explicit_card_1


◾When a CDS association is used in a WHERE condition,
  1 must be specified for max.
*/

-- Number of entries will behave defferent in case 0..1 same as LOJ












//When to one join is used (Specifies the cardinality of a left outer join):-
/*
-> select no contain any fields from RHS then optimization take plae
-> Aggregate function  count(*) is used then optimization take plae
*/

/*
1:N left outer join  :- it will create join even we don't fetch data from rhs table
N:1 left outer join  :- it will not create join if we don't fetch data from rhs table
*/
