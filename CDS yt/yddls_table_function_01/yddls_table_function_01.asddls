@EndUserText.label: 'CDS Table Function'
@ClientHandling.type: #CLIENT_DEPENDENT
define table function Yddls_Table_Function_01
//  with parameters
//    @Environment.systemField: #CLIENT
//    clnt : abap.clnt
returns
{
  client_element_name : abap.clnt;
  vbeln               : vbeln;

}
implemented by method
  YCl_cds_table_function=>get_so_data;


//Show without parameter and whithout client in native sql result in debug mode
//Show without parameter and whith client in native sql result in debug mode  
//Show with parameter without defaulting
//Show with parameter with defaulting
//call this in program


/*
ABAP CDS - Table Functions
◾The CDS entity
 The CDS entity can be used as a data source of other CDS entities / SQL.


◾An AMDP function implementation


*/