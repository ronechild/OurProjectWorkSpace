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
        <button type="button" id="btnToList" data-oper="list" class="btn  btn-outline btn-info"><span>목록</span></button>
            <button type="button" id="jobApply" class="btn btn-outline btn-success">입사지원</button>        
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
     </div>
        <br>
            </div>
            <%-- 세부 기본내용 끝--%>
            <hr>

<div class="form-group">
	<div class="col-sm-10">
	    <textarea class="form-control bcontentTextBox" name="bcontent" style="resize: none;" 
	               readonly="readonly"><c:out value="글내용|bcontent"/></textarea>
	</div>
</div>

<form id="frmSendValue">
		<input type="hidden" id="pageNum" name="pageNum" value="${myBoardPaging.pageNum }">
		<input type="hidden" id="rowAmountPerPage" name="rowAmountPerPage" value="${myBoardPaging.rowAmountPerPage }">
		<input type="hidden" id="bno" name="bno" value="${myBoard.bno}">
		<input type="hidden" id="boccupation" name="boccupation" value="${myBoardPaging.boccupation}">
		<input type="hidden" id="bregion" name="bregion" value="${myBoardPaging.bregion}">
</form>
 <script>
 var frmSendValue = $("#frmSendValue");
 $("#jobApply").on("click",function(){
	 	frmSendValue.attr("action", "${contextPath}/application");
	 	frmSendValue.attr("method","get");
	 	
	 	frmSendValue.submit();
	 });
 $("#btnToList").on("click",function(){
 	frmSendValue.find("#bno").remove();
 	frmSendValue.attr("action", "${contextPath}");
 	frmSendValue.attr("method","get");
 	
 	frmSendValue.submit();
 });

</script>




<%@ include file="../include/footer.jsp" %>