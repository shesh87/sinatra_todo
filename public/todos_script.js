function complete (index) {
	$('span.task-item-' + index + '-container').addClass('complete');
	$.post("/save/")
}

function trash (index) {
	$('li.item-' + index).addClass('done');
	$.post("/delete/" + index);
}