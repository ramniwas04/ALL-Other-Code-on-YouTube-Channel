@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consume 06'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZDDLS_SAMPLE_07
  as select from ZDDLS_SAMPLE_06
{
  key so,
      kunnr,
      posnr,
      matnr,
      name1,
      /* Associations */
      _docflow[ 1:posnv =$projection.posnr 
                and  vbtyp_n = 'M'].vbeln as invoice,
      _docflow[left outer where posnv =$projection.posnr 
                and  vbtyp_n = 'M'].posnn,      
      _matdesc
}
where
  so = '0000000011'
  or so = '0000000343'
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
