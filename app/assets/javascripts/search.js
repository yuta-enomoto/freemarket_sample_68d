$(document).on('turbolinks:load', function(){
  $(function(){
    

    //商品の状態のチェックボックス=================================
    $(document).on('click','#chk-box', function() {
      if ( $(this).prop('checked') == true ) {
        $(`input#q_condition_id_in`).prop('checked', true); 
      } else {
        $(`input#q_condition_id_in`).prop('checked', false); 
      }
    })

    //配送料の負担のチェックボックス
    $(document).on('click','#chk-box2', function() {
      if ( $(this).prop('checked') == true ) {
        $(`input#q_shipping_fee_who_id_in`).prop('checked', true); 
      } else {
        $(`input#q_shipping_fee_who_id_in`).prop('checked', false); 
      }
    })


    //販売状況のチェックボックス
    $(document).on('click','#chk-box3', function() {
      if ( $(this).prop('checked') == true ) {
        $(`input#q_stock_status_in`).prop('checked', true); 
      } else {
        $(`input#q_stock_status_in`).prop('checked', false); 
      }
    })


  });
});