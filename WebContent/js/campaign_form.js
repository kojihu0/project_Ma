$(function(){
	var now = new Date();
	var nowYear;

	//datepicker 세팅
	$('#cam_start').datepicker({
		dateFormat: 'yy-mm-dd',
		minDate: now,
	});
	$('#cam_end').datepicker({
		dateFormat: 'yy-mm-dd',
		minDate: '+1D',
	});
	
	function setDelYear(){
		nowYear = now.getFullYear();
		for(i=0; i<5; i++){
			$('.del_year').append('<option value="'+nowYear+'">'+ nowYear++ +'</option>');
		}
	}
	
	//숫자포맷 세팅
	$('.number-format').number(true, 0);
	
	/*리워드여부 선택*/
	function chkRewardStatus(){
		if($('#cam_reward_status').prop('checked') == true){
			setDelYear();
			//숫자포맷 세팅
			$('.number-format').number(true, 0);
			$('#rewards').removeClass('hidden');
		}
		else{
			$('#rewards').addClass('hidden');
		}
	}
	
	chkRewardStatus();
	
	$('#cam_reward_status').on('click', chkRewardStatus);

	$(document).on('click', '.add-reward-row', function(e){
		e.preventDefault();
		var fieldsetLength = $('.reward-fieldset').length;

		if(fieldsetLength < 5){
			var fieldset = '<div id="reward-fieldset-1" data-number="1" class="reward-fieldset bg-gray-lightest px-4 mb-4"><div class="mb-4 py-4 border-b border-gray"><h3 id="reward-title-1" class="reward-title">리워드<span class="reward-number">1</span></h3></div><div class="mb-4"><label for="reward_name" class="inline-block my-4">리워드명</label><input type="text" name="reward[reward_name_1]" id="reward_name_1" data-name="reward_name" class="appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline"></div><div class="mb-4"><label for="reward_desc" class="inline-block my-4">리워드 설명</label><textarea name="reward[reward_desc_1]" id="reward_desc_1" data-name="reward_desc" placeholder="리워드에 대한 간략한 설명" class="appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline h-24"></textarea></div><div class="mb-4 flex"><div class="w-1/3 pr-4"><label for="reward_price" class="inline-block my-4">리워드 금액</label><input type="text" name="reward[reward_price_1]" value="0" id="reward_price_1" data-name="reward_price" class="number-format appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline"></div><div class="w-1/3 pr-4"><label for="reward_limit" class="inline-block my-4">리워드 수량</label><input type="number" name="reward[reward_limit_1]" value="0" data-name="reward_limit" min="0" id="reward_limit_1" class="number-only appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline"></div><div class="w-1/3"><label for="del_fee" class="inline-block my-4">배송비</label><div class="relative"><input type="text" name="reward[del_fee_1]" value="0" id="del_fee_1" data-name="del_fee" class="appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline"><div class="absolute inset-y-0 right-0 py-2 px-3 text-gray-darkest">원</div></div></div></div><div class="mb-4"><label for="del_date" class="inline-block my-4 w-full">배송일정</label><div class="flex"><div class="w-1/3 flex"><div class="inline-block relative w-1/2 mr-2"><select name="reward[del_year_1]" id="del_year_1" data-name="del_year" class="del_year block appearance-none w-full bg-white border border-gray hover:border-gray-dark px-4 py-2 pr-8 rounded leading-tight focus:outline-none focus:shadow-outline"><option value="0">년</option></select><div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2"><i class="xi-angle-down-min"></i></div></div><div class="inline-block relative w-1/2 mr-2"><select name="reward[del_month_1]" id="del_month_1" data-name="del_month" class="block appearance-none w-full bg-white border border-gray hover:border-gray-dark px-4 py-2 pr-8 rounded leading-tight focus:outline-none focus:shadow-outline"><option value="0">월</option><option value="01">1</option><option value="02">2</option><option value="03">3</option><option value="04">4</option><option value="05">5</option><option value="06">6</option><option value="07">7</option><option value="08">8</option><option value="09">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select><div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2"><i class="xi-angle-down-min"></i></div></div></div><div class="w-2/3"><input type="text" name="reward[del_date_detail_1]" id="del_date_detail_1" data-name="del_date_detail" placeholder="상세일정 ex) 21~말일 배송 예정입니다." class="datepicker-ym appearance-none border border-gray rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline"></div></div></div><div class="reward-ctrl-btn py-4 flex justify-end"><button data-number="1" class="add-reward-row bg-brand hover:bg-brand-dark text-white text-sm py-1 px-2 ml-2 rounded">리워드 추가 <i class="xi-plus"></i></button></div></div><!--reward-fieldset-->';
			var num = $(this).data('number');
			$('#reward-fieldset-'+num).after(fieldset);
			setFieldsetNumber();
			setDelYear();
			//숫자포맷 세팅
			$('.number-format').number(true, 0);
		}
		else{
			alert('리워드는 5개까지 등록 가능합니다.');
		}
		
	});

	$(document).on('click', '.remove-reward-row', function(e){
		e.preventDefault();

		var num = $(this).data('number');
		$('#reward-fieldset-'+num).remove();

		setFieldsetNumber();
	});

	$(document).on('click', '.reward-ctrl-btn button', function(){
		var fieldsetLength = $('.reward-fieldset').length;

		if(fieldsetLength <= 1){
			console.log($('.remove-reward-row'));
			var removeBtn = $('.remove-reward-row').detach();
		}
		else{
			$('#reward-fieldset-1 .reward-ctrl-btn').append(removeBtn);
		}
	});

	function setFieldsetNumber(){
		var idx = 1;
		$('#reward_cnt').val($(".reward-fieldset").length);
		$('.reward-fieldset').each(function(){
			var fieldset = $(this);
			var removeBtn = '<button data-number="'+idx+'" class="remove-reward-row bg-gray hover:bg-gray-dark text-white text-sm py-1 px-2 ml-2 rounded">리워드 삭제 <i class="xi-minus"></i></button>';

			fieldset.attr('id', 'reward-fieldset-'+idx);
			fieldset.attr('data-number', idx);
			
			fieldset.find('.reward-title').attr('id', 'reward-title' + idx);
			fieldset.find('.reward-number').text(idx);

			fieldset.find('.remove-reward-row').remove();
			fieldset.find('.reward-ctrl-btn').append(removeBtn);
			
			fieldset.find('button').attr('data-number', idx);

			fieldset.find('input, textarea, select').each(function(){
				$(this).attr('name', 'reward['+ $(this).data('name')+ "_" + idx +']');
				$(this).attr('id', $(this).data('name')+ "_" + idx)
			});

			idx++;
		});
	}
	
	setFieldsetNumber();
	
	//이미지 업로드
	var imgs = [];
	$('#cam_img').on('change', function(e){
		imgs = [];
		$('#imgPrevew').empty();

		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		//var idx = 0;
		

		filesArr.forEach(function(f){
			if(f.type.match("image/png|image/gif|image/jpeg|image/bmp") && f.size<2097152){
				imgs.push(f);
				console.log(f);
				var reader = new FileReader();
				reader.onload = function(e) {
					var imgThumb = '<div class="w-32 h-32 overflow-hidden bg-white border border-gray rounded mr-2 mb-4"><img class="w-32 h-32 object-cover" src="'+ e.target.result +'"></div>';
					$("#imgPrevew").append(imgThumb);
				}
				reader.readAsDataURL(f);
			}
			else{
				alert('2mb이하 이미지 파일만 업로드 가능합니다.');
				$('#cam_img').val('');
				return false;
			}
			
			
		});

	});
	
});

//유효성검사
function editor_validation(){
	var flag=true;
	var isRewards = $('#cam_reward_status').prop('checked');
	var validationFields = function(){
		if($(this).val().length==0 || $(this).val()==0 || $(this).val()==""){
			$(this).removeClass('border-gray');
			$(this).addClass('border-danger');
			flag=false;
		}
		else{
			$(this).removeClass('border-danger');
			$(this).addClass('border-gray');
			flag=true;
		}
	};
	
	if(isRewards){
		//입력하지 않은 필드 검사
		$('#campaignEditor').find('input[type="text"], input[type="file"], input[type="number"], select, textarea').each(validationFields);
	}
	else{
		$('#campaignEditor').find('input[type="text"], input[type="file"], input[type="number"], select, textarea').not('.reward-fieldset *').each(validationFields);
	}
	

	//시작일,종료일
	var cam_start_date = $('input[name=cam_start_date]').val();
	var startDateArr = cam_start_date.split('-');
	var cam_end_date = $('input[name=cam_end_date]').val();
	var endDateArr = cam_end_date.split('-');

	var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
    var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
         
	if(startDateCompare.getTime() > endDateCompare.getTime()) {
		$('.alert-date').removeClass('hidden');
		scrollTopOfForm('input[name=cam_start_date]');
		flag = false;
	}
	
	//최소금액 최대금액
	var max_money = $('input[name=max_money]').val().replace(',', '');
	var min_money = $('input[name=min_money]').val().replace(',', '');

	if(parseInt(max_money) <= parseInt(min_money)){
		$('.alert-money').removeClass('hidden');
		scrollTopOfForm('input[name=max_price]');
		flag = false;
	}
	
	console.log(flag);
	if(flag == false){
		$('.alert-empty').removeClass('hidden');
		scrollTopOfForm('.campaign-editor-wrap');
	}
	
	return flag;
}

function scrollTopOfForm(el){
	$('html, body').animate({
		scrollTop: $(el).offset().top
	});
}