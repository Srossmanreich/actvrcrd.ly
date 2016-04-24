$(document).ready(function() {

	var num = 2

	$('.another-tab').hide();
	// window.onbeforeunload = function() {
 //  	return "You are attempting to leave this page.";}

 //Add another column

	$('.another-col').click(function(e){
		e.preventDefault();

		var template = $("#morecols").html();

		var content = Mustache.render(template, {index: num});
		$(this).parent().parent().append(content);

		num += 1; 
	})


//Add another table
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

		console.log(input);
		
		var request = $.ajax({
	      method: "POST",
	      url: link,
	      data: input + (`&colcount=${num-1}`)
	    })
	})

});