
$( ".form-task" ).submit(function(event) {
	// event.preventDefault();
  $('.notepad').removeClass('none');
  
});

function complete (index) {
	$('.task-item-' + index + '-container').toggleClass('complete');
}

function trash (index) {
	$('li.item-' + index).addClass('done');
	$.post("/delete/" + index);
	alert('done');
	if ($('ul').is(':empty')) {
			$('.notepad').addClass('none');
			alert('works');
		}
}





