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
	.contentBox{
	margin-left: 100px;
	margin-right: 100px;
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
                            
               <h3><c:out value="bwiter(기업명)"/> </h3>
         </div>
        <h1 class="tit_job" style="margin-left: 5%;">
                        <c:out value="24년 신규 채용 공고 |btitle(제목)"/>    
        </h1>
        <h4 style="display: inline-block;">이력서 상세 열람</h4>
        <div class="btn_apply">
            <button type="button" id="backpage" class="btn btn-outline btn-warning" >목록</button>        
        </div>
    </div>
    </div>
   <%-- 제목 기업 지원 끝--%>

<hr>
<%-- 세부 기본내용 --%>
<div class="cont wrapper">
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
</div>

<div class="contentBox">
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
		
		<div class="btn_apply pull-right">
			<button type="button" id="backpage" class="btn btn-outline btn-warning" >목록</button>        
        </div>
		<security:csrfInput/>
	</form>	
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
 var frmApplication = $("#frmApplication");
 <%-- 목록 버튼 클릭--%>
 $(".jobCancle").on("click",function(){
	 	frmApplication.empty();
	 	frmSendValue.attr("action", "${contextPath}/detail");
	 	frmSendValue.attr("method","get");
	 	
	 	frmSendValue.submit();
	 });
 

</script>





<%@ include file="../include/footer.jsp" %>