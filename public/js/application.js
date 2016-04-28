$(document).ready(function() {

	var num = 2

	var toAddTab = $('.moretables').html();
	$('.another-tab').hide();

 //Add another column

 	$('.schema-explanation').on('click','.another-col',function(e){
 		e.preventDefault();

 		var template1 = $("#morecols").html();
		var content1 = Mustache.render(template1, {index: num});

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
			var input = $('.at-active').serialize();
			$('.addtable').removeClass('at-active');
			
			$(this).parent().parent().hide();
			
			var request = $.ajax({
		      method: "POST",
		      url: link,
		      data: input + (`&colcount=${num-1}`)
		    })

		    request.done(function(data) {
	      		
	      		var template2 = $("#table-diagram").html();
	      		var content2 = Mustache.render(template2, {tablename: data.tablename, table_edit: "edit-table-"+data.table_id, table_delete: "delete-table-"+data.table_id,tablearray: data.columns});

				$('.fill-out-prompt').prepend(content2);
				$('.another-tab').show();
				$('.prompt-text').hide();
				$('.no-tables').hide();
				template2 = "";
	    		content2 = "";
	    	})

		})
	}

	setupSubmitTableClick();

 //Delete your table

 	$('.schema-explanation').on('click','.delete-table',function(e){
 		e.preventDefault();

 		var id = $(this).attr('id').split("-")[2]
 		var link = "/"+id
 		
 		var request = $.ajax({
		      method: "DELETE",
		      url: link,
		      data: {table_id: id}
		})

		request.done(function(data) {
			$('#delete-table-'+data.table_id).parent().parent().remove();
		})
 		
 	})



});

var num = 0

function openModal() {
	location.hash = "#openModal";
}

function addRel() {
	num += 1;
	var template = $("#relation").html();
	var content = Mustache.render(template, {
	index: num, tables: Array.from($(".table-name")).map(x => ({name:  x.innerHTML}))
	});

	$(".relation-items").append("<br>"+content);
}

