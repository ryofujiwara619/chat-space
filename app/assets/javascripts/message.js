$(function(){

  function createHtml(data){
    var userName = "<div class = 'chat__middle--message--member'>" + data.userName + "</div>"
    var createdAt = "<div class = 'chat__middle--message--datetime'>" + data.createdAt + "</div>"
    var post_info = "<div class = 'chat__middle--message'>" + userName + createdAt + "</div>"


    if(data.body && !data.image){
      var body = "<div class='chat__middle--contents--body'>" + data.body + "</div>"
      var post_contents = "<div class='chat__middle--contents'>" + body + "</div>"
    }
    else if(!data.body && data.image){
      var imageTag    = '<img src="' + data.image + '">'
      var image = "<div class='chat__middle--contents--image'>" + imageTag + "</div>"
      var post_contents = "<div class='chat__middle--contents'>" + image + "</div>"
    }
    else if(data.body && data.image){
      var body = "<div class='chat__middle--contents--body'>" + data.body + "</div>"
      var imageTag    = '<img src="' + data.image + '">'
      var image = "<div class='chat__middle--contents--image'>" + imageTag + "</div>"
      var post_contents = "<div class='chat__middle--contents'>" + body + "<br>" + image + "</div>"
    }

    var post = "<div class='.chat__middle--post'>" + post_info + post_contents + "</div>"

    var container = "<div class='container'>" + post + "</div>"
    return container;
  }

// resetメソッド
  function resetMethod(){
    $(".chat-form")[0].reset();
  }

// scrollメソッド
  function scrollMethod(){
    $(".chat__middle").animate({
      scrollTop:$(".chat__middle")[0].scrollHeight
    },"1000");
  }

  // submitイベント
  $(".chat-form").on("submit", function(e){
    e.preventDefault();
    var form = $("#new_message").get(0);

    // formに入力されたものの取得
    var fd = new FormData(form);

    // createアクションを呼ぶURL
    var url = $(this).attr("action");

    $.ajax({
      type: 'POST',
      url: url,
      dataType: 'json',
      data:     fd ,
      processData: false,
      contentType: false
    })
    .done(function(data){
      var container = createHtml(data);
      $(".chat__middle").append(container);
      scrollMethod();
      resetMethod();
    })
    .fail(function(){
      alert("送信に失敗しました")
    });
    return false;
  });
});
