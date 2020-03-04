document.addEventListener("turbolinks:load", function() {
  function update_field(){
    let profit = Math.round($('#item_price').val() * 0.9);
    let fee = $('#item_price').val() - profit;
    if(isNaN(profit)) {
      var innerHTMLfee = `<div class= "fee-alert seles-calc"> 価格は半角数値のみで入力してください </div>`
      var innerHTMLprofit = ``
    } else {
      var innerHTMLfee = `<div class= "fee-value seles-calc">¥ ${fee.toLocaleString()}</div>`
      var innerHTMLprofit = `<div class= "profit-value seles-calc">¥ ${profit.toLocaleString()}</div>`
    }
    $('.seles-calc').remove();
    $('#sell-fee-calc').append(innerHTMLfee);
    $('#sell-profit-calc').append(innerHTMLprofit);
  }
  $(function() {
    $('#item_price').on('change', function() {
      update_field();
    });
  });
});