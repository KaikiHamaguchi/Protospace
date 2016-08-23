$(function() {
  $('.main_image').after('<span class="preview"></span>');

  // アップロードするファイルを選択
  $('.main_image').change(function() {
    var file = $(this).prop('files')[0];

    // 画像以外は処理を停止
    if (! file.type.match('image.*')) {
      // クリア
      $(this).val('');
      $('.preview').html('');
      return;
    }

    // 画像表示
    var reader = new FileReader();
    reader.onload = function() {
      var img_src = $('<img>').attr('src', reader.result);
      $('.preview').html(img_src);
    }
    reader.readAsDataURL(file);
  });
});


$(function() {
  $('.sub_image1').after('<span class="sub_preview1"></span>');

  // アップロードするファイルを選択
  $('.sub_image1').change(function() {
    var file = $(this).prop('files')[0];

    // 画像以外は処理を停止
    if (! file.type.match('image.*')) {
      // クリア
      $(this).val('');
      $('.sub_preview1').html('');
      return;
    }

    // 画像表示
    var reader = new FileReader();
    reader.onload = function() {
      var img_src = $('<img>').attr('src', reader.result);
      $('.sub_preview1').html(img_src);
    }
    reader.readAsDataURL(file);
  });
});


$(function() {
  $('.sub_image2').after('<span class="sub_preview2"></span>');

  // アップロードするファイルを選択
  $('.sub_image2').change(function() {
    var file = $(this).prop('files')[0];

    // 画像以外は処理を停止
    if (! file.type.match('image.*')) {
      // クリア
      $(this).val('');
      $('.sub_preview2').html('');
      return;
    }

    // 画像表示
    var reader = new FileReader();
    reader.onload = function() {
      var img_src = $('<img>').attr('src', reader.result);
      $('.sub_preview2').html(img_src);
    }
    reader.readAsDataURL(file);
  });
});


