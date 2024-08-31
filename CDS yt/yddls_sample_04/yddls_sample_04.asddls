@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'path expresson'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity YDDLS_SAMPLE_04
  as select from vbak
  association [1..*] to vbap as _item     on  vbak.vbeln = _item.vbeln
  association [1..1] to kna1 as _cust     on  vbak.kunnr = _cust.kunnr
  association [0..*] to vbfa as _doc_flow on  $projection.sales_order = _doc_flow.vbelv
                                          and $projection.posnr       = _doc_flow.posnv
  association [1..*] to makt as _matdesc  on  $projection.matnr = _matdesc.matnr
  with default filter _matdesc.spras = 'E'
{

  key vbeln as sales_order,
      kunnr,
      _cust.name1,
      _item.posnr,
      _item.matnr,
      _item,
      _matdesc,
      _doc_flow
}

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
    LEFT OUTER determines a left outer joi
◾Filter conditions
  If the join type is explicitly defined with INNER|{LEFT OUTER}, 
  the addition  WHERE must be specified explicitly


*/
