
$(document).on('turbolinks:load', function(){
    function register_tag(e,kind){
      if( e.params.data.isNewFlag ) {
        var $select = $(this);
        $.ajax( {
            type: 'post',
            url: '/tags',
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
        url: "/tags/search",
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