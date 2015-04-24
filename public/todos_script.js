
$( ".form-task" ).submit(function(event) {
	// event.preventDefault();
  // $('.notepad').addClass('pad');
  
});

$('input.js-email').on('click', function () {
	$(this).next('.task-item-container').toggleClass('complete');
});

// $('.btn-trash').on('click', function () {
// 	$(this)
// });

function trash (index) {
	// $('li.item-' + index).addClass('done');
	$.post("/delete/" + index);
	// $.post("/delete/" + index).done(function() {
	// 	if ($('.task-item-0').text() == "") {
	// 		// find();
			// console.log('yes');
	// 	} else {
	// 	}
	// });
	// $('ul').empty();
	// find();
}
function find() {
	if ($('.task-item-0').text() == "") {
		// $('.notepad').addClass('none');
		console.log('yes-again');
	} else {
	}
}





