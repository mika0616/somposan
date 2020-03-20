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
  //= require_tree .

// // 状況図プレビュー
 $(document).on('turbolinks:load', function() {
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
 });

 // 解決レポートは入力しないとsubmitボタンが有効にならないようにする

$(function() {
  if ($("#solution-report").val().length == 0) {
    $("#solution-report-submit").prop("disabled", true);
  }
  $("#solution-report").on("keydown keyup keypress change", function() {
    if ( $(this).val().length > 0 ) {
      $("#solution-report-submit").prop("disabled", false);
    } else {
      $("#solution-report-submit").prop("disabled", true);
    }
  });
});

// answer-user-mypageタブ切り替え
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



