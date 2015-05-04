

$('input.js-email').on('click', function () {
	$(this).next('.task-item-container').toggleClass('complete');
});


function trash (index) {
	$('li.item-' + index).addClass('done');
	$.post("/delete/" + index);
	location.reload();
}
function find() {
	if ($('.task-item-0').text() == "") {
		// $('.notepad').addClass('none');
		console.log('yes');
	$('.notepad').addClass('none');
	} else {
		console.log('no');
	}
}

$(window).load(function() {
	find();
	$("#task-field").focus();
});




