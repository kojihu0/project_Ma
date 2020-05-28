$(function(){
	
	$(window).scroll(function(){
		//스크롤 위치 가져오기 
	
		var scrollPos = $(window).scrollTop();
		 
			if(scrollPos > 1200){  
				$(".youtube_ment_01").stop().animate({
					'opacity':'1', 
					'margin-left':'122px'     
				}, 2000);  
				   
				$("#player").stop().animate({
					'opacity':'1'
				}, 3000);
			}
			if(scrollPos < 1150){  
				$(".youtube_ment_01").stop().animate({
					'opacity':'0', 
					'margin-left':'-604px' 
				}, 1000);    
				$("#player").stop().animate({ 
					'opacity':'0' 
				}, 1000);
			} 
			
			if(scrollPos<90){
				$(".page_up_div").fadeOut();
			}else{
				$(".page_up_div").fadeIn();
			}
			  
		});  
	
	
	
    /* 메뉴 */
    var navHeight = $('#site-navigation').height();
    $('#site-navigation>.nav-menu>.menu-item.has-child').on({
        'mouseenter':function(){
            //e.stopPropagation();
            var submenu = $(this).children('.sub-menu');
            submenu.css('top', navHeight+'px');
            submenu.slideDown(400);
        },
        'mouseleave':function(){
            //e.stopPropagation();
            var submenu = $(this).children('.sub-menu');
            submenu.slideUp(400);
        }
    });

    /* 메뉴 모달 검색창 */
    $('#search-ico').on('click', function(e){
        e.preventDefault();
        $($(this).data('target')).fadeIn(function(){
            $(this).removeClass('hidden');
        });
    });

    $('.modal .close').on('click', function(){
        $(this).parents('.modal').fadeOut(function(){
            $(this).parents('.modal').addClass('hidden');
        });
    });

    $('input.number-only').on('keyup', function(){
        $(this).val($(this).val().replace(/[^0-9]/g,""));
    });
    
    /*페이지 상단으로  가기*/
    $('#scrollToTop').on('click', function(e){
        e.preventDefault();
        $('html,body').animate({
            scrollTop: 0
        });
    });
    
    /* 후원 상세페이지 */
    $('a.btn-donate').on('click', function(e){
        e.preventDefault();
        $('html,body').animate({
            scrollTop: $("#donate").offset().top
        });
    });

//    $('a.add-wishlist').on('click', function(e){
//        e.preventDefault();
//        $(this).toggleClass('added-this');
//    });

    $('.campaign-tab-nav .tab-item a').on('click', function(e){
        e.preventDefault();
        
        $('html,body').animate({
            scrollTop: $("#donate").offset().top
        });

        $('.campaign-tab-nav .tab-item').removeClass('active');
        $('.campaign-tab-content .tab-content-item').removeClass('active');

        $(this).parent().addClass('active');
        $($(this).attr('href')).addClass('active');
    });

    
    $('a.qna-title').on('click', function(e){
        e.preventDefault();
        $($(this).attr('href')).toggleClass('hidden');
    });

    //소셜공유
    var clipboard = new ClipboardJS('.copy_url');
	clipboard.on('success', function(e) {
		alert('URL이 복사되었습니다.');
	    e.clearSelection();
	});
	clipboard.on('error', function() {
		alert('이 브라우저는 지원하지 않습니다.');
    });
    
    $('.btn-share-sns').on('click', function(){
        var sns = $(this).data('sns');
        var url = $(this).data('url');
        var text = $(this).data('text');

        var w = 720;
        var h = 350;

        switch(sns){
            case 'facebook':
                $.post('https://graph.facebook.com', {id:encodeURI(url),scrape:true});
                window.open('https://www.facebook.com/sharer/sharer.php?u='+encodeURIComponent(url), 'charitree_share', 'width='+w+',height='+h+',left='+(screen.availWidth-w)*0.5+',top='+(screen.availHeight-h)*0.5);
                break;
            case 'twitter':
                window.open('https://twitter.com/intent/tweet?text='+encodeURIComponent(text)+'&url='+encodeURIComponent(url), 'charitree_share', 'width='+w+',height='+h+',left='+(screen.availWidth-w)*0.5+',top='+(screen.availHeight-h)*0.5);
                break;
            case 'kakaotalk':
                var share_img_src = $('meta[property="og:image"]').last().attr('content');
                if(share_img_src){
                    Kakao.Link.sendDefault({
                        objectType: 'feed',
                        content: {
                            title: text,
                            imageUrl: share_img_src,
                            link: {
                                mobileWebUrl: url,
                                webUrl: url
                            }
                        }
                    });
                }
                else{
                    alert('카카오톡 링크에 표시할 이미지를 설정해주세요.');
                }
                break;
        }
    });
});

/** 캠페인 상세 폼 유효성 검사 **/
//코멘트
function campaign_comment_validation(){
    if($('textarea[name=campaign_comment]').val().length == 0){
        alert('내용을 입력해주세요');
        return false;
    }
}
//문의
function campaign_qna_validation(){
    if($('input[name=qna_title]').val().length == 0){
        alert('제목을 입력해주세요');
        return false;
    }
    if($('textarea[name=qna_question]').val().length == 0){
        alert('문의내용을 입력해주세요');
        return false;
    }
}
