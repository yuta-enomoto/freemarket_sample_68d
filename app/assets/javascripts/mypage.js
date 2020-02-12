window.addEventListener('DOMContentLoaded', function(){

  $('.tab-link').on('click', function() {
    $('.mypage-item-list.tab-pane').removeClass("active");
    $($(this).attr("href")).addClass("active");
    

    $('.tab-link').removeClass('is-active');
    $(this).addClass('is-active');
      return false;
  });
});



