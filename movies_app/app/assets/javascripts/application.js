$(document).ready(function(){
	getCommentForm();
	submitCommentForm();
	getMoviesFromCategory();
});


function getCommentForm() {
	$('.get-comment-form').on('click', function(event) {
		event.preventDefault();

		var $aTag = $(this);

		var $ajax = $.ajax({
			url: $aTag.attr('href')
		});

		$ajax.done(function(response) {
			$aTag.hide();
			$('#add-comment').append(response);
		});
	});
};

function submitCommentForm() {
	$('#add-comment').on('submit', '#comment-form', function(event){
		event.preventDefault();

		var $form = $(this);

		var $ajax = $.ajax({
			url: $form.attr('action'),
			method: $form.attr('method'),
			data: $form.serialize()
		});
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
