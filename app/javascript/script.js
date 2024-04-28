// 編集ボタンをクリックで、データ更新用フォームを表示

$(document).on('turbolinks:load', function() {
  $('.edit-btn').on('click', function() {
    var row = $(this).closest('.record-row');
    var formRow = row.next('.form-row');

    row.css('display', 'none'); 
    formRow.css('display', 'table-row'); 
  });
});
