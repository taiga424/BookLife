$(function(){
  function buildHTML(comment){
    var html = `<div class="comment-info">
                  <strong>
                    <a class="comment-user" href=/users/${comment.user_id}>${comment.user_name} :</a>
                  </strong>
                  <div class="comment-text">
                  ${comment.text}
                  </div>
                  <div class="comment-btn">
                    <a data-method="delete" href=/books/:book_id/comments/:id, comment.id)>削除</a>
                  </div>
                </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html);
      $('.textbox').val('');
      $('.form__submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});