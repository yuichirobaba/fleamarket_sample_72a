$(function() {
  var dataBox = new DataTransfer();
  var file_field = document.querySelector('input[type=file]')

  $('#img-file').change(function() {
    var files = $('input[type="file"]').prop('files')[0];
    
    $.each(this.files, function(i, file) {
      var fileReader = new FileReader();
      dataBox.items.add(file)
      file_field.files = dataBox.files
      var num = $('.item-image').length + i + 1
      fileReader.readAsDataURL(file);
      if (num == 10) {
        $('#img-preview').css('display', 'none')
      }

      fileReader.onloadend = function() {
        var src = fileReader.result
        var html = `<div class='item-image' data-image="${file.name}">
                      <div class=' item-image__content'>
                        <div class='item-image__content--icon'>
                          <img src=${src} width="114" height="80" >
                        </div>
                      </div>
                      <div class='item-image__operetion'>
                        <div class='item-image__operetion--delete'>削除</div>
                      </div>
                    </div>`
  
        $('#img-preview').before(html);
      };
      $('#img-preview').attr('class', `item-num-${num}`)
    });
  });

  $(document).on("click", '.item-image__operetion--delete', function() {
    var target_image = $(this).parent().parent()
    var target_name = $(target_image).data('image')
    if(file_field.files.length==1) {
      $('input[type=file]').val(null)
      dataBox.clearData();
    }else{
      $.each(file_field.files, function(i,input) {
        if(input.name==target_name) {
          dataBox.items.remove(i)
        }
      })
      file_field.files = dataBox.files
    }
    target_image.remove();
    var num = $('.item-image').length
    $('#img-preview').show()
    $('#img-preview').attr('class', `item-num-${num}`)
  })

  var dropArea = document.getElementById("img-box");

  window.onload = function(e) {
    dropArea.addEventListener("dragover", function(e) {
      e.preventDefault();
      $(this).children('#img-preview').css({'border': '1px solid rgb(204, 204, 204)', 'box-shadow': '0px 0px 4px'})
    },false);

    dropArea.addEventListener("dragleave", function(e) {
      e.preventDefault();
      $(this).children('#img-preview').css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'});
    },false);

    dropArea.addEventListener("drop", function(e) {
      e.preventDefault();
      $(this).children('#img-preview').css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'})
      var files = e.dataTransfer.files;

      $.each(files, function(i,file) {
        var fileReader = new FileReader();

        dataBox.items.add(file)
        file_field.files = dataBox.files
        var num = $('.item-image').length + i + 1

        fileReader.readAsDataURL(file);

        if (num==10) {
          $('img-preview').css('display', 'none')
        }
        fileReader.onload = function() {
          var src = fileReader.result
          var html = `<div class='item-image' data-image="${file.name}">
                        <div class=' item-image__content'>
                          <div class='item-image__content--icon'>
                            <img src=${src} width="114" height="80" >
                          </div>
                        </div>
                        <div class='item-image__operetion'>
                          <div class='item-image__operetion--delete'>削除</div>
                        </div>
                      </div>`
        $('#img-preview').before(html);
        };
        $('#img-preview').attr('class', `item-num-${num}`)
      })
    })
  }
  $(function() {
    $('#product_price').on('input', function() {
      var data = $('#product_price').val();
      var profit = Math.round(data * 0.9)
      var fee = (data - profit)

      $('.product__sales-commission__number').html(fee)

      $('.product__sales-commission__number').prepend('¥')
      $('.product__sales-commission__number2').html(profit)
      $('.product__sales-commission__number2').prepend('¥')
      $('#price').val(profit)

      if(profit == '') {
        $('.product__sales-commission__number2').html('');
        $('.product__sales-commission__number').html('');
      }
    })
  })
});