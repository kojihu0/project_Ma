$(function(){
	$("#replyTxt").on("keyup",function(){
		var cnt = $("#replyTxt").val().length;
		$("#txtLength").text(cnt);
	});
	
	var fund;
	var addFund;
	var total;
//	$("#fund").on("keyup",function(){
//		if(isNaN($("#fund").val())==true){
//			$("#a2").css({
//				"display":"block" 	 
//			});
//			$("#total").text("0");
//		}else{
//			$("#a2").css({
//				"display":"none" 	 
//			});
//			fund = parseInt($("#fund").val());
//			$("#total").text(numberFormat(fund));	
//			if($("#fund").val()==""){
//				$("#total").text("0");
//			}	
//		}
//	});
	$("#addFund").on("keyup",function(){
		if(isNaN($("#addFund").val())==true){
			$("#z1").css({
				"display":"block" 	 
			});
			$("#total").text("0");
		}else{
			$("#z1").css({
				"display":"none" 	 
			});
			fund = parseInt($("#fund").val());
			addFund = parseInt($("#addFund").val());
			total = numberFormat(fund+addFund);
			$("#total").text(total);
			if($("#addFund").val()==""){
				$("#total").text(numberFormat(fund));
			}
//			if($("#fund").val()==""){
//				$("#total").text("0");
//			}
		}
	});
	
	$("#mBox").click(function(){
		var str="";
		$("#mBox").each(function(){
			if($(this).is(":checked")) 
				str=$("#mileage").text();
		});
		$("#mTxt").val(str);
	});
	
	$("#mTxt").on("keyup",function(){
		if(isNaN($("#mTxt").val())==true){
			$("#mile2").css({
				"display":"block" 	 
			});
		}else{
			$("#mile2").css({
				"display":"none" 	 
			});
			var mile = parseInt($("#mileage").text());
			var txt = parseInt($("#mTxt").val());
	
			if(txt>mile){
				$("#txt").css({
					"display":"block" 	 
				});
			}else{
				$("#txt").css({
					"display":"none"	 
				});
			}
		}
	});
	$(".tel1").on("keyup",function(){
		if(isNaN($(".tel1").val())==true){
			$("#c2").css({
				"display":"block" 	 
			});
		}else{
			$("#c2").css({
				"display":"none" 	 
			});
		}
		
	});
	$(".tel2").on("keyup",function(){
		if(isNaN($(".tel2").val())==true){
			$("#c2").css({
				"display":"block" 	 
			});
		}else{
			$("#c2").css({
				"display":"none" 	 
			});
		}
		
	});
	$(".tel3").on("keyup",function(){
		if(isNaN($(".tel3").val())==true){
			$("#n1").css({
				"display":"block" 	 
			});
		}else{
			$("#n1").css({
				"display":"none" 	 
			});
		}
		
	});
	$(".tel4").on("keyup",function(){
		if(isNaN($(".tel4").val())==true){
			$("#n1").css({
				"display":"block" 	 
			});
		}else{
			$("#n1").css({
				"display":"none" 	 
			});
		}
		
	});
	$(".cn1").on("keyup", function(){
		if(isNaN($(".cn1").val())==true){
			$("#g1").css({
				"display":"block" 	 
			});
		}else{
			$("#g1").css({
				"display":"none" 	 
			});
		}
	});
	$(".cn2").on("keyup", function(){
		if(isNaN($(".cn2").val())==true){
			$("#g1").css({
				"display":"block" 	 
			});
		}else{
			$("#g1").css({
				"display":"none" 	 
			});
		}
	});
	$(".cn3").on("keyup", function(){
		if(isNaN($(".cn3").val())==true){
			$("#g1").css({
				"display":"block" 	 
			});
		}else{
			$("#g1").css({
				"display":"none" 	 
			});
		}
	});
	$(".cn4").on("keyup", function(){
		if(isNaN($(".cn4").val())==true){
			$("#g1").css({
				"display":"block" 	 
			});
		}else{
			$("#g1").css({
				"display":"none" 	 
			});
		}
	});
	$(".pw").on("keyup", function(){
		if(isNaN($(".pw").val())==true){
			$("#h1").css({
				"display":"block" 	 
			});
		}else{
			$("#h1").css({
				"display":"none" 	 
			});
		}
	});
	$(".birth").on("keyup", function(){
		if(isNaN($(".birth").val())==true){
			$("#i1").css({
				"display":"block" 	 
			});
		}else{
			$("#i1").css({
				"display":"none" 	 
			});
		}
	});
	

	
//	for(i=1; i<=4; i++){
//		var day = $(".expected").text();  
//		var remain = dateDiff(day, new Date());
//		$(".date").text((remain)+"일 남음");
//	}
	
	$("#chkAll").click(function(){
		$("input[name=chk]").prop("checked",this.checked);
	});
	
	var reg= /^[가-힝]{2,7}$/;
	var reg2= /^\w{4,20}$/;
	var reg3= /^[a-zA-Z]{2,10}[.]{1}[a-zA-Z]{2,3}$/;
	var reg4= /^[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}$/;
	var reg5= /^[a-zA-Z]{1}\w{7,11}$/; 
	var reg6= /^[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}$/;

	
	});
	
	$("#sendId").click(function(){
		if($("input[id='pMember']").prop("checked")==true){
			$("#reNum").css({
				"display":"none"	 
			});
			if(!reg.test($("#rename").val())){
				$("#reTxt").css({
					"display":"block"	 
				});
			}else{
				$("#reTxt").css({
					"display":"none"	 
				});
			}
		}
		if($("input[id='bMember']").prop("checked")==true){
			$("#reTxt").css({
				"display":"none"	 
			});
			if(!reg6.test($("#reBNum").val())){
				$("#reNum").css({
					"display":"block"	 
				});
			}else{
				$("#reNum").css({
					"display":"none"	 
				});
			}
		}
		if(!reg2.test($("#reEmail").val()) || !reg3.test($("#domain").val())){
			$("#reTxt2").css({
				"display":"block"	 
			});
		}else{
			$("#reTxt2").css({
				"display":"none"	 
			});
			$("#emailMsg").css({
				"display":"block"	 
			});
		}
	});
	$("#sendId2").click(function(){
		if(!reg5.test($("#reId").val())){
			$("#reTxt3").css({
				"display":"block"
			});
		}else{
			$("#reTxt3").css({
				"display":"none"
			});
		}
		if(!reg2.test($("#reEmail2").val()) || !reg3.test($("#domain2").val())){
			$("#reTxt4").css({
				"display":"block"	 
			});
		}else{
			$("#reTxt4").css({
				"display":"none"	 
			});
			$("#emailMsg2").css({
				"display":"block"	 
		});
		}
	});
	
	$("#bMember").click(function(){
		$("#reTxt").css({
			"display":"none"	 
		});
		if($("input[id='bMember']").prop("checked")==true){
			$("#bmInfo").css({
				"display":"block"
			});
			$("#pmInfo").css({
				"display":"none"
			});
		}
	});
	$("#pMember").click(function(){
		$("#reNum").css({
			"display":"none"	 
		});
		if($("input[id='pMember']").prop("checked")==true){
			$("#bmInfo").css({
				"display":"none"
			});
			$("#pmInfo").css({
				"display":"block"
			});
		}
	});
var reg= /^[가-힝]{2,7}$/;
var reg2= /^\w{4,20}$/;
var reg3= /^[a-zA-Z]{2,10}[.]{1}[a-zA-Z]{2,3}$/;
var reg4= /^[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}$/;
var reg5= /^[a-zA-Z]{1}\w{7,11}$/; 
var reg6= /^[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}[0-9]{1}$/;
function pay(){
	if(isNaN($("#addFund").val())==true){
		$('html, body').animate( { scrollTop : $("#z").offset().top }, 500 );
		return false;
	}else if(isNaN($("#mTxt").val())==true || parseInt($("#mTxt").val())>parseInt($("#mileage").text())){
		$('html, body').animate( { scrollTop : $("#mile1").offset().top }, 500 );
		return false;
	}else if($("#name").val()=="" || !reg.test($("#name").val())){
		$('html, body').animate( { scrollTop : $("#b").offset().top }, 500 );
		$("#b1").css({
			"display":"block"	 
		});
		return false;
	}else if($(".email1").val()=="" || $(".email2").val()==""){
		$('html, body').animate( { scrollTop : $("#f").offset().top }, 500 );
		$("#f1").css({
			"display":"block"	 
		});
		return false;
	}else if(!reg2.test($(".email1").val()) || !reg3.test($(".email2").val())){
		$('html, body').animate( { scrollTop : $("#f").offset().top }, 500 );
		$("#f2").css({
			"display":"block"	 
		});
		return false;
	}else if($(".tel1").val()=="" || $(".tel2").val()==""){
		$('html, body').animate( { scrollTop : $("#c").offset().top }, 500 );
		$("#c1").css({
			"display":"block"	 
		});
		return false;
	}else if(isNaN($(".tel1").val())==true){
		$('html, body').animate( { scrollTop : $("#c").offset().top }, 500 );
		return false;
	}else if($(".tel1").val().length<4){
		$('html, body').animate( { scrollTop : $("#c").offset().top }, 500 );
		$("#c2").css({
			"display":"block"	 
		});
		return false;
	}else if(isNaN($(".tel2").val())==true){
		$('html, body').animate( { scrollTop : $("#c").offset().top }, 500 );
		return false;
	}else if($(".tel2").val().length<4){
		$('html, body').animate( { scrollTop : $("#c").offset().top }, 500 );
		$("#c2").css({
			"display":"block"	 
		});
		return false;
	}else if(isNaN($(".tel3").val())==true){
		$('html, body').animate( { scrollTop : $("#n").offset().top }, 500 );
		return false;
	}else if($(".tel3").val().length==1 || $(".tel3").val().length==2){
		$('html, body').animate( { scrollTop : $("#n").offset().top }, 500 );
		$("#n2").css({
			"display":"block"	 
		});
		return false;
	}else if(isNaN($(".tel4").val())==true){
		$('html, body').animate( { scrollTop : $("#n").offset().top }, 500 );
		return false;
	}else if($(".tel4").val().length==1 || $(".tel4").val().length==2 || $(".tel4").val().length==3){
		$('html, body').animate( { scrollTop : $("#n").offset().top }, 500 );
		$("#n2").css({
			"display":"block"	 
		});
		return false;
	}else if($(".addr1").val()=="" || $(".addr2").val()==""){
		$('html, body').animate( { scrollTop : $("#d").offset().top }, 500 );
		$("#d1").css({
			"display":"block"	 
		});
		return false;
	}else if(!reg4.test($(".addr1").val())){
		$('html, body').animate( { scrollTop : $("#d").offset().top }, 500 );
		$("#d2").css({
			"display":"block"	 
		});
		return false;
	}else if($("input[id='card']").prop("checked")==false){
		$('html, body').animate( { scrollTop : $("#e").offset().top }, 500 );
		$("#e1").css({
			"display":"block"	 
		});
		return false;
	}else if($(".cn1").val()=="" || $(".cn1").val()=="" || $(".cn3").val()=="" || $(".cn4").val()==""){
		$('html, body').animate( { scrollTop : $("#g").offset().top }, 500 );
		$("#g1").css({
			"display":"block"	 
		});
		return false;
	}else if(isNaN($(".cn1").val())==true || isNaN($(".cn2").val())==true || isNaN($(".cn3").val())==true || isNaN($(".cn4").val())==true){
		$('html, body').animate( { scrollTop : $("#g").offset().top }, 500 );
		$("#g1").css({
			"display":"block"	 
		});
		return false;
	}else if($(".cn1").val().length<4 || $(".cn2").val().length<4 || $(".cn3").val().length<4 || $(".cn4").val().length<4){
		$('html, body').animate( { scrollTop : $("#g").offset().top }, 500 );
		$("#g1").css({
			"display":"block"	 
		});
		return false;
	}else if($(".month option:selected").val()=="월" || $(".year option:selected").val()=="년"){
		$('html, body').animate( { scrollTop : $("#g").offset().top }, 500 );
		$("#j1").css({
			"display":"block"	 
		});
		return false;
	}else if($(".pw").val()=="" || $(".pw").val().length<2){
		$('html, body').animate( { scrollTop : $("#g").offset().top }, 500 );
		$("#h1").css({
			"display":"block"	 
		});
		return false;
	}else if(isNaN($(".pw").val())==true){
		$('html, body').animate( { scrollTop : $("#g").offset().top }, 500 );
		return false;
	}else if($(".birth").val()=="" || $(".birth").val().length<6){
		$('html, body').animate( { scrollTop : $("#g").offset().top }, 500 );
		$("#i1").css({
			"display":"block"	 
		});
		return false;
	}else if(isNaN($(".birth").val())==true){
		$('html, body').animate( { scrollTop : $("#g").offset().top }, 500 );
		return false;
	}else if($("input[id='clause1']").prop("checked")==false){
		$('html, body').animate( { scrollTop : $("#k").offset().top }, 500 );
		$("#k1").css({
			"display":"block"	 
		});
		return false;
	}else if($("input[id='clause2']").prop("checked")==false){
		$('html, body').animate( { scrollTop : $("#l").offset().top }, 500 );
		$("#l1").css({
			"display":"block"	 
		});
		return false;
	}else if($("input[id='clause3']").prop("checked")==false){
		$('html, body').animate( { scrollTop : $("#m").offset().top }, 500 );
		$("#m1").css({
			"display":"block"	
				
		});
		return false;
	}else{ 
		return true;
	}
}

function inputDomain(){
	var email = $("#email option:selected").val();
	if(email=="직접입력"){
		document.getElementById("domain").value="";
	}else{
		document.getElementById("domain").value= email;
	}
} 

function inputDomain2(){
	var email = $("#email2 option:selected").val();
	if(email=="직접입력"){
		document.getElementById("domain2").value="";
	}else{
		document.getElementById("domain2").value= email;
	}
}



function dateDiff(_date_01, _date_02){ 
    var diffDate_01 = _date_01 instanceof Date ? _date_01 : new Date(_date_01);
    //현재 시각
    var diffDate_02 = _date_02 instanceof Date ? _date_02 : new Date(_date_02);

    diffDate_01 = new Date(diffDate_01.getFullYear(), diffDate_01.getMonth() +1, diffDate_01.getDate());
    diffDate_02 = new Date(diffDate_02.getFullYear(), diffDate_02.getMonth() +1, diffDate_02.getDate()); 

    var diff = Math.abs(diffDate_02.getTime() - diffDate_01.getTime());
    diff = Math.ceil(diff / (1000 * 3600 * 24));

    return diff;

}

function numberFormat(inputNumber) {
	   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

var index=0;
window.onload = function(){
	slideShow();
}
function slideShow(){
	var x = document.getElementsByClassName("slide1");
	for(i=0; i<x.length; i++){
		x[i].style.display = "none";
	}
	index++;
	if(index>x.length){
		index=1;
	}
	x[index-1].style.display="block";
	setTimeout(slideShow,5000);
}

//function findUser_Id(){
//	if($("input[id='pMember']").prop("checked")==true){
//		$("#reNum").css({
//			"display":"none"	 
//		});
//		if(!reg.test($("#rename").val())){
//			$("#reTxt").css({
//				"display":"block"
//			});
//			return false;
//		}else{
//			$("#reTxt").css({
//				"display":"none"	 
//			});
//		}
//		
//		if(!reg2.test($("#reEmail").val()) || !reg3.test($("#domain").val())){
//			$("#reTxt2").css({
//				"display":"block"	 
//			});
//			return false;
//		}else{
//			$("#reTxt2").css({
//				"display":"none"	 
//			});
//			$("#emailMsg").css({
//				"display":"block"	 
//			});
//			return true;
//		}
//	}
//	
//	if($("input[id='bMember']").prop("checked")==true){
//		$("#reTxt").css({
//			"display":"none"	 
//		});
//		if(!reg6.test($("#reBNum").val())){
//			$("#reNum").css({
//				"display":"block"	 
//			});
//		}else{
//			$("#reNum").css({
//				"display":"none"	 
//			});
//		}
//	}
//}




