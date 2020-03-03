
$(function(){
  $('input[name="book[category_ids][]"]').on('click', function() {
    if ($(this).prop('checked')){
        $('input[name="book[category_ids][]"]').prop('checked', false);
        $(this).prop('checked', true);
    }
  });
});