$(function() {
  function appendOption(category) {
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }

  function appendChildrenBox(insertHTML) {
    var childSelectHtml = '';
    childSelectHtml = `<div class='exhibitionPage__main__contents__detail__category__choose__added' id= 'children_wrapper'>
                        <div class='exhibitionPage__main__contents__detail__category__choose1'>
                          <i class='fas fa-chevron-down exhibitionPage__main__contents__detail__category__choose--arrow-down'></i>
                          <select class="exhibitionPage__main__contents__detail__category__choose--select" id="child_category" name="product[category_id]">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          <select>
                        </div>
                      </div>`;

    $('.product__box__category').append(childSelectHtml);
  }

  function appendGrandchildrenBox(insertHTML) {
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='exhibitionPage__main__contents__detail__category__choose__added' id= 'grandchildren_wrapper'>
                              <div class='exhibitionPage__main__contents__detail__category__choose2'>
                                <i class='fas fa-chevron-down exhibitionPage__main__contents__detail__category__choose--arrow-down'></i>
                                <select class="exhibitionPage__main__contents__detail__category__choose__box--select" id="grandchild_category" name="product[category_id]">
                                  <option value="---" data-category="---">---</option>
                                  ${insertHTML}
                                </select>
                              </div>
                            </div>`;

    $('.product__box__category').append(grandchildSelectHtml);
  }

  $('#parent_category').on('change', function() {
    var parent_category_id = document.getElementById
    ('parent_category').value;
    if (parent_category_id != "選択して下さい"){
      $.ajax({
        url: '/products/category/get_category_children',
        type: 'GET',
        data: { parent_id: parent_category_id },
        dataType: 'json'
      })
      .done(function(children) {
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child) {
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function() {
        alert('カテゴリー取得に失敗しました');
      })
    }else {
      $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove();
    }
  });

  $('.product__box-contents').on('change', '#child_category', function() {
    var child_category_id = $('#child_category option:selected').data('category');
    if (child_category_id != "---") {
      $.ajax({
        url: '/products/category/get_category_grandchildren',
        type: 'GET',
        data: { child_id: child_category_id },
        dataType: 'json'
      })
      .done(function(grandchildren) {
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild) {
            insertHTML += appendOption(grandchild);
          });
          appendGrandchildrenBox(insertHTML);
        }
      })
      .fail(function() {
        alert('カテゴリー取得に失敗しました');
      })
    }else {
      $('#grandchildren_wrapper').remove();
    }
  });
});