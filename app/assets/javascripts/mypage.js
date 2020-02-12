window.addEventListener('DOMContentLoaded', function(){
  $('.tab-link').on('click', function() {
    $('.mypage-item-list.tab-pane').removeClass("active");
    $($(this).attr("href")).addClass("active");
  
    $('.is-active').removeClass('is-active');
    $(this).parent().parent().addClass('is-active');
      return false;
  });

  $('.tab-link-2').on('click', function() {
    $('.mypage-item-list.tab-pane').removeClass("is-active-now");
    $($(this).attr("href")).addClass("is-active-now");
  
    $('.active-now').removeClass('active-now');
    $(this).parent().parent().addClass('active-now');
      return false;
  });
});