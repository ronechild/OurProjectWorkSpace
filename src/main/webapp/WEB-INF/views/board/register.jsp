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

<hr>

<%-- 구인글 정보 --%>
<div class="titleWrapper">
	<%-- 제목 --%>
	<div class="wrap_jv_header" >
	    <a class="placeholder" tabindex="-1"></a>
	    <div class="jv_header" data-rec_idx="48341817" data-rec_seq="0">
		    <div class="title_inner">
	               <h3><c:out value="${recruiterVO.bwriter}"/><small> - 구인글 작성</small></h3>
	         </div>
	        <h1 class="tit_job" >
				<input class="form-control"  style="width: 100%; height: 70px; font-size: 30pt;" name="btitle" id="btitle" placeholder="구인글 제목" autofocus>
	        </h1>
	    </div>
    </div>
   <%-- 구인글 정보 끝--%>

<hr>

<%--세부 정보 --%>
	<div class="cont wrapper" >
		<div class="col">   
			<dl >
				<dt>마감일&nbsp;</dt><dd><input type="date" class="form-control inputdata" id="benddate" name="benddate"/></dd>
			</dl>
			<dl>
				<dt>직종&emsp;</dt><dd><input class="form-control inputdata" id="boccupation" name="boccupation"/></dd>
			</dl>           
			<dl >
				<dt>지역&emsp;</dt><dd><input class="form-control inputdata" id="bregion" name="bregion"></dd>
			</dl>
			<dl >
				<dt>모집인원&nbsp;</dt><dd><input type="number" id="bhcnt" class="inputdata"></dd>
			</dl>
		</div>
		<div class="btn_apply" style="margin-left: 80%;">
			<button type="button" id="jobApply" class="btn btn-outline btn-success jobApply">등록</button>
			<button type="button" id="jobCancle" class="btn btn-outline btn-danger jobCancle" >취소</button>
		</div>
	</div><%-- 세부 정보 끝--%>
</div><%-- 구인글 정보 끝 --%>

<hr>

<%-- 구인글 내용 --%>
<div class="contentBox">
	<form role="form" method="post" name="frmRegister" id="frmRegister"  action="${contextPath}/board/register">
		<%-- 내용 --%>
		<div class="form-group">
			<textarea class="form-control" name="bcontent" id="bcontent" style="height: 500px;" placeholder="구인글 내용"></textarea>
		</div><%-- 내용 끝 --%>
		<%-- 첨부파일 --%>
		<div class="panel panel-default">
			<div class="panel-heading"><h4>첨부 파일</h4></div>
			<div class="panel-body">
				<div class="form-group uploadDiv">
					<input type="file" class="btn btn-primary fileInput" name="fileInput" id="fileInput" multiple>
				</div>
				<div class="form-group fileUploadResult">
					<ul>
<%-- 첨부파일 영역 --%>
					</ul>
				</div>
			</div>
		</div><%-- 첨부파일 끝 --%>
<%-- 		<div class="form-group" style="width: 100px; display: inline-block;">
			<input class="form-control" name="bwriter" id="bwriter"  value='<security:authentication property="principal.username"/>' readonly>
		</div> --%>
		
<%-- 		<security:csrfInput/> --%>
	</form>
</div><%-- 구인글 내용 끝 --%>





<form id="frmSendValue">
<%-- 		<input type="hidden" id="pageNum" name="pageNum" value="${myBoardPaging.pageNum }">
		<input type="hidden" id="rowAmountPerPage" name="rowAmountPerPage" value="${myBoardPaging.rowAmountPerPage }"> --%>
		<input type="hidden" id="bno" name="bno" value="${recruiterVO.bno}">
<%-- 		<input type="hidden" id="boccupation" name="boccupation" value="${myBoardPaging.boccupation}">
		<input type="hidden" id="bregion" name="bregion" value="${myBoardPaging.bregion}"> --%>
</form>




 <script>
 var frmSendValue = $("#frmSendValue");
 var frmRegister = $("#frmRegister");
 <%-- 취소버튼 클릭--%>
 $(".jobCancle").on("click",function(){
	 	frmRegister.empty();
	 	frmRegister.attr("action", "${contextPath}/board/homepage");
	 	frmRegister.attr("method","get");
	 	
	 	frmRegister.submit();
	 });
 
 
 
<%--등록버튼 클릭 처리 제이쿼리--%>
 $(".jobApply").on("click",function(){
	 if(!checkValues()){
			return;
		}
	 var attachFileInputHTML="";
	 $("div.fileUploadResult ul li").each(function(i, objLi){
		   var attachLi = $(objLi);
		   
		   
		   attachFileInputHTML
		   +="<input type='hidden' name='attachFileList[" + i + "].uuid' value='" + attachLi.data("uuid") + "'>"
		   +  "<input type='hidden' name='attachFileList[" + i + "].uploadPath' value='" + attachLi.data("uploadpath") + "'>"
		   +  "<input type='hidden' name='attachFileList[" + i + "].fileName' value='" + attachLi.data("filename") + "'>"
		   +  "<input type='hidden' name='attachFileList[" + i + "].fileType' value='" + attachLi.data("filetype") + "'>"
		   
	   });
	 //alert(attachFileInputHTML);
	 
	 
	 
	 if(attachFileInputHTML){
	  	   frmRegister.append(attachFileInputHTML);
	  	   }
	
	 
	 
		 frmRegister.submit();
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
 <%-- 파일크기및 확장자제한 --%>
 function checkUploadFile(fileName, fileSize) {
    
    var allowedMaxSize = 104857600;
    var regExpForbiddenFile = /((^\.[^.]+$|^[^.]+$)|\.(exe|sh|c|dll|alz|zip|tar|7z)$)/i;
    
    if(fileSize > allowedMaxSize){
       alert(fileSize + "업로드 파일의 크기는 100mb보다 작아야합니다");
       
       return false;
    }
    
    if(regExpForbiddenFile.test(fileName)){
       
       alert(fileName + ": 지원되지않거나 잘못된형식의 파일입니다");
       
       return false;
    }
    
    return true;
    
 }
 
 <%-- 업로드 결과 표시 함수 --%>
 function showUploadResult(uploadResult){
    
    var htmlStr = "";
    
    if(uploadResult == null || uploadResult.length == 0) {
    //if(!uploadResult) { //동작 않함
       htmlStr = "<li>첨부파일이 없습니다.</li>" ;
       fileUploadResultUL.html(htmlStr) ;
       return ;
    }
    
    var fullFileName = null ;
    
    <%-- 전달받은 파일들의 정보 각각에 대하여 --%>
    $(uploadResult).each(function(i, attachFile){
       
        fullFileName = encodeURI(attachFile.repoPath + "/" +
                                  attachFile.uploadPath + "/" +
                                  attachFile.uuid + "_" + attachFile.fileName) ;   
    
       if(attachFile.fileType == "F") {
          htmlStr
          +="<li data-uploadpath='" + attachFile.uploadPath + "'" 
          + "    data-uuid='" + attachFile.uuid + "'" 
          + "    data-filename='" + attachFile.fileName + "'" 
          + "    data-filetype='F'>"
          + "        <img src='${contextPath}/resources/icons/icon-attach.png' style='width:50px;'/>"
          + "        &emsp;" + attachFile.fileName
          + "        <span class='glyphicon glyphicon-remove-sign' data-filename='" + fullFileName + "'"
             + "              data-filetype='F' style='color:red;'></span>"
          + "</li>"
       } else {
          var thumbnail = encodeURI(attachFile.repoPath + "/" +
                                    attachFile.uploadPath + "/s_" +
                                    attachFile.uuid + "_" + attachFile.fileName) ;
          htmlStr
          +="<li data-uploadpath='" + attachFile.uploadPath + "'" 
          + "    data-uuid='" + attachFile.uuid + "'" 
          + "    data-filename='" + attachFile.fileName + "'" 
          + "    data-filetype='I'>"
          + "        <img src='${contextPath}/displayThumbnail?thumbnail=" + thumbnail + "' style='width:50px;'/>"
          + "        &emsp;" + attachFile.fileName
             + "        <span class='glyphicon glyphicon-remove-sign ' data-filename='" + thumbnail + "'"
             + "          data-filetype='I' style='color:red;'></span>"
          + "</li>"
       }
       
    });
    

    //fileUploadResultUL.html(htmlStr) ;
    fileUploadResultUL.append(htmlStr) ;
    
    
    

 }
    

 $("#fileInput").on("change", function(){
    
    var fileInput = $("input[name='fileInput']") ;
     //var fileInputs = $(this) ;

     var uploadFiles = fileInput[0].files ;//반드시 [0]을 붙여야 함
     console.log(uploadFiles) ;
     

     <%-- Ajax를 이용한 파일 업로드는, 웹 브라우저의 FormData() 내장 생성자를 이용하여 전송 --%>
     var formData = new FormData() ;
     
     for(var i = 0 ; i < uploadFiles.length ; i++) {
        
        if(!checkUploadFile(uploadFiles[i].name, uploadFiles[i].size)){
           console.log("파일이름: " + uploadFiles[i].name) ;
           console.log("파일크기: " + uploadFiles[i].size) ;
           $("#fileInput").val("") ;
           return ;   
        }
        formData.append("uploadFiles", uploadFiles[i]) ;
        
     }
     
     $.ajax({
        type: "post" ,
        url : "${contextPath}/doFileUpload" ,
        data: formData ,
        contentType: false ,  //contentType에 전송타입(즉, MIME 타입)을 지정하지 않음.
        processData: false ,  //contentType에 설정된 형식으로 data를 변환처리가 수행되지 않음
        dataType: "json" ,
        success: function(uploadResult, status){
           console.log(uploadResult)  ;
           //$(".uploadDiv").html(cloneFileInput.html()) ;
           $("#fileInput").val("") ;
           showUploadResult(uploadResult) ;
        }
     });

 }) ;


 <%-- 파일 삭제: 서버에 업로드된 파일이 삭제되고, 이를 화면에 반영해 주어야 함 --%>
 <%-- 이벤트 위임(Event Delegation) 적용 div.fileUploadResult > ul > li:nth-child(1) > span --%>
 $(".fileUploadResult ul").on("click", "li span" , function(){
     var fileName = $(this).data("filename") ;
     
     
     var fileLi = $(this).parent() ;
     //var fileLi = $(this).closest("li") ;
     
     //post 가 아닌 다른 type의 전송방식(예, delete)를 사용하려면
     //프로젝트의 web.xml 파일에 org.springframework.web.filter.FormContentFilter 필터를 설정해야 함
     $.ajax({
         type: "post" ,  
         url: "${contextPath}/deleteFile" ,
         data: {fileName: fileName} ,
        //data: JSON.stringify({fileName: fileName, fileType: fileType}) ,
        // contentType: "application/json; charset=utf-8" ,
         dataType: "text" ,
         success: function(result) {
            if(result == "DelSuccess") {
               alert("파일이 삭제되었습니다.") ;
               fileLi.remove() ;
            } else {
               if(confirm("파일이 존재하지 않습니다. 해당 항목을 삭제하시겠습니까?")) {
                  fileLi.remove() ;
               }
            }
         } ,
         error: function(xhr, status, e) {
            
               alert("서버 장애") ;
               console.log(e) ;
           
               if(confirm("파일이 존재하지 않습니다. 해당 항목을 삭제하시겠습니까?")) {
                  fileLi.remove() ;
               }
            
         } 
         
     });
 }) ;
 

</script>





<%@ include file="../include/footer.jsp" %>