<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<%@ include file="../include/header.jsp" %>
<style>
	.alert,dl{
	display: inline-block;
	width: 200px;
	margin-left: 50px;
	}
	dd{
	color: #28288C;
	}
	dt{
	float: left;
	}
	.bcontentTextBox{
	margin-left: 100px;
	background-color: white;
	}
	
	.subcontent{
  width:100%;
  height:100%;
  position:absolute; /* ��ġ���� : ���� ���� (login-box) �� �������� */
  padding:90px 70px 50px 70px; /* ���鼳�� : ��/������/�Ʒ�/���� */
  }
	.subcontent .resumeList, 
	.subcontent .row{
	  top:0;
	  left:0;
	  right:0;
	  bottom:0;
	  margin-top:150px;
	  position:absolute;
	}
	.subcontent .tab{
		margin-right: 30px;
	}
	
	.subcontent .tab{
	  font-size:22px;
	  margin-right:15px;
	  padding-bottom:5px;
	  margin:0 15px 10px 0;
	  display:inline-block; /* inline 과 block의 속성을 모두 가지게 -> 같은 줄에 입력가능함과 동시에 간격설정 가능  */
	  border-bottom:2px solid transparent;
	}
	.subcontent .btnResumeList:checked + .tab, /* üũ�ڽ� ���� �� ���� ���� ��� ����  */
	.subcontent .btnReplyList:checked + .tab{ /* + �� ���� ���� ������ -> �տ��� ������ ��� �ٷ� ������ ��ġ�ϴ� ������Ҹ� ����  */
	  color:#28288C;
	  border-color:#1161ee;
	}
	.subcontent .btnResumeList,
	.subcontent .btnReplyList,
	.subcontent .check{
	  display:none; /* 체크박스 디스플레이 삭제  */
	} 
	.titleWrapper{
	padding-left: 25%; 
	padding-right: 20%;
	}
	.btn_apply{
	margin-left: 67%; 
	display: inline-block;
	}
	
</style>

<hr>
<div class="titleWrapper">
<%-- 제목 기업 지원 --%>
<div class="wrap_jv_header">
    <a class="placeholder" tabindex="-1"></a>
    <div class="jv_header" data-rec_idx="48341817" data-rec_seq="0">
	    <div class="title_inner">
                            
               <h3><c:out value="bwiter(기업명)"/> </h3>
         </div>
        <h1 class="tit_job" style="margin-left: 5%;">
                        <c:out value="24년 신규 채용 공고 |btitle(제목)"/>    
        </h1>
        <div class="btn_apply" >
        <button type="button" id="btnToList" data-oper="list" class="btn  btn-outline btn-info btnToList"><span>목록</span></button>
            <button type="button" id="jobApply" class="btn btn-outline btn-success jobApply">입사지원</button>        
        </div>
    </div>
    </div>
   <%-- 제목 기업 지원 끝--%>

<hr>
<%-- 세부 기본내용 --%>
<div class="cont wrapper" >
	<div class="col">
		<dl>
		    <dt>등록일&nbsp;</dt><dd><c:out value="2024-06-27|bregdate"/></dd>
		</dl>           
		<dl >
		    <dt>마감일&nbsp;</dt><dd style="color: #800000;"><c:out value="2024-06-27|benddate"/></dd>
		</dl>
		       <div class="alert alert-danger" style="height: 50px; width: 90px;">D-day - <c:out value="5"/></div>
     </div>
     <div class="col">
 		<dl>
		    <dt>직종&emsp;</dt><dd><c:out value="직종|boccupation"/></dd>
		</dl>           
		<dl >
		    <dt>지역&emsp;</dt><dd><c:out value="지역|bregion"/></dd>
		</dl>
		<dl >
		    <dt>모집인원&nbsp;</dt><dd><c:out value="인원|bhcnt"/></dd>
		</dl>
     </div>
        <br>
    </div>
</div>
            <%-- 세부 기본내용 끝--%>
            <hr>

<div class="form-group">
	<div class="col-sm-10">
	    <textarea class="form-control bcontentTextBox" name="bcontent" style="resize: none; height: 500px;" 
	               readonly="readonly"><c:out value="글내용|bcontent"/></textarea>
	</div>
</div>
<hr class="textboxHR" style="height: 500px;">


<%--구직자이력서/댓글  --%>
<div class="subcontent">
	<input id="tab-1" type="radio" name="tab" class="btnResumeList" checked><label for="tab-1" class="tab"> 이력서 조회 </label>
    <!-- input label을 붙여서 텍스트를 클릭시 자동으로 연결된 체크박스를 체크함  -->
    <input id="tab-2" type="radio" name="tab" class="btnReplyList"><label for="tab-2" class="tab"> 댓글 </label>
    <!-- input label을 붙여서 텍스트를 클릭시 자동으로 연결된 체크박스를 체크함  -->
<%--해당 글 구직자 이력서 목록 테이블  --%>
	<div class="resumeList" >
		 <table class="table table-striped table-bordered table-hover" id="dataTables-example"
		              style="width:100%;text-align:center;">
		      <thead>
		          <tr>
		              <th>번호</th>
		              <th>제목</th>
		              <th>작성자</th>
		              <th>지원일</th>
		          </tr>
		      </thead>
		      <tbody>
		      	<c:choose>
		    	 <c:when test="${not empty pagingCreator.appList }">
		        	<c:forEach items="${pagingCreator.appList }" var="appList" >
		              <tr class="myTr" data-bno='<c:out value="${recruiterVO.bno}"/>'>
		                  <td><c:out value="${recruiterVO.bno }"/></td>
		                  <td><c:out value="${appList.btitle }"/><!-- </a> --></td>
		                  <td><c:out value="${appList.bwriter }"/></td>
		                  <td><fmt:formatDate value="${appList.bregdate }" pattern="yyyy/MM/dd HH:mm:s"/></td>
		              </tr>
		           </c:forEach>
		         </c:when>
		        <c:otherwise>
		         <td colspan="6" style="background-color: #F7F8E0;">등록된 게시물이 없습니다</td>
		        </c:otherwise>
		       </c:choose>
		    </tbody>
		</table>
	</div>
<%--해당 글 구직자 이력서 목럭  끝--%>

	<div class="row" style="display: none;">
	    <div class="col-lg-12">
	        <div class="panel panel-default" >
	            <div class="panel-heading">
	                <p style="margin-bottom: 0px; font-size: 16px;">
	                    <strong id="btnStrong" style="padding-top: 2px;">
	                        <span>댓글&nbsp;<c:out value="${myBoard.breplyCnt}"/>개</span> 
	                        <span>&nbsp;</span>
	                        <security:authorize access="isAuthenticated()">
			                        <button type="button" id="btnRegCmt" class="btn btn-warning btn-sm">댓글 등록</button>
	                   		</security:authorize>
	                    </strong>
	                </p>
	            </div> <%-- /.panel-heading --%>
	<%-- 댓글 들어가는 화면부분 --%>
				 <div class="panel-body">
				<%-- 댓글 입력창 div 시작 --%>
				    <div class="form-group" style="margin-bottom: 5px;">
				        <textarea class="form-control txtBoxCmt" name="rcontent"
				                   placeholder="로그인후 댓글작성 부탁드립니다"
				        ></textarea>
				    </div>
				    <hr style="margin-top: 10px; margin-bottom: 10px;">
				<%-- 댓글 입력창 div 끝 --%>
				    <ul class="commentUL"><%-- 댓글 목록 표시 영역 - JavaScript로 내용이 생성되어 표시됩니다.--%>
						<li class="left clearfix commentLi"  data-bno="123456"  data-rno="12">
						    <div>
						        <div id="replyTab" class="replyTab">
						           
						        </div>  
						    </div>
						</li>
				      </ul><%-- /.chat --%>
				</div><%-- /.panel-body --%>
				<%--페이징버튼 --%>
				<div class="panel-footer text-center" id="showCmtPagingNums">
				                <%-- 댓글 목록의 페이징 번호 표시 영역 - JavaScript로 내용이 생성되어 표시됩니다.--%>
				            
	            </div><%--페이징버튼 --%>
	        </div><%-- /.panel --%>
	    </div><%-- .col-lg-12 --%>
	</div><%-- .row : 댓글 화면 표시 끝 --%>
<%-- 댓글 들어가는 화면 끝 --%>
</div>
<%-- subcontent 이력서리스트/댓글목록 끝--%>


<%-- 
<form id="frmSendValue">
		<input type="hidden" id="pageNum" name="pageNum" value="${myBoardPaging.pageNum }">
		<input type="hidden" id="rowAmountPerPage" name="rowAmountPerPage" value="${myBoardPaging.rowAmountPerPage }">
		<input type="hidden" id="bno" name="bno" value="${myBoard.bno}">
		<input type="hidden" id="boccupation" name="boccupation" value="${myBoardPaging.boccupation}">
		<input type="hidden" id="bregion" name="bregion" value="${myBoardPaging.bregion}">
</form> --%>
 <script>
 
 var frmSendValue = $("#frmSendValue");
 var bno = '<c:out value= "${myBoard.bno}"/>';
 
 <%-- 댓글 목록표시 함수 --%>
 function showCmtList(pageNum){
 	myCommentModule.getReplyList(
 		//{bno: bno, pageNum: pageNum || 1 },//페이징 구현 불확실//스크립트에만 사용 앞에값이있으면 페이지넘을쓰고 없으면 뒤에 1을씀
 		
 		function(myReplyPagingCreator){//js callback에 들어감
 			console.log("myReplyPagingCreator: \n" + myReplyPagingCreator);
 			var replyTab = $("div.replyTab");
 			var replyFileInputHtml = "";
 			
 			for(var myReply of myReplyPagingCreator.myReplyList){// 댓글리스트함수 불러와서 재귀함수내에서 myReply로 댓글마다 재귀
 				
 				if(!myReply.rno){//댓글다떨어지면 함수종료
 					return false;
 				}
 				replyFileInputHtml 
 					+= '<div class="replys">'
 					+   "	<span class='header info-rwriter'>";
 					
 				//블라인드처리 이프문
 				if(myReply.rdelFlag == 0){
 					
 					
 					replyFileInputHtml //작성자및 날짜
					+= "		<strong class='primary-font'>" +  myReply.rwriter + "</strong>"
					+   "		<span>&nbsp;</span>"
					+   "		<small class='text-muted'>" + myReply.rregdate+ "${myBoard.bwriter}" + "</small>";
 						
 					if("${usernameh}"==myReply.rwriter||"${adminh}" != ""){//어드민이거나 본인만수정삭제기능
 						replyFileInputHtml
 						+= '	<button type="button" class="btn btn-outline btn-danger btn-xs pull-right btnCmtRemove">삭제</button>'
 						+ '	<button type="button" class="btn btn-outline btn-default btn-xs pull-right btnCmtBlind">블라</button>'
 						+ '	<button type="button" style="display:in-block;" class="btn btn-outline btn-warning btn-xs btnCmtModify">수정</button>'
 	                    + '	<button type="button" style="display:none;" class="btn btn-warning btn-xs btnCmtModifyUpload">수정 등록</button>'
 	                    + '	<hr class="txtBoxCmtHr" style="margin-top:10px; margin-bottom:10px">'
 	                    + '	<textarea class="form-control txtBoxCmtMod" name="rcontent" style="margin-bottom:10px; display:none;">'
 	                    + 		myReply.rcontent + '</textarea>'
 					}
 	                    
                    replyFileInputHtml //글내용
					+= "	</span>"
		            + 	 "	<p class='replyContent' style='white-space : pre'>" + myReply.rcontent + "</p>"
		        	+	 '	<br></textarea></div>';
 	               		
 	               	
 				} else{
 						replyFileInputHtml 
 						+= "		<strong class='primary-font'>" + "</strong>"
 						+ " 	<span>&nbsp;</span>"
 						+ "		<small class='text-muted'>" + "</small>"
 						+ " </span>"
 			            + "	<br><p style='white-space : pre'>블라인드 처리 되었습니다</p><br>"
 	               		+	'<hr class="txtBoxCmtHr" style="margin-top:10px; margin-bottom:10px"></div>';
 				}
 		       
 		                
 			}
 			if(replyFileInputHtml){
 				replyTab.html(replyFileInputHtml);
            	 	replyFileInputHtml = "";
               }
 			/*페이징구현 불확실 showCmtPagingNums(myReplyPagingCreator.rowTotal,
 							  myReplyPagingCreator.myReplyPaging.pageNum,
 							  myReplyPagingCreator.myReplyPaging.rowAmountPerPage); */
 			
 	        
 		           
 		} 
 	)
 }
 
 <%-- 입사지원버튼 활성화 appli화면으로--%>
 $(".jobApply").on("click",function(){
	 	frmSendValue.attr("action", "${contextPath}/application");
	 	frmSendValue.attr("method","get");
	 	
	 	frmSendValue.submit();
	 });
 
 <%-- 목록버튼 활성화 홈화면으로--%>
 $(".btnToList").on("click",function(){
 	frmSendValue.find("#bno").remove();
 	frmSendValue.attr("action", "${contextPath}");
 	frmSendValue.attr("method","get");
 	
 	frmSendValue.submit();
 });
 
 <%--내용확인 함수--%>
 function checkValues() {
 	var btitle = document.getElementById("btitle").value;
 	var bcontent = document.getElementById("bcontent").value;
 	var benddate = document.getElementById("benddate").value;
 	var bhcnt = document.getElementById("bhcnt").value;
 	
 	
 	
 	var regExp = /^\s+$/;
 	
		if(!btitle||!bcontent||!benddate||!bhcnt||regExp.test(btitle)||regExp.test(bcontent)||regExp.test(bhcnt)||regExp.test(bhcnt)){
			alert("모든 내용을입력하세요"+btitle+bcontent+benddate+bhcnt);
			return false;
		}else{
			
			//frmRegister.submit();
			return true;
		}
	}
 
 <%--댓글 등록버튼 활성화--%>
 $("#btnRegCmt").on("click",function(){
 	
 	var rcontent = $(".txtBoxCmt").val();
 	var rwriter = "${usernameforheader}";//로그인시 헤더에 시큐리티에서 긁어온데이터사용
 	var comment = {bno: bno , rcontent: rcontent, rwriter: rwriter};
 	
 	if(!rwriter){
 		return;
 	}
 	
 	myCommentModule.registerComment(
 			comment , 
 			function(result){
 				if(result !=null){
 					alert(result + "번 댓글이 등록되었습니다")
 				} else{
 					alert("비이이이이이이이이이이이상 서버 장애로 댓글 등록이 취소되었습니다")
 				}
 				showCmtList(1);
 			}
 			
 	);//myCommentModule.registerComment()-end
 	
 	
 });
 $('input[name=tab]').on('change', function() {
	 if($('input[id=tab-1]').is(':checked')){
		 $(".resumeList").attr("style","display:in-block;");
		 $(".row").attr("style","display:none;");
	 } else {
		 $(".resumeList").attr("style","display:none");
		 $(".row").attr("style","display:in-block;");
	 }
	});


</script>




<%@ include file="../include/footer.jsp" %>