$(document).on('turbolinks:load', function(){
    function sendAjaxRequest(data,type_){
        return $.ajax({
            url: '/tags/search',
            type: 'GET',
            data: data,
            dataType: 'json'
          })
          .done(function(data){
            console.log(data)
            $('#'+type_+"_result").find('li').remove();  
            $(data).each(function(i, tag){ 
              $('#'+type_+"_result").append('<li>' + tag.name + '</li>') 
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