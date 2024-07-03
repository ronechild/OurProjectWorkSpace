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
   .attachFile{
   margin-left: 10%;
   margin-right: 10%;
   margin-bottom: 10%;
   }
   
   .contentBox {
   margin-left: 10%;
   margin-right: 10%;
   }
   .btn_apply{
   margin-left: 60%; 
   display: inline-block;
   }
   .titleWrapper{
   padding-left: 25%; 
   padding-right: 20%;
   }
   
</style>

<hr>

<div class="titleWrapper">
<%-- 제목 기업 지원 --%>
<div class="wrap_jv_header" >
    <a class="placeholder" tabindex="-1"></a>
    <div class="jv_header" data-rec_idx="48341817" data-rec_seq="0">
       <div class="title_inner">
                            
               <h3><c:out value="${recruit.bwriter}"/> </h3>
         </div>
        <h1 class="tit_job" style="margin-left: 5%;">
                        <c:out value="이력서 상세 페이지"/>    
        </h1>
        <div class="btn_apply" style="margin:0%;float:right;">
            <button type="button" id="btnTodetail" class="btn btn-outline btn-primary btnTodetail" >구인글로 돌아가기</button>   
            <button type="button" id="btnToModifyA" class="btn btn-outline btn-danger btnToModifyA" >수정</button>
            <button type="button" id="btnResumelist" class="btn btn-outline btn-success btnResumelist" >나의 모든 구직글</button> 
            <button type="button" id="btnHome" class="btn btn-outline btn-warning btnHome" >홈</button>   
                
                
        </div>
    </div>
    </div>
   <%-- 제목 기업 지원 끝--%>

<hr>
<%-- 세부 기본내용 --%>
<div class="cont wrapper">
   <div class="col">
   
   
      <dl>
          <dt>글 번호&nbsp;</dt><dd><c:out value="${jobSeeker.ano}"/></dd>
      </dl> 
      
      <dl>
          <dt>작성자&nbsp;</dt><dd><c:out value="${jobSeeker.awriter}"/></dd>
      </dl> 
      
      
      <dl>
          <dt>등록일&nbsp;</dt><dd><c:out value="${jobSeeker.aregDate}"/></dd>
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
</div>
<div class= "contentBox">
<div class="form-group">
        <label class="control-label" style="white-space: nowrap;">글내용</label>
        <textarea class="form-control bcontentResume" rows="3" name="bcontent"
                  readonly="readonly" style="height: 400px;"
                  ><c:out value="${jobSeeker.acontent}"/></textarea>
 </div>
 
 <div class="form-group">
        <label class="control-label" style="white-space: nowrap;">작성자</label>
        <input class="form-control writer" name="bwriter"
               value='<c:out value="${jobSeeker.awriter}"/>' readonly="readonly"/>
</div>

<div class="form-group">
        <label class="control-label" style="white-space: nowrap;">구인글번호</label>
        <input class="form-control" name="bwriter"
               value='<c:out value="${jobSeeker.bno}"/>' readonly="readonly"/>
</div>
</div>



<%-- <div class="contentBox">
   <form role="form" method="post" name="frmApplication" id="frmApplication" action="${contextPath }/board/application?" >
   
      <div class="form-group">
      
         <div class="form-group" style="width: 100px; display: inline-block;">
            <input class="form-control" name="bwriter" id="bwriter"  value='<security:authentication property="principal.username"/>' readonly>
         </div>
         
         <input class="form-control" name="btitle" id="btitle" value='<c:out value="${btitle }"/>' readonly="readonly">
                                    
      </div>
      <div class="form-group">
          <textarea class="form-control" name="bcontent" id="bcontent" style="height: 500px;" readonly="readonly"><c:out value="${bcontent }"/>' </textarea>
       </div>
      
      <div class="panel panel-default">
            <div class="panel-heading"> <h4>파일 첨부</h4> </div> /.panel-heading
            <div class="panel-body">
      
      <div class="btn_apply pull-right">
         <button type="button" id="backpage" class="btn btn-outline btn-warning" >목록</button>        
        </div>
        
      </div><!-- /.panel-body -->
 </div> <!-- /.panel -->        
      <security:csrfInput/>
   </form>   
</div>      --%> <!-- contentBox - end -->

<form id="frmSendValue">
      <%-- <input type="hidden" id="ano" name="ano" value="${jsList.ano }">
      <input type="hidden" id="atitle" name="atitle" value="${jsList.atitle }">
      <input type="hidden" id="acontent" name="acontent" value="${jsList.acontent }">
      <input type="hidden" id="awriter" name="awriter" value="${jsList.awriter }">
      <input type="hidden" id="aregDate" name="aregDate" value="${jsList.aregDate }">
      <input type="hidden" id="bno" name="bno" value="${jsList.bno }">
 --%>
</form>
<div class="attachFile">
<%-- 첨부파일 표시 --%>    
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                   <strong style="font-size:16px;">첨부 파일</strong><%--수정--%>
                </div><!-- /.panel-heading -->
                <div class="panel-body">
                   <div class="form-group fileUploadResult"><%--첨부파일 목록 표시 div--%>
                       <ul>
                    
<c:choose>                 
<c:when test="${empty jobSeeker.jobSeekerAttachFileList }">
    <li style="font-size: 12pt;">첨부파일이 없습니다</li>
</c:when>
<c:otherwise>
    <c:forEach var="jsAttachFileList" items="${jobSeeker.jobSeekerAttachFileList }">
            <li class="attachLi"
                data-repopath = "${jsAttachFileList.repoPath }"
                data-uploadpath = "${jsAttachFileList.uploadPath }"
                data-uuid = "${jsAttachFileList.uuid }"
                data-filename = "${jsAttachFileList.fileName }">
                    <img src='${contextPath}/resources/icons/icon-attach.png' style='width:25px;'>
                    &emsp;${jsAttachFileList.fileName}
            </li>
    </c:forEach>
</c:otherwise>
</c:choose>
                       </ul>
                   </div>
                </div><!-- /.panel-body -->
            </div><!-- /.panel -->
        </div><!-- /.col-lg-12 -->
    </div><!-- /.row -->
</div>


<!-- dd ----------------------------------------------------->
 <script>
 var frmSendValue = $("#frmSendValue");
 var frmApplication = $("#frmApplication");
 
 
 <%-- 목록 버튼 클릭--%>
 $("#btnResumelist").on("click",function(){
    
       var awriter = '<c:out value="${jobSeeker.awriter}"/>' ;
       
       alert("  awriter가 작성한 이력서들") ;
       
       location.href="${contextPath}/board/resumelist?awriter=" + awriter  ;
    });

 <%-- 구직글 버튼 클릭--%>
 $(".btnTodetail").on("click",function(){
    
    var bno = '<c:out value="${jobSeeker.bno}"/>' ;
       location.href = "${contextPath}/board/detail?bno=" + bno  ;
     });
 
 
 <%-- 홈 버튼 클릭--%>
 $(".btnHome").on("click",function(){
    
       frmSendValue.find("#bno").remove();
       frmSendValue.attr("action", "${contextPath}/board/homepage");
       frmSendValue.attr("method","get");
       
       frmSendValue.submit();
     });
 
 <%-- 수정 버튼 클릭--%>
 $(".btnToModifyA").on("click",function(){
	 var bno = '<c:out value= "${recruit.bno}"/>';
    var ano = '<c:out value="${jobSeeker.ano}"/>' ;
       location.href = "${contextPath}/board/modifyA?ano=" + ano + "&bno=" + bno  ;
     });
  
</script>

<%@ include file="../include/footer.jsp" %>