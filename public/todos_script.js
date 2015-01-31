function complete (index) {
	$('span.task-item-' + index).addClass('complete');
}

function trash (index) {
	// alert("helo");
	$('li.item-' + index).addClass('done');
	$.post("/delete/" + index);
}