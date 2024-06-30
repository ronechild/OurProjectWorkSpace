<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>



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
    .contentBox{
   margin-left: 10%;
   margin-right: 10%;
   }
   
</style>

<hr>
<%-- 제목 기업 지원 --%>
<div class="wrap_jv_header" style="padding-left: 300px;">
    <a class="placeholder" tabindex="-1"></a>
    <div class="jv_header" data-rec_idx="48341817" data-rec_seq="0">
       <div class="title_inner">
                           
               <h3><c:out value="awiter(구직자명)" /></h3>
         </div>
        <h1 class="tit_job" style="margin-left: 5%;">
                        <c:out value="24년 신규 채용 공고 |btitle(제목)"/>    
        </h1>
        <div class="btn_apply" style="margin-left: 60%;">
        <button type="button" id="btnToList" data-oper="list" class="btn  btn-outline btn-info btnToList"><span>홈</span></button>
            <button type="button" id="jobApply" class="btn btn-outline btn-success jobApply">뭘 넣어야 할까</button>        
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
             <div class="alert alert-danger" style="height: 50px; width: 90px;">D-day - <c:out value="3"/></div>
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
<div class="contentBox">
 <table class="table table-striped table-bordered table-hover"  id="dataTables-example"
              style="width:100%;text-align:center;">
      <thead>
          <tr>
              <th>번호</th>
              <th>작성자</th>
              <th>제목</th>          
              <th>신청글 내용</th>
              <th>지원일</th>
          </tr>
      </thead>
      <tbody>
         <c:choose>
        <c:when test="${not empty jsList }">
           <c:forEach var="appList" items="${jsList }"  >
              <tr class="myTr" data-ano='<c:out value="${appList.ano}"/>'>
                  <td><c:out value="${appList.ano }"/></td>
                  <td><c:out value="${appList.awriter }"/></td>
                  <td><c:out value="${appList.atitle }"/><!-- </a> --></td>             
                  <td><c:out value="${appList.acontent }"/></td>
               <td><fmt:formatDate pattern="yyyy/MM/dd " value="${appList.aregDate }" /></td>
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
<!--해당 글 구직자 이력서 목럭  끝-->




<form id="frmSendValue">
      <input type="hidden" id="ano" name="ano" value="${jobSeeker.ano }">
      <input type="hidden" id="awriter" name="awriter" value="${jobSeeker.awriter }">
      
</form>
 <script>
 
 var frmSendValue = $("#frmSendValue");
 //var ano = '<c:out value= "${jobSeeker.ano}"/>';
 
 <%-- 리스트에 있는 글 눌렀을 때상세 페이지로 이동--%>


     $(".myTr").on("click", function(){
       var ano = $(this).data("ano") ;  
//       alert(ano) ;
       
      location.href = "${contextPath}/board/resume?ano="+ ano  ;
      
       /* frmSendValue.append('<input type="hidden" id="ano" name="ano" value=" '+ ano +'  ">') ;
       
       frmSendValue.attr("action", "${contextPath}/board/resume");
        frmSendValue.attr("method","get");
       
        frmSendValue.submit();    */
     })
 
 <%--  홈화면으로--%>
 $(".btnToList").on("click",function(){
    
       frmSendValue.find("#bno").remove();
       frmSendValue.attr("action", "${contextPath}/board/homepage");
       frmSendValue.attr("method","get");
       
       frmSendValue.submit();
 });
 
 
</script>


<%@ include file="../include/footer.jsp" %>