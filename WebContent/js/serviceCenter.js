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
	
    $('a.main-qna-title').on('click', function(e){
        e.preventDefault();
        console.log("눌림?");
        $($(this).attr('href')).toggleClass('hidden');
        
   });	
});  