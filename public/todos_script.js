function complete (index) {
	$('span.task-item-' + index + '-container').toggleClass('complete');
	// $.post("/save/")
}

function trash (index) {
	$('li.item-' + index).addClass('done');
	$.post("/delete/" + index);
}