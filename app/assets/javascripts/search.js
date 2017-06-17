$(function(){

function cerateHtml(data){

    var user_name = '<p class="chat-group-user__name">' + data.name + '</p>'
    var add_link  = '<a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="' + data.id +'" data-user-name="' +               data.name +'">追加</a>'

    var html = '<div class="chat-group-user clearfix">' + user_name + add_link + '</div>'

    return html;

}

  $(document).on("keyup",'#user-search-field',function(e){
    e.preventDefault();

    // フォームに入力された値の取得
    var input = $.trim($(this).val());

    $.ajax({
      url: '/users',
      type: 'GET',
      data: ('keyword=' + input),
      processData: false,
      contentType: false,
      dataType: 'json'
    })

    // 成功時
    .done(function(data){

      $('#user-search-result').find('li').remove();// 一度出たliをリムーブ

      $(data).each(function(i, user){
        var html = cerateHtml(user);
        $("#user-search-result").append("<li>" + html + "</li>");
      });
    })

    // 失敗時
    .fail(function(){
      alert("失敗しました")
    })
  });
});
