@EndUserText.label: 'To solv real issue'
define table function yddls_table_function02
with parameters
        @Environment.systemField: #CLIENT
        client : abap.clnt
returns {
  mandt  : abap.clnt;
  id     : char10;
  name   :char20;
  age    :zage_r;
  salary :abap.curr(10,2);
  
}
implemented by method Yddls_table_function2=>get_emp_detail;