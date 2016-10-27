$(document).ready(function(){
	getCommentForm();
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
			console.log(response)
			$('#add-comment').append(response);
			console.log(2)
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
		})

		ajaxRequest.done(function(response){
			console.log(response);
		})
	})
}


// LETS PULL ALL JS OUT OF THE DOC READY AND ONLY CALL FUNCTIONS FOR CLEAN JS
//   $('add-rating-btn').on('submit', function(event) {
//     event.preventDefault();
//   });
