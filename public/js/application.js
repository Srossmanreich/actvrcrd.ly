$(document).ready(function() {

	// window.onbeforeunload = function() {
 //  	return "You are attempting to leave this page.";}

	$('.schema-explanation').hide();
  
	$('.get-started').click(function(e){
		e.preventDefault();
		$('.home-explanation').hide();
		$('.schema-explanation').show();
	})
	
});

	// $('.modal-trigger').leanModal();

	// $('.add-col').click(function(e){
	// 	e.preventDefault();
	// 	$('.create-table-form').append()
	// })

	// $('.dropdown-button').dropdown({
 //      inDuration: 300,
 //      outDuration: 225,
 //      constrain_width: false, // Does not change width of dropdown to that of the activator
 //      hover: true, // Activate on hover
 //      gutter: 0, // Spacing from edge
 //      belowOrigin: true, // Displays dropdown below the button
 //      alignment: 'left' // Displays dropdown with edge aligned to the left of button
 //    })

 //    $('.dropdown-item').click(function(e){
 //    	e.preventDefault();
 //    	var choice = $(this).text();
 //    	var thisclass = $(this).parent().parent()

 //    	thisclass.hide();
 //    	thisclass.prev().removeClass('dropdown-button red btn col s4').hide();

 //    	var dropdownclass = thisclass.attr('class').split(" ")[0];

	// 	$("<div class='choicefromdrop'>"+choice+"</div>").insertAfter('.'+dropdownclass);

	// 	$(".choicefromdrop").css('margin','0 10px');


 //    })