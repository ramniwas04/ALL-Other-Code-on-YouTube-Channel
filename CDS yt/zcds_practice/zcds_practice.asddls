@AbapCatalog.sqlViewName: 'ZVCDS_PRACTICE'//Mandatory
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'ssds'
define view ZCDS_practice
( so,number_lit,charl,org,grp )
  as select from vbak
{
  key vbeln as so,
      0.5   as number_lit,
      'char_lit' as char_lit,
      vkorg as sales_org,
      vkgrp as sales_grp
};

//define view ZCDS_practice
//  as select
//    key vbeln      as so,
//        0.5        as number_lit,
//        'char_lit' as char_lit,
//        vkorg      as sales_org,
//        vkgrp      as sales_grp
//  from vbak;

//@AbapCatalog.sqlViewName: 'CDS_DB_VIEW'
//[@view_annot1]
//[@view_annot2]
//...
//[DEFINE] VIEW cds_entity [name_list] [parameter_list] AS select_statement [;]

//In the DDL editor, you can only define one ABAP CDS entity in one DDL source.
--Once activated we can't rename SQL view and CDS entity
--To rename any part of this unity, you need to delete the corresponding DDL source. Consequently,
-- you recreate it and use the new name for the relevant part.
//With the DDL source you have the appropriate ABAP development object, which you can use directly to access the standard ABAP Workbench functionality (transport, syntax check, activation).

//The maximum length for names of DDL sources is 30 characters.


/*•Keywords must be all uppercase, all lowercase, or
   in lowercase with an uppercase initial letter.
   Other mixes of uppercase and lowercase are not allowed.
*********************************************************
◾Comments
•Two forward slashes (//) introduce a comment, which continues until the end of the line.
•Comments within lines or that span multiple lines are enclosed by the characters /*
*********************************************************
/*◾The closing semicolon after a statement is sometimes optional
because one piece of CDS source code can currently only contain a single statement.
********************************************************
//◾The DDL source code of a CDS view does not need to have 
the same name as the CDS entity, but it is advisable to use this name.
//Two repository objects are created for a CDS view (ABAP CDS)
//
--> CDS managed DDIC view - with sqlViewName annotation :- use in SQL obsolute
--> CDS entity - after define view
********************************************************
//SQL views and CDS entities are part of one and the same namespace.
//Therefore, you must assign different names for an SQL view and
//the entity.
***************************************
//Show before activating and try to edit in Tcode se11
************************
//We should use 


//Show SQl console
--Show SQL statement which create HANA view

*/
