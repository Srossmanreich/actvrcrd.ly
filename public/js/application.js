$(document).ready(function() {

	var num = 2

	var toAddTab = $('.moretables').html();
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
		$('.moretables').append("<br>"+toAddTab);
		$(this).hide();
	})

//Submit your table
	$('.submit-tables').click(function(e){
		e.preventDefault();
		var link = $('.addtable').attr('action');
		var input = $('.addtable').serialize();
		
		$(this).parent().parent().hide();
		
		var request = $.ajax({
	      method: "POST",
	      url: link,
	      data: input + (`&colcount=${num-1}`)
	    })

	    request.done(function(data) {
      		console.log(data);
      		var template = $("#table-diagram").html();
      		var content = Mustache.render(template, {tablename: data.tablename, tablearray: data.columns});

      		console.log(content)
			$('.moretables').prepend(content);
			$('.another-tab').show();
    	})


	})

});