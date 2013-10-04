//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require ckeditor/init

$(function(){

    $('.add_fields').click(function(){

	time = new Date().getTime();
	regexp = new RegExp($(this).data('id'), 'g');

	$(this).before($(this).data('fields').replace(regexp, time));

	return false;
    });

    $('#hotel_description').keyup(function(){
	var max = 342;
	var len = $(this).val().length;

	if (len >= max){
	    $('#charleft').text('Limite de caracteres maximo.');
	} else {
	    var ch = max - len;
	    $('#charleft').text(ch + ' caracteres restantes');
	}
    });

});
