/**
 * detailReply.js: 댓글/답글 데이터 처리용 Ajax 클로저 모듈  */ 
var myCommentModule = (function() {


	function getReplyList(myPaging, callback){
		var bno = myPaging.bno;
		// 페이징 구현 불확실 var pageNum = myPaging.pageNum ;
		//console.log("bno: " + bno);
		//console.log("pageNum: " + pageNum);
		
		//댓글 목록 조회 컨트롤러의 매핑 URL: GET /replies/list/{bno}/{pageNum}
        //$.ajax() 함수는, 자바스크립트 객체를 매개값으로 받아 처리
        $.ajax({
        	type: "get" ,
        	url: "/ourpro00/" + bno ,// 페이징 구현 불확실, ourpro00뒤 주소값 컨트롤러와 동기화 + "/" + pageNum ,
        	dataType: "json" ,
        	success: function(myReplyPagingCreator){
        		if(callback){
        			callback(myReplyPagingCreator);
        		}
        	}
        	
        }); //ajax-end
		
	}//getReplyList 함수종료
	
	
	function registerComment(comment, callback){
		var bno = comment.bno;
		
		//댓글 목록 조회 컨트롤러의 매핑 URL: POST /replies/list/{bno}/new
        $.ajax({
        	type: "post" ,
        	url: "/mypro00/replies/" + bno + "/new",
        	data: JSON.stringify(comment),
        	contentType:"application/json;charset=utf-8",
        	dataType: "text" ,
        	success: function(result){
        		if(callback){
        			callback(result);
        		}
        	}
        	
        }); //ajax-end
		
	}// registerComment함수종료

	return {
		getReplyList: getReplyList 
		
	}
})();
