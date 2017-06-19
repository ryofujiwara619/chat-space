$(function(){

function cerateHtml(data){

    var user_name = '<p class="chat-group-user__name">' + data.name + '</p>'
    var add_link  = '<a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="' + data.id +'" data-user-name="' +               data.name +'">追加</a>'

    var html = '<div class="chat-group-user clearfix">' + user_name + add_link + '</div>'

    return html;

}

function buildHtml(user_name, user_id){
   var input = "<input name='group[user_ids][]' type='hidden' value='"+ user_id + "'>"
   var name = '<p class="chat-group-user__name">' + user_name + '</p>'
   var link  = '<a class="user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn">削除</a>'

   var html = '<div class="chat-group-user clearfix">' + input + name + link + '</div>'

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

      $(data).each(function(i, user){
        var html = cerateHtml(user);
        $("#user-search-result").append("<li>" + html + "</li>");
      });
    })

    // 失敗時
    .fail(function(){
      alert("失敗しました")
    })
    $('#user-search-result').find('li').remove();// 一度出たliをリムーブ
  }); //keyup終了

// 追加ボタンをクリック
  $(document).on('click','.user-search-add',function(e){
    e.preventDefault();

    // ボタンを押された要素を削除
    $(this).parent().remove();

    // ボタンを押された要素をチャットメンバーに追加
    var name = $(this).attr("data-user-name");
    var id = $(this).attr("data-user-id");
    var html = buildHtml(name, id);
    $("#chat-group-users").append(html);

  });

// 削除ボタンをクリック
  $(document).on('click','.user-search-remove',function(e){
    e.preventDefault();
    // ボタンを押された要素を削除
    $(this).parent().remove();
  });
});
