@EndUserText.label: 'ZDdls_sample_08_cds_tab_fun'
define table function Zddls_Sample_08_Cds_Tab_Fun
with parameters 
   @Environment.systemField: #CLIENT
   client : abap.clnt
returns {
  client : abap.clnt;
  id      :char10;
  name       : char50;
  age        : zage_r;
  salary     : abap.curr(10,2);
  curky      : abap.cuky;
}
implemented by method Zddls_smple_08_tab_fun=>emp_detail;


//@AbapCatalog.viewEnhancementCategory: [#NONE]
//@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: 'ZDdls_sample_08_cds_tab_fun'
//@Metadata.ignorePropagatedAnnotations: true
//@ObjectModel.usageType:{
//    serviceQuality: #X,
//    sizeCategory: #S,
//    dataClass: #MIXED
//}
//define view entity ZDdls_sample_08_cds_tab_fun
//  as select from zemployee_salary as sal 
//  association [1] to zemployee_ram as emp 
//  on emp.id = $projection.sal_id
//{
//  key cast( sal.id  as abap.char(20) ) as sal_id,
//    @semantics.amount.currencyCode: 'Curky'
//      sal.salary as Salary,
//      sal.curky as Curky,
//      emp
//  
//
//
//}






















//define view entity ZDdls_sample_08_cds_tab_fun
//  as select from  zemployee_salary as sal
//  association [1] to  zemployee_ram as emp
//         on emp.id =  $projection.sal_id
//{
// key cast ( sal.id as abap.char( 20 ) ) as sal_id,
//     sal.id as Id,
//     @Semantics.amount.currencyCode: 'Curky'
//     sal.salary as Salary,
//     sal.curky as Curky,
//     emp
//
//
//}

//define view entity ZDdls_sample_08_cds_tab_fun
//  as select from zemployee_ram as emp
//  association [1] to zemployee_salary as _sal
//         on emp.id =  $projection.sal_id
//{
// key emp.id as Id,
// emp.name as Name,
// emp.age as Age,
// _sal
//
//}