$(document).ready(function() {
  $('#comment-form').hide();

  $('.modal-trigger').leanModal();



  $('img').mouseover(function(){
    $('img').addClass("circle-highlight")
  });

  $('.hover').mouseover(function(){
    $('img').addClass("circle-highlight")
  });

  $('img').mouseout(function(){
    $('img').removeClass("circle-highlight")
  });

  $('.hover').mouseout(function(){
    $('img').removeClass("circle-highlight")
  });

//Add new question to the page
  $('.container').on('submit','#new-ask-form-container',function(e){
    e.preventDefault();

    var input = $('#ask-question-form').serialize();

    var request = $.ajax({
      method: "POST",
      url: "/posts",
      data: input
    })

    request.done(function(data) {
      console.log(data);
      $('.question-list').append(data);
      $('#modal3').closeModal();
    })

    request.fail(function(data){
      alert("Please enter valid question.");
    })
 })


  $('.upvote').click(function(e){
    e.preventDefault();
    var input = {id: $('.identifier').attr('id')};
    console.log(input)

    $.ajax({
      type: 'post',
      url: '/posts/upvote',
      data: input
    })
    .done(function(data){
      $('#points').text(data.points)
    })
  })

  $('.downvote').click(function(e){
    e.preventDefault();
    var input = {id: $('.identifier').attr('id')};
    console.log(input)

    $.ajax({
      type: 'post',
      url: '/posts/downvote',
      data: input
    })
    .done(function(data){
      $('#points').text(data.points)
    })
  })

  $('.commenting').click(function(e){
    e.preventDefault();
    $('#comment-form').fadeIn(function(){})
  })

  $('.dope').click(function(e){
    e.preventDefault();
    var input = {content: $('.comment-form').attr('id')};
    console.log(input)

    $.ajax({
      type: 'post',
      url: '/posts/upvote',
      data: input
    })
    .done(function(data){
      $('#points').text(data.points)
    })
  })
});




// From HackerNews
// $(document).ready(function() {

//   $('.post-container').on('click','.upvote-button',function(e){
// 	e.preventDefault();

// 	var article = $(this).parent().parent();
// 	var postID = article.attr('id');
// 	var input = {id: postID};

//   	$.ajax({
//   		method: "POST",
//   		url: "/posts/" + postID + "/vote",
//   		data: input
// 	  })
// 	 .done(function(data) {

//     	article.find('.points').text(data.points);
//     	article.find('.upvote-button').css("color","red");
//   	 });

//   })

//   $('.post-container').on('click','.delete',function(e){
//   	e.preventDefault();

//   	var article = $(this).parent().parent();
//   	var postID = article.attr('id');
//   	var input = {id: postID};

//   	$.ajax({
//   		type: "DELETE",
//   		url: "/posts/" + postID,
//   		data: input
// 	  })
// 	 .done(function(data) {
// 	 	article.css("display","none");
//   	});

//   })

//   $('#posts').submit(function(e){
//   	e.preventDefault();

//   	var input = $('#posts').serialize();

//   	$.ajax({
//   		method: "POST",
//   		url: "/posts",
//   		data: input
// 	  })
// 	 .done(function(data) {
// 	 	$('.post-container').append(data);
//   	 })
//   	 .fail(function(data){
//   	 	alert("Please enter valid title.");
//   	 });

//   })

//   $('.links').on('click','a',function(e){
//   	e.preventDefault();
//   	var linkID = $(this).attr('id');

//   	$.ajax({
//   		method: "GET",
//   		url: "/"+linkID
// 	  })
// 	 .done(function(data) {
// 	 	$('.post-container').html(data);
//   	 });

//   })


// });