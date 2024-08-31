@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Define view entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZDDLS_SAMPLE_02
with parameters 
                @Environment.systemField: #SYSTEM_DATE
                 p_date : abap.dats
as select
  from vbak as head
   left outer to many join  vbap as item
   on head.vbeln = item.vbeln
  {
    key head.vbeln as so,
        head.vkorg as sales__org,
        head.vkgrp ,
        head.vbtyp,
        head.ernam,
//        item.posnr,
//        item.matnr,
        0.23 as num_lit,
        'cds' as char_lit,
        $parameters.p_date as syst_date
}

//operator  = <> > < <= >= ?=
//[not] between a and b
// like % _
//not null not initial
//user condition  => show session variable we can't use right side
//Create define poicy define aspectfor 09 and use to filter 02
//True /flase
//hodt expression parameter session usee literal









//• Default value can be assigned with annotation – @Environment.systemField: #SYSTEM_DATE
//Parameters are optional only when default value is assigned. We can only use system fields such as #SYSTEM_DATE. Possible values are as below.
//DEMO_CDS_SYSTEM_FIELDS_VE











//define view entity ZDDLS_SAMPLE_02
//  with parameters
//    p_vben : vbeln,
//    @Environment.systemField: #SYSTEM_DATE
//    p_date : abap.dats
//  as select from vbak as head
//    inner join   vbap as item on head.vbeln = item.vbeln
//{
//  key head.vbeln as so,
//      head.vkorg as sales__org,
//      head.vkgrp,
//      item.posnr,
//      item.matnr,
//      0.23       as num_lit,
//      'cds'      as char_lit,
//      head.erdat
//}
//where
//      head.vbeln = $parameters.p_vben
//  and head.erdat = $parameters.p_date



/*
A:
 The CDS view entity can be used for high volume transactions or for background transactions.
  -> Maximum No of DDIC database tables 3,
  -> must not call any functions,
  -> must not aggregate a large number of table rows for direct access,
  -> must not access DDIC database tables with mixed data categories.
  -> If the underlying tables are buffered, the CDS view entity should be buffered too.
  -> The runtime for reading a single line with a fully specified key must be less than 1 ms
     for selecting fields from a field list or 2 ms for selecting all fields with
#B:
 The CDS view entity can be used for transactions or for background transactions.
  -> Maximum No of DDIC database tables 5,
  -> must not call any functions,
  -> must not aggregate a large number of table rows for direct access,
  -> must not access DDIC database tables with mixed data categories.
  -> If the underlying tables are buffered, the CDS view entity should be buffered too.
  -> The runtime for reading a single line with a fully specified key must be less than 2 ms
     for selecting fields from a field list or 5 ms for selecting all fields with

#C:
 The CDS view entity can be used to query individual objects in transactions.
  -> Maximum No of DDIC database tables 15,
  -> must not aggregate a large number of table rows for direct access,
  -> must not access DDIC database tables with mixed data categories.
  -> If the underlying tables are buffered, the CDS view entity should be buffered too.
  -> The runtime for reading a single line with a fully specified key must be less than 10 ms
     for selecting fields from a field list or 20 ms for selecting all fields with


#D:
 The CDS view entity can be used for analytical queries.
 -> Maximum No of DDIC database tables 100,
 -> The performance should be checked and monitored with realistic data by a test framework.

#X:
 The CDS view entity is designed for special application cases, such as data migration.
 -> Maximum No of DDIC database tables more than 100,
#P:
 The CDS view entity is used to structure hierarchies of CDS entities and must not be used outside of such a hierarchy.
 -> A CDS view entity with the quality category P is not intended for usage in business applications.
 -> Performance checks by a test framework are not required.

 */
