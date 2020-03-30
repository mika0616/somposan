// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

 //= require rails-ujs

  //= require jquery
  //= require jquery_ujs
  //= require bootstrap-sprockets
  //= require bootstrap-tagsinput.min
  //= require_tree .


// // 状況図プレビュー
$(function(){
	$('#file').change(function(e){
	    //ファイルオブジェクトを取得する
	    var file = e.target.files[0];
	    var reader = new FileReader();
	    //画像でない場合は処理終了
	    if(file.type.indexOf("image") < 0){
	    	alert("画像ファイルを指定してください。");
	    	return false;
	    }
	    //アップロードした画像を設定する
	    reader.onload = (function(file){
	    	return function(e){
	    		$("#file-preview").attr("src", e.target.result);
	        	$("#file-preview").attr("title", file.name);
	    	};
	    })(file);
	    reader.readAsDataURL(file);
	});
});

// タブ切り替え
$(function() {
	$('.tab-content>div').hide();
	$('.tab-content>div').first().slideDown();
	  $('.tab-buttons span').click(function(){
	    var thisclass=$(this).attr('class');
	    $('#lamp').removeClass().addClass('#lamp').addClass(thisclass);
	    $('.tab-content>div').each(function(){
	      if($(this).hasClass(thisclass)){
	        $(this).fadeIn(800);
	      }
	      else{
	        $(this).hide();
	      }
	    });
	  });
});

// solve画像切り替え
$(function(){
    var $setElm = $('.solve-img'),
    fadeSpeed = 1500,
    switchDelay = 2000;

    $setElm.each(function(){
        var targetObj = $(this);
        var findUl = targetObj.find('ul');
        var findLi = targetObj.find('li');
        var findLiFirst = targetObj.find('li:first');

        findLi.css({display:'block',opacity:'0',zIndex:'99'});
        findLiFirst.css({zIndex:'100'}).stop().animate({opacity:'1'},fadeSpeed);

        setInterval(function(){
            findUl.find('li:first-child').animate({opacity:'0'},fadeSpeed).next('li').css({zIndex:'100'}).animate({opacity:'1'},fadeSpeed).end();
        },switchDelay);
    });
});




