$(function () {
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="edit-js-file_group">
                    <input class="edit-js-file" type="file" style="display: none" 
<<<<<<< HEAD
                    name="product[images_attributes][${num}][image]"
                    id="item_images_attributes_${num}_image">
                    <label for="product_images_attributes_${num}_image"><i class="icon-camera fas fa-camera"></i></label>
=======
                    name="item[images_attributes][${num}][image]"
                    id="item_images_attributes_${num}_image">
                    <label for="item_images_attributes_${num}_image"><i class="icon-camera fas fa-camera"></i></label>
>>>>>>> cd54a49eebaccb8518d7e9bf0f407d15245aed9f
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }

  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="114px" height="80px">`;
    return html;
  }


  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
    lastIndex = $('.edit-js-file_group:last').data('index');
    fileIndex.splice(0, lastIndex);//0から一番新しい画像データ
    $('.hidden-destroy').hide();

  $('#image-boxs').on('change', '.edit-js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);//追加もしくは変更
    } else if ($('.edit-js-file').length == 10) {
          $('#previews').append(buildImg(targetIndex, blobUrl));
    } else {
        $('#previews').append(buildImg(targetIndex, blobUrl));
        $('#image-boxs').append(buildFileField(fileIndex[0]));
        fileIndex.shift();
        fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('#image-boxs').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    if ($('.edit-js-file').length == 0) $('#image-boxs').append(buildFileField(fileIndex[0]));
  });
});