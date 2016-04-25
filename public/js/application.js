$(document).ready(function() {

	var num = 2

	var toAddTab = $('.moretables').html();
	$('.another-tab').hide();

	var template1 = $("#morecols").html();
	var content1 = Mustache.render(template1, {index: num});
	// window.onbeforeunload = function() {
 //  	return "You are attempting to leave this page.";}

 //Add another column

 	$('.schema-explanation').on('click','.another-col',function(e){
 		e.preventDefault();

		$('.addtable').append(content1);

		num += 1; 
 	})

//Add another table
	
	$('.schema-explanation').on('click','.another-tab',function(e){
		e.preventDefault();
		$('.moretables').append("<br>"+toAddTab);
		$(this).hide();
		setupSubmitTableClick();
	})

//Submit your table
	function setupSubmitTableClick() {
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
	      		
	      		var template2 = $("#table-diagram").html();
	      		var content2 = Mustache.render(template2, {tablename: data.tablename, tablearray: data.columns});

				$('.moretables').prepend(content2);
				$('.another-tab').show();
	    	})

		})
	}

	setupSubmitTableClick();

});

function openModal() {
	location.hash = "#openModal";

	var template = $("#relation").html();
	var content = Mustache.render(template, {
		tables: Array.from($(".table-name")).map(x => ({name:  x.innerHTML}))
	});

	$(".relation-items").append(content);
}