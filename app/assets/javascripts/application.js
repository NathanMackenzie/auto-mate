//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
	$(window).scroll(function(){
		if($(window).scrollTop() > 25){
			$("header").css({"box-shadow":"0px 5px 5px 0px rgba(0,0,0,0.75)"});   
		}else{
			$("header").css({"box-shadow":"0px 0px 0px 0px rgba(0,0,0,0.75)"});
		}
	})
})