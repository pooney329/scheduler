(function ($) {
    "use strict";

    
    /*==================================================================
    [ Validate ]*/
    var input = $('.validate-input .input100');

    $('.validate-form').on('submit',function(){
        var check = true;
        //아이디와 패스워드가 형식에 맞게 입력됬는지 확인 
        for(var i=0; i<input.length; i++) {
            if(validate(input[i]) == false){
            	showValidate(input[i]);
                check=false;
            }
        }
        
        if(check){
        	//아이디와 패스워드를 가져온다.
        	var usercheckvalue ={
            		uid : input[0].value,
            		pwd : input[1].value
            };
            
        	//아이디와 패스워드가 맞는지 서버에서 확인 맞으면 true 아니면 false 를 반환 
            $.ajax({
                url: "/scheduler/user/usercheck",
                type: "post",
                async: false,
                data: JSON.stringify(usercheckvalue),
                contentType: "application/json; charset=utf-8;",
                dataType : "json",
                success: function(data,req){
                	var is_userd = data["is_userd"];
                	if(req == "success"){
                		if(data["is_userd"]){
                			/*if(!data["is_emailauth"]){
                				
                				
                			}*/	
                		}
                		else{
                			var $failmessage=$("#loginfailmessage").text("아이디 또는 비밀번호가 잘못되었습니다.")
                			$failmessage.css("color","red");
                			$failmessage.css("font-size","8px");
                			var $failmsgparent = $failmessage.closest("div");
                			$failmsgparent.css("text-align","center");
                			
                			
                			check=false;
                		}
                	}
                },
                error: function(){
                	check=false;
                    alert("서버에러");
                }
            });
        	
        }
        return check;
    });


    $('.validate-form .input100').each(function(){
        $(this).focus(function(){
           hideValidate(this);
        });
    });

    function validate (input) {
        if($(input).attr('type') == 'text' || $(input).attr('name') == 'uid') {
        	/*
            if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                return false;
            }
            */
        	 if($(input).val().trim() == ''){
                 return false;
             }
        	
        }
        else {
            if($(input).val().trim() == ''){
                return false;
            }
        }
    }

    function showValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).addClass('alert-validate');
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
    }
    
    

})(jQuery);