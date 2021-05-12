$(document).on('turbolinks:load', function(){
    function sendAjaxRequest(data,type_){
        return $.ajax({
            url: '/tags/search',
            type: 'GET',
            data: data,
            dataType: 'json'
          })
          .done(function(data){ //データを受け取ることに成功したら、dataを引数に取って以下のことする
            console.log(data)
            $('#'+type_+"_result").find('li').remove();  //idがresultの子要素のliを削除する
            $(data).each(function(i, tag){ //dataをuserという変数に代入して、以下のことを繰り返し行う
              $('#'+type_+"_result").append('<li>' + tag.name + '</li>') //resultというidの要素に対して、<li>ユーザーの名前</li>を追加する。
            });
          })
    }
    $(document).on('keyup', '#tag_place', function(e){
    e.preventDefault();
    var input = $.trim($(this).val());
    var data = {'keyword':input,'kind':0}
    sendAjaxRequest(data,"place")
  });
  $(document).on('keyup', '#tag_person', function(e){
    e.preventDefault();
    var input = $.trim($(this).val());
    var data = {'keyword':input,'kind':1}
    sendAjaxRequest(data,"person")
  });
});