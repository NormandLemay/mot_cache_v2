function confirm_destroy(element, action) {
    if (confirm("Are you sure?")) {
        var f = document.createElement('form');
        f.style.display = 'none';
        element.parentNode.appendChild(f);
        f.method = 'POST';
        f.action = action;
        var m = document.createElement('input');
        m.setAttribute('type', 'hidden');
        m.setAttribute('name', '_method');
        m.setAttribute('value', 'delete');
        f.appendChild(m);
        f.submit();
    }
    return false;
}

$(document).ready(function() {

	
	/* RollOver case grille */
	$('.grille table td').hover(function (){
		$(this).stop().animate({backgroundColor: '#999'}, 'fast');
	},function(){
		$(this).stop().animate({backgroundColor: '#fff'}, 'slow');
	});
	
	
	/* Classification par lettres */
	var textFirstLetter = "";
	for (i=0; i < $('#mot_a_chercher span').length; i++){
		textFirstLetterTemp = $('#mot_a_chercher span').eq(i).html();
		textFirstLetterTemp = textFirstLetterTemp.substring(0,1);
		if (textFirstLetterTemp != textFirstLetter){
			textFirstLetter = textFirstLetterTemp;
			$('#mot_a_chercher span').eq(i).prepend('<h3>' + textFirstLetter.toUpperCase() + '</h3>')
		}
	}
	
	var defaultFontSize = 12;
	$('.textGridSize a.tgplus').click(function (){
		defaultFontSize++;
		$('.grille table td').css({'fontSize': defaultFontSize});
	});
	
	$('.textGridSize a.tgmoin').click(function (){
		defaultFontSize--;
		$('.grille table td').css({'fontSize': defaultFontSize});
	});
	$("#mot_a_chercher").draggable();

});