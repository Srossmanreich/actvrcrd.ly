$(document).ready(function() {

	$('.another-tab').hide();
	// window.onbeforeunload = function() {
 //  	return "You are attempting to leave this page.";}

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
		e.preventDefault();
		var link = $('.addtable').attr('action');
		var input = $('.addtable').serialize();
		$(this).parent().parent().hide();

		console.log(link);
		console.log(input);
		
		var request = $.ajax({
	      method: "POST",
	      url: link,
	      data: input
	    })
	})

});