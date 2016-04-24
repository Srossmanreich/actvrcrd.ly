$(document).ready(function() {

	// window.onbeforeunload = function() {
 //  	return "You are attempting to leave this page.";}

	$('.schema-explanation').hide();
  
	$('.get-started').click(function(e){
		e.preventDefault();
		$('.home-explanation').hide();
		$('.schema-explanation').show();
	})

	$('.another-col').click(function(e){
		e.preventDefault();
		$(this).parent().parent().append("<p><input type='text' name='header'><select><option value='integer'>Integer</option><option value='text'>Text</option><option value='datetime'>Datetime</option></select><label><input type='checkbox' id='foreignkey' value='foreignkey'>foreign key?</label><label><input type='checkbox' id='presence' value='presence'>presence required?</label><label><input type='checkbox' id='unique' value='unique'>unique required?</label><label><input type='checkbox' id='poly' value='poly'>polymorphic true?</label></p>")
	})

});