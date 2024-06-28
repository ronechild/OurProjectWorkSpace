<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<%@ include file="./WEB-INF/views/include/header.jsp" %>
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
	
</style>

<hr>
<%-- 제목 기업 지원 --%>
<div class="wrap_jv_header" style="padding-left: 300px;">
    <a class="placeholder" tabindex="-1"></a>
    <div class="jv_header" data-rec_idx="48341817" data-rec_seq="0">
	    <div class="title_inner">
                            
               <h3><c:out value="bwiter(기업명)"/> </h3>
         </div>
        <h1 class="tit_job" style="margin-left: 5%;">
                        <c:out value="24년 신규 채용 공고 |btitle(제목)"/>    
        </h1>
        <div class="btn_apply" style="margin-left: 60%;">
        <button type="button" id="btnToList" data-oper="list" class="btn  btn-outline btn-info btnToList"><span>목록</span></button>
            <button type="button" id="jobApply" class="btn btn-outline btn-success jobApply">입사지원</button>        
        </div>
    </div>
    </div>
   <%-- 제목 기업 지원 끝--%>

<hr>
<%-- 세부 기본내용 --%>
<div class="cont wrapper" style="padding-left: 300px;">
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
            <%-- 세부 기본내용 끝--%>
            <hr>

<!--해당 글 구직자 이력서 목록 테이블  -->
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
              <tr class="myTr" data-bno='<c:out value="${appList.bno}"/>'>
                  <td><c:out value="${appList.bno }"/></td>
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
<!--해당 글 구직자 이력서 목럭  끝-->




<form id="frmSendValue">
		<input type="hidden" id="pageNum" name="pageNum" value="${myBoardPaging.pageNum }">
		<input type="hidden" id="rowAmountPerPage" name="rowAmountPerPage" value="${myBoardPaging.rowAmountPerPage }">
		<input type="hidden" id="bno" name="bno" value="${myBoard.bno}">
		<input type="hidden" id="boccupation" name="boccupation" value="${myBoardPaging.boccupation}">
		<input type="hidden" id="bregion" name="bregion" value="${myBoardPaging.bregion}">
</form>
 <script>
 
 var frmSendValue = $("#frmSendValue");
 var bno = '<c:out value= "${myBoard.bno}"/>';
 

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

</script>




<%@ include file="./WEB-INF/views/include/footer.jsp" %>