$(document).ready(function(){
	$('.comments-list').hide();
	getCommentForm();
	submitCommentForm();
	getMoviesFromCategory();
	showHideComments();
	newMovieAPICall();
	  $('.index-movie').hover(
	    	function() {
	      $(this).addClass('movie_hover');
	    }, function() {
	      $(this).removeClass('movie_hover');
	  });
});


function getCommentForm() {
	$('.get-comment-form').on('click', function(event) {
		event.preventDefault();

		var $aTag = $(this);

		var $ajax = $.ajax({
			url: $aTag.attr('href'),
			dataType: 'script'
		});

		$ajax.done(function(response) {
			$aTag.hide();
			console.log(response)
			$aTag.closest('.add-comment').append(response);
		});
	});
};

function submitCommentForm() {
	$('.add-comment').on('submit', '.comment-form', function(event){
		event.preventDefault();

		var $form = $(this);

		var $ajax = $.ajax({
			url: $form.attr('action'),
			method: $form.attr('method'),
			data: $form.serialize(),
			dataType: 'script'
		});

		$ajax.done(function(response) {
			$form.remove();
			$('.get-comment-form').show();
		})
	});
};

function getMoviesFromCategory() {
	$(".genre-list-item").on('click', function(event){
		event.preventDefault();

		var $genre = $(this).text();
		var url_path = $(this).find("a").attr("href");

		var ajaxRequest = $.ajax({
			url: url_path
		});
	});
};

function showHideComments() {
	$('.toggle-comments').on('click', function(event) {
		event.preventDefault();
		console.log(1)
		$(this).closest('.review-comments').find('.comments-list').slideToggle('medium');
	});
};

function newMovieAPICall() {
	var authToken
	$('.movie-form').on('submit', function(event) {
		event.preventDefault();

		var $form = $(this)

		authToken = $form.find("input[name='authenticity_token']").val();

		var title = $form.find("#movie_title").val();
		var urlFriendlyTitle = title.split(' ').join('+');
		var APIurl = "http://www.omdbapi.com/?t=" + urlFriendlyTitle + "&y=&plot=short&r=json"


		var $ajax = $.ajax({
			url: APIurl
		});

		$ajax.done(function(response) {
			response['authenticity_token'] = authToken
			var $ajaxCreateMovie = $.ajax({
				url: $form.attr('action'),
				method: $form.attr('method'),
				data: $.param(response)
			});

			$ajaxCreateMovie.done(function(response) {
				window.location = response['url'];
			})
		});

	});
	
};