@EndUserText.label: 'Zddls_my_first_CDS_table_fun'
@ClientHandling.type: #CLIENT_INDEPENDENT
define table function Zddls_My_First_Cds_Table_Fun
   with parameters 
//        @Environment.systemField: #CLIENT
        client1 : abap.clnt
returns
{
  client : abap.clnt;
 @EndUserText.label: 'Sales Order'
  vbeln  : vbeln;
}
implemented by method
  ZCL_my_first_tab_fun=>get_so_header;






















//Show without parameter and whithout client in native sql result in debug mode
//Show without parameter and whith client in native sql result in debug mode
//Show with parameter without defaulting
//Show with parameter with defaulting
//call this in program