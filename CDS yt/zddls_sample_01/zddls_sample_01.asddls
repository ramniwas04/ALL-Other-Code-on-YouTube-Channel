@AbapCatalog.sqlViewName: 'ZVSQL_SAMPLE_01'
@EndUserText.label: 'This is my fist DDIC based CDS'
@AbapCatalog.preserveKey: true
@AbapCatalog: {
    buffering: {
        status:#SWITCHED_OFF,
        type: #NONE,
        numberOfKeyFields: 000
    },

    viewEnhancementCategory: [#PROJECTION_LIST,#UNION],
    compiler: {
        compareFilter: true
    },
    dataMaintenance: #RESTRICTED
}
@AccessControl.authorizationCheck: #CHECK
@ClientHandling: {
    type: #INHERITED,
    algorithm:#SESSION_VARIABLE
}

define view zcds_sample_01 --( SO, Kunnr, curr,netwr,clnt,sydate,syslang)
  as select from vbak
  association [1..*] to vbap as _item on vbak.vbeln = _item.vbeln
{

  key   vbeln                    as so,
        kunnr                    as cust,
        waerk,
        netwr,
        vkorg,
        vbtyp,
        ernam ,
        $session.client          as syst_client,
        $session.system_date     as syst_date,
        $session.system_language as syst_lang,
        _item

}












/*define view zcds_sample_01
     as select
        key  vbeln as so,
             kunnr as cust
       from vbak; */
// Commentsingle
-- vndvld
/*
DataAging Annotations
ObjectModel.usageType
//@Metadata.ignorePropagatedAnnotations: true
//@ObjectModel.usageType:{
//    serviceQuality: #X,
//    sizeCategory: #S,
//    dataClass: #MIXED
//}
This information is especially important in regards of performance
that can be expected by the consumer of the view.


Create a view use in select report to display results.




/*When an object defined in the CDS source code is activated,
  the annotations defined in the CDS annotation syntax these are saved in
  internal system tables. These tables can then be accessed to evaluate the data.

  We use below class for evaluation of annatation
  CL_DD_DDL_ANNOTATION_SERVICE
-> First it gets data from metadata extension though it's method
-> Then CDS Entity itself to evaluate

-> Annotation devided in three parts
   1. Metadata extension
   2. Direct Annotation (GET_DIRECT_ANNOS_ )
   3. indirect Annotation ( Derived and inheritate )
       inheritate -> CDS entities which accessed in thid cds
       Derived -> It derived from data element if it is not define in cds
*/
