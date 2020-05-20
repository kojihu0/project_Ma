/**
 * 
 */

$(function(){ 
	$("p.title").on('click',function(){
		console.log("눌리는 건가?"); 
		$(this).next(".answer").slideToggle(100);
	}); 
	
	$("p.questionBox_title").on('click',function(){
		console.log("눌리는 건가?"); 
		$(this).next(".questionBox_answer").slideToggle(100);
	}); 
	
	var on = $("button.adminAnswerBox").hasClass("ON");
	console.log(on);
	
	if(on == true){ 
		$("button.adminAnswerBox").on('click',function(){
			console.log("눌리는 건가?"); 
			$(this).next(".adminAnswer_text").slideToggle(100);
		});
	}else{
		$("button.adminAnswerBox").css({
			"background-color":"black" 
		});  
	}
});  