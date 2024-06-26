<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<%@ include file="../include/header.jsp" %>
<style>
	
</style>

<hr>
<%-- 제목 기업 지원 --%>
<div class="wrap_jv_header" style="padding-left: 300px;">
    <a class="placeholder" tabindex="-1"></a>
    <div class="jv_header" data-rec_idx="48341817" data-rec_seq="0">
	    <div class="title_inner">
                            
               <h3><c:out value="bwiter(기업명)"/> </h3>
         </div>
        <h1 class="tit_job" >
			<input class="form-control"  style="width: 75%; height: 70px; font-size: 30pt;" name="btitle" id="btitle" placeholder="글제목을 입력하십시오">
        </h1>
        <h4 style="display: inline-block;">구인 게시글 작성</h4>
        <div class="btn_apply">
        	<button type="button" id="jobApply" class="btn btn-outline btn-success jobApply">등록</button>      
            <button type="button" id="jobCancle" class="btn btn-outline btn-danger jobCancle" >지원 취소</button>        
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
		    <dt style="margin-top: 7px">마감일&nbsp;</dt><dd><input type="date" class="form-control inputdata" id="benddate" name="benddate"
                        	 value= '<c:out value="${pagingCreator.myBoardPaging.benddate }"/>'></dd>
		</dl>
     </div>
     <div class="col">
 		<dl>
		    <dt>직종&emsp;</dt><dd><c:out value="직종|boccupation"/></dd>
		</dl>           
		<dl >
		    <dt>지역&emsp;</dt><dd><c:out value="지역|bregion"/></dd>
		</dl>
		<dl >
		    <dt>모집인원&nbsp;</dt><dd><input type="number" id="bhcnt" class="inputdata" ></dd>
		</dl>
     </div>
        <br>
            </div>
            <%-- 세부 기본내용 끝--%>
            <hr>

<div class="contentBox">
	<form role="form" method="post" name="frmRegister" id="frmRegister" action="${contextPath }/board/application?" >
		<div class="form-group">
	    	<textarea class="form-control" name="bcontent" id="bcontent" style="height: 500px;" placeholder="글내용을 입력하십시오"></textarea>
	    </div>
		    
        <div class="panel panel-default">
            <div class="panel-heading"> <h4>파일 첨부</h4> </div> <%-- /.panel-heading --%>
            <div class="panel-body">
            
                    <div class="form-group uploadDiv">
                       	<input type="file" class="btn btn-primary fileInput" name="fileInput" id="fileInput" multiple>
                       	
                    </div>	
                    <div class="form-group fileUploadResult">
                    	<ul>
                    		<%-- 업로드후  --%>
                    	</ul>
                    </div>	
                
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
	                
		<div class="form-group" style="width: 100px; display: inline-block;">
			<input class="form-control" name="bwriter" id="bwriter"  value='<security:authentication property="principal.username"/>' readonly>
		</div>
		<div class="btn_apply" style="margin-left: 80%;">
			<button type="button" id="jobApply" class="btn btn-outline btn-success jobApply">등록</button>      
	       	<button type="button" id="jobCancle" class="btn btn-outline btn-danger jobCancle" >취소</button>    
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

</script>





<%@ include file="../include/footer.jsp" %>