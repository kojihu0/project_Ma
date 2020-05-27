/**
 * 
 */

$(function(){
	$("p.title").on('click',function(){
		$(this).next(".answer").slideToggle(100);
	}); 
	
	$("p.questionBox_title").on('click',function(){
		$(this).next(".questionBox_answer").slideToggle(100);
	}); 
});  
 