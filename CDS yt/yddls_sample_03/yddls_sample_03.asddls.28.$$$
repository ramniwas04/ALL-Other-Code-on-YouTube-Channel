@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'cunsumption view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity YDDLS_SAMPLE_03
  as select from Yddls_Sample_02._item as item
  association [1..1] to makt as _makt
  //    on Yddls_Sample_02._item.matnr = _makt.maktx
//  on $projection.matnr = _makt.matnr
  on item.matnr = _makt.matnr
//  with default filter _makt.spras = 'E'
 association[*] to vbfa as doc_flow
              on doc_flow.vbelv = item.vbeln
              and  doc_flow.posnv =  item.posnr
              and    doc_flow.vbtyp_v = 'C'
              and    doc_flow.vbtyp_n = 'M'

{
  vbeln,
  posnr,
  matnr,
  _makt.maktx,
  doc_flow[1:inner ].vbeln as invoice,
  doc_flow.posnn as invoice_item
}
where
 ( vbeln = '0000000149'
  or  vbeln = '0000000011')
  and _makt.spras = 'E'

/*
SQL path expression
A path expression of the CDS DDL is a sequence of CDS associations 
separated by periods (.)
Source._assoc1(p1,p2)._assoc2(attribute).field

When a CDS entity with a path expression is accessed, the following is evaluated: 
◾The joins defined by the CDS associations, from left to right.
◾All other conditions of the CDS entities involved.

◾The most simple path expression is the name of a single CDS association. = _assoc

If we get mutiple fields from same association then join depends on each fields access


Attribute :-
◾Cardinality  [1:filter condition/join]
  The addition 1: or *: cannot be specified as the only addition in square brackets. 
  It must always be combined with a filter condition. 
  The addition 1: prevents a syntax error if a path specified with filter conditions 
◾Join type implemented when used
    INNER determines an inner join
    LEFT OUTER determines a left outer join
 
◾Filter conditions
  If the join type is explicitly defined with INNER|{LEFT OUTER}, 
  the addition  WHERE must be specified explicitly


*/



--> It create Inner Join
--> We can not specify the pathexpre in on condition
//     ◾Use the $projection syntax in the ON condition or
//     ◾Assign an alias name to the data source

