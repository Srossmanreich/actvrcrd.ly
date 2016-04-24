$(document).ready(function() {

	// window.onbeforeunload = function() {
 //  	return "You are attempting to leave this page.";}

	$('.schema-explanation').hide();
  
	$('.get-started').click(function(e){
		e.preventDefault();
		$('.home-explanation').hide();
		$('.schema-explanation').show();
	})

	$('.modal-trigger').leanModal();

	$('.add-col').click(function(e){
		e.preventDefault();
		$('.create-table-form').append()
	})

});