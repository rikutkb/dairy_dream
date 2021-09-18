$(".js-tag_place").val([{id:0,text:"jfa"}]).trigger("change");

$(document).on('turbolinks:load', function(){

    function set_tags(){
      var arrJson = $('.arr_json').val();
      var arr = JSON.parse(arrJson);
      arr.forEach(tag=>{
        var data = {
          id:tag.id,
          text:tag.name
        };
        var opt = new Option(tag.name,tag.id,true,true);
        if(tag.id==0){
          $(".js-tag_person").append(opt).trigger('change');
        }else{
          $(".js-tag_place").append(opt).trigger('change');
        }
      })
    }
    if(location.pathname.split('/').slice(-1)[0]!="new"){
        set_tags();
    }
    function register_tag(e,kind){
      if( e.params.data.isNewFlag ) {
        var $select = $(this);
        $.ajax( {
            type: 'post',
            url: '/dream_app/tags',
            data: { keyword: e.params.data.id ,kind:kind},
            dataType: 'json'
        } ).done( function( json ) {
            $select.find( '[value="'+e.params.data.id+'"]' )
                .replaceWith( '<option selected value="'+json.id+'">' + e.params.data.text + '</option>' );
        } ).fail( function( data ) {
            alert( '登録できませんでした' );
        } );
    }
    }
    function ajax_tmp(kind){
      return ajax_obj = {
        url: "/dream_app/tags/search",
        dataType: 'json',
        delay: 250,
        data:function(params){
          return{
            keyword:params.term,
            kind:kind
          }
        },
        processResults:function(data){
          return{
            results: $.map(data,function(obj){
              return{id:obj.id,text:obj.name}
            })
          }
        }
        
      }
    }
    $(".js-tag_place").select2({
      ajax:ajax_tmp(0),
      multiple: true,
      tags:true,
      createTag:function(obj){
        return{
          id: obj.term,
          text: obj.term,
          isNewFlag: true
        }
      }
    }).on('select2:select',function(e){
      register_tag(e,0)
    })
    $(".js-tag_person").select2({
      ajax:ajax_tmp(1),
      multiple: true,
      tags:true,
      createTag:function(obj){
        return{
          id: obj.term,
          text: obj.term,
          isNewFlag: true
        }
      }
    }).on('select2:select',function(e){
      register_tag(e,1)
    })
});