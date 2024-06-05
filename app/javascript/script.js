// 編集ボタンをクリックで、データ更新用フォームを表示

$(document).on('turbolinks:load', function() {
  $('.edit-btn').on('click', function() {
    let row = $(this).closest('.record-row');
    let formRow = row.next('.form-row');

    row.css('display', 'none'); 
    formRow.css('display', 'table-row'); 
  });
});
