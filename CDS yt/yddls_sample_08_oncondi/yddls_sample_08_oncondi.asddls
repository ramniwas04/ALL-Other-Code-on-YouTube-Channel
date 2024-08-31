@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'On condition mismatch'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
//define view entity Yddls_Sample_08_Oncondi 
//   as select from zemployee_ram as emp
//   association [1] to zemployee_salary as sal
////     on  EMP.id = sal.ID
//     on  $projection.sal_id = sal.ID
// {
//    key EMP.id as EMP_Id,
//    emp.name as Name,
//    emp.age as Age,
//    cast ( sal.id as abap.char( 10 ) ) as sal_id
//}
define view entity Yddls_Sample_08_Oncondi 
   as select from zemployee_salary as sal 
   association [1] to zemployee_ram as emp
//     on  EMP.id = sal.ID
     on  $projection.sal_id = emp.id
 {
    key  cast ( sal.id as abap.char( 15 ) ) as sal_id,
    @Semantics.amount.currencyCode: 'Curky'
    sal.salary as Salary,
    sal.curky as Curky
}
