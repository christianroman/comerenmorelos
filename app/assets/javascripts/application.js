//= require jquery
//= require jquery_ujs
//= require bootstrap-datepicker
//= require jquery.fancybox
//= require jquery.backstretch


$(function(){

    var arr = [];
    $('.background-images span').each(function(){ arr.push( $(this).data('url') ) });

    $.backstretch(arr, {duration: 3000, fade: 750});

    $('.check_all').change(function(){
	var divParent = $(this).closest('table');
	var checkboxes = divParent.find('input:checkbox');

	if( $(this).is(':checked') ) 
	checkboxes.each(function(){
	    $(this).prop({checked: true});
	});
	else 
	checkboxes.each(function(){
	    $(this).prop({checked: false});
	});
    }); 


});

