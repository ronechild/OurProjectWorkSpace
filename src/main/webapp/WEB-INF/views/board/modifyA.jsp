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
	.inputdata{
	width: 60%; 
	display: inline-block;
	}
	.titleWrapper{
	padding-left: 25%; 
	padding-right: 20%;
	}
	
</style>
        	<form role="form" method="post" name="frmModifyA" id="frmModifyA" >

<hr>
<%-- 제목 기업 지원 --%>
<div class="titleWrapper">
<div class="wrap_jv_header" >
    <a class="placeholder" tabindex="-1"></a>
    <div class="jv_header" data-rec_idx="48341817" data-rec_seq="0">
	    <div class="title_inner">
                            
               <h3><c:out value="bwiter(기업명)"/>    이력서 수정 </h3> 
         </div>
      
         <h1 class="tit_job" >
			<input class="form-control"  style="width: 75%; height: 70px; font-size: 30pt;" name="atitle" id="atitle" value='<c:out value="${jobSeeker.atitle}"/>'>
        </h1>
       
        
        <div class="btn_apply">
        	 <button type="button" class="btn btn-primary" id="btnModify" data-oper="modify">수정</button>
   			 <button type="button" class="btn btn-danger" id="btnRemove" data-oper="remove">삭제</button>
   			 <button type="button" class="btn btn-warning" id="btnToList" data-oper="toList">목록</button>
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
       </div>
            <%-- 세부 기본내용 끝--%>
            <hr>
<div class="contentBox">

		<div class="form-group">
		
	    	<textarea class="form-control" name="acontent" id="acontent" style="height: 500px;"><c:out value="${jobSeeker.acontent}"/></textarea>
	    	<hr>
	    	
	    </div>
		    
        <div class="panel panel-default">
            <div class="panel-heading"> <h4>증명 서류</h4> </div> <%-- /.panel-heading --%>
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
	               <%--  <security:authentication property="principal.username"/> --%>
		<div class="form-group" style="width: 100px; display: inline-block;">
		
			<input class="form-control" name="awriter" id="awriter"  value="stu1" readonly>
			
		</div>
		
		<div class="btn_apply" style="margin-left: 80%;">
			 <button type="button" class="btn btn-primary" id="btnModify" data-oper="modify">수정</button>
   			 <button type="button" class="btn btn-danger" id="btnRemove" data-oper="remove">삭제</button>
   			 <button type="button" class="btn btn-warning" id="btnToList" data-oper="toList">목록</button>
     </div>
		<security:csrfInput/>
		
</div>


	
		<input type="hidden" id="ano" name="ano" value='<c:out value="${jobSeeker.ano}"/>'>
	</form>

 <script>
 var frmModifyA = $("#frmModifyA");
 <%-- 버튼 클릭--%>
 $("button").on("click", function(){
		
		var operation = $(this).data("oper") ;
		
		var frmModifyA = $("#frmModifyA") ;
		
		if (operation == "toList") {
			
			frmModifyA.empty() ;
			
			frmModifyA.attr("action","${contextPath}/board/homepage" ) ;
			frmModifyA.attr("method", "get") ;
			
		} else if (operation == "modify") {
			
			if (!checkValues()){
		    	return ;
			}
			
			frmModifyA.attr("action", "${contextPath}/board/modifyA");
			alert("수정완료");
			
		} else { 
			
			frmModifyA.attr("action", "${contextPath}/board/remove");
			alert("삭제완료");
		}
		
		frmModifyA.submit() ;
		
	});

 <%--내용확인 함수--%>
 function checkValues() {
 	var atitle = document.getElementById("atitle").value;
 	var acontent = document.getElementById("acontent").value;
 	
 	
 	
 	var regExp = /^\s+$/;
 	
		if(!atitle||!acontent||regExp.test(atitle)||regExp.test(acontent)){
			alert("모든 내용을 입력하세요!");
			return false;
		}else{
			
			//frmModifyA.submit();
			return true;
		}
	}
 <%-- 파일크기및 확장자제한 --%>
 function fileNameTest(afileName, afileSize) {
 	
 	var allowedMaxSize = 104857600;
 	var regExpForbiddenFile = /((^\.[^.]+$|^[^.]+$)|\.(exe|sh|c|dll|alz|zip|tar|7z)$)/i;
 	
 	if(afileSize > allowedMaxSize){
 		alert(afileSize + "업로드 파일의 크기는 100mb보다 작아야합니다");
 		
 		return false;
 	}
 	
 	if(regExpForbiddenFile.test(afileName)){
 		
 		alert(afileName + ": 지원되지않거나 잘못된형식의 파일입니다");
 		
 		return false;
 	}
 	
 	return true;
 	
 }
 

</script>





<%@ include file="../include/footer.jsp" %>