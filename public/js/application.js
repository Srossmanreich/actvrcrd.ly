$(document).ready(function() {

	// window.onbeforeunload = function() {
 //  	return "You are attempting to leave this page.";}

	$('.schema-explanation').hide();
  
	$('.get-started').click(function(e){
		e.preventDefault();
		$('.home-explanation').hide();
		$('.schema-explanation').show();
		$('.another-tab').hide();
	})

	$('.another-col').click(function(e){
		e.preventDefault();
		var toAddCols = $('.morecolumns').html();
		$(this).parent().parent().append("<p>"+toAddCols+"</p>")
	})

	$('.another-tab').click(function(e){
		e.preventDefault();
		var toAddTab = $('.moretables').html();
		$('.moretables').append("<br>"+toAddTab);
	})

	$('.submit-tables').click(function(e){
		
	})

});