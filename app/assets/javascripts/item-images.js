$(document).on('turbolinks:load', function(){
  $(function(){

    function buildHTML(count) {
      var html = `<div class="preview-box" id="preview-box__${count}">
                    <div class="upper-box">
                      <img src="" alt="preview">
                    </div>
                    <div class="lower-box">
                      <div class="update-box", id ="item_item_images_attributes_${count}_url">
                        <span class="edit_btn">編集</span>
                      </div>
                      <div class="delete-box", id="delete_btn_${count}" "item_item_images_attributes_${count}__destroy"}>
                        <span>削除</span>
                      </div>
                    </div>
                  </div>`
      return html;
    }
    //ラベルwidth=============================================================================
    function setLabel() {
      var count = $('.preview-box').length;
      if (count == 0) {
        $('.label-content').css('width', 620)
      }
      if (count == 1) {
        $('.label-content').css('width', 496 )
      }
      if (count == 2) {
        $('.label-content').css('width', 372 )
      }
      if (count == 3) {
        $('.label-content').css('width', 248 )
      }
      if (count == 4) {
        $('.label-content').css('width', 124)
      }
      if (count == 5) {
        $('.label-content').css('width', 620)
      }
      if (count == 6) {
        $('.label-content').css('width', 496)
      }
      if (count == 7) {
        $('.label-content').css('width', 372 )
      }
      if (count == 8) {
        $('.label-content').css('width', 248 )
      }
      if (count == 9) {
        $('.label-content').css('width', 124)
      }
    }
    //商品画像編集フォーム===========================================================================
    function editForm() {
      $('.preview-box').each(function(index, box){
        $(box).attr('id', `preview-box__${index}`);
      })
      $('.update-box').each(function(index, box){
        $(box).attr('id', `item_item_images_attributes_${index}_url`);
      })
      $('.delete-box').each(function(index, box){
        $(box).attr('id', `item_item_images_attributes_${index}__destroy`);
      })
      var count = $('.preview-box').length;
      if (count == 10) {
        $('.label-content').hide();
      }
      $(document).on('click', '.delete-box', function() {
        var delId = $(this).attr('id')
        $(`input#${delId}`).prop('checked', true);        
      })
    }

    // 投稿編集時=============================================================================
    if (window.location.href.match(/\/items\/\d+\/edit/)){
      setLabel();
      editForm();
    }
    // エラーメッセージの画面でURLが変わるので、それに対応===========================================
    if (window.location.href.match(/\/items\/\d+/)){
      setLabel();
      editForm();
    }

    //画像を差し替える時=============================================================================
    $(document).on('click', '.update-box', function() {
      var updId = $(this).attr('id')
      $(`input#${updId}`).trigger('click');      
    })
    
    //画像を追加する時=============================================================================
    $(document).on('change', '.hidden-field', function() {
      setLabel();
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $(`input#item_item_images_attributes_${id}__destroy`).prop('checked', false);

      var file = this.files[0];
      var reader = new FileReader();
      reader.readAsDataURL(file);
    
      reader.onload = function() {
        var image = this.result;
        if ($(`#preview-box__${id}`).length == 0) {
          var html = buildHTML(id);
          $('.label-content').before(html);
        }
        $(`#preview-box__${id} img`).attr('src', `${image}`);
        var count = $('.preview-box').length;
        if (count == 10) { 
          $('.label-content').hide();
        }

        setLabel();				
        var id_add = [];
        $('.preview-box').each(function(index, box){
          id_add[index] = $(box).attr('id').replace(/[^0-9]/g, '');
        });

        var x = $('.preview-box').length
        for(var index=0; index<x+1; index++){
          var y = 0

          id_add.map(function(num){
            if (index == num) {
              y = 1
              return false;
            }
          });

          if (y==0){
            $('.label-box').attr({id: `label-box--${index}`,for: `item_item_images_attributes_${index}_url`});
            return false;
          }
        }
      }
    });

  //削除ボタンを押した時=============================================================================
    $(document).on('click', '.delete-box', function() {
      setLabel();
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $(`#preview-box__${id}`).remove();

      var id_add2 = [];
      $('.preview-box').each(function(index, box){
        id_add2[index] = $(box).attr('id').replace(/[^0-9]/g, '');
      });

      $('.preview-box').each(function(index){
        var y = 0

        id_add2.forEach(function(num){
          if (index == num) {
            y = 1
            return false;
          }
        });

        if (y==0){
          $('.label-box').attr({id: `label-box--${index}`,for: `item_item_images_attributes_${index}_url`});
          return false;
        }
      });

      //削除ボタンを押した時ファイルフィールドの中身を消す===============================
      $(`#item_item_images_attributes_${id}_url`).val("");
      var count = $('.preview-box').length;

      //10個めが消されたらラベルを表示===============================================
      setLabel();
      if (count == 9) {
        $('.label-content').show();
      };
    });
  });
});