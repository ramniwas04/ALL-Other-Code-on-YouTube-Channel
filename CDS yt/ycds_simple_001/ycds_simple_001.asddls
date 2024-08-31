@AbapCatalog.sqlViewName: 'YVCDS_001'
/*define view ycds_001 ( sales_ord, customer )
   as select
     key vbeln as so,
         kunnr as cust
         from vbak; */
define view ycds_001(
    sales_ord,
    customer
  )
  as select from vbak
{
  key vbeln as so,
      kunnr as cust
};

//@AbapCatalog.sqlViewName: 'CDS_DB_VIEW'
//[@view_annot1]
//[@view_annot2]
//...
//[DEFINE] [ROOT] VIEW ddic_based_view
//        [name_list]
//        [parameter_list]
--         AS select_statement [;]
/*  dvdgdg */