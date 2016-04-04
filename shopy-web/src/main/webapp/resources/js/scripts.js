( function( $ ) {
$( document ).ready(function() {
$('#menu').prepend('<div id="menu-button">Menu</div>');
	$('#menu #menu-button').on('click', function(){
		var menu = $(this).next('ul');
		if (menu.hasClass('open')) {
			menu.removeClass('open');
		}
		else {
			menu.addClass('open');
		}
	});
});
} )( jQuery );
