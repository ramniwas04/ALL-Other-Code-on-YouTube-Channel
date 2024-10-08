@AbapCatalog.sqlViewName: 'ZCDS_12_COND_EXP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'ZCDSV_12_CONDITIONAL_EXP'
define view zcdsv_cond_exp_t
  as select from    snwd_so          as so
    left outer join snwd_so_inv_head as inv_head on so.node_key = inv_head.so_guid
{
  key so.so_id,
      so.currency_code,
      so.gross_amount,
      case delivery_status
            when ' ' then 'OPEN'
            when 'D' then 'DELIVERED'
            else delivery_status
      end                                                      as delivery_status_long,

      case
        when so.gross_amount > 1000
          then 'High Volume Sales Order'
        else ' '
      end                                                      as high_volumne_text,

      coalesce( inv_head.payment_status, 'Not yet invoiced'  ) as payment_status        
}
