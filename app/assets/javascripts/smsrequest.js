$(document).ready(
	function() {
	setInterval(function() {
		$('#smsdata').load('/getsmslist');
	}, 3000);
});
