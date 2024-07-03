<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

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
        	<form role="form" method="post" name="frmRegister" id="frmRegister" action="${contextPath }/board/registerA" >

<hr>
<%-- 제목 기업 지원 --%>
<%-- 구직글 정보 --%>
<div class="titleWrapper" style="padding-left:20%; padding-right:20%; margin:0px">
<div class="wrap_jv_header" >
    <a class="placeholder" tabindex="-1"></a>
    <div class="jv_header" data-rec_idx="48341817" data-rec_seq="0">
	    <div class="title_inner">
                            
               <h3>${recruit.bwriter }    이력서 작성 </h3> 
         </div>
      
         <h1 class="tit_job" >
			<input class="form-control"  style="width: 75%; height: 70px; font-size: 30pt;" name="atitle" id="atitle"
			 placeholder="이력서 제목을 입력하세요" autofocus>
        </h1>
       
        
        <div class="btn_apply">
        	<button type="button" id="jobApply" class="btn btn-outline btn-success jobApply">등록</button>      
            <button type="button" id="jobCancle" class="btn btn-outline btn-danger jobCancle" >지원 취소</button>        
        </div>
       
    </div>
    </div>
   <%-- 제목 기업 지원 끝--%>

<hr>
<%-- 세부 기본내용 --%>
<div class="cont wrapper" >
	<div class="col">
		<dl>
		    <dt>등록일&nbsp;</dt><dd><c:out value="${recruit.bregDate}"/></dd>
		</dl>           
		<dl >
		    <dt style="margin-top: 7px">마감일&nbsp;</dt><dd><c:out value="${recruit.bendDate }"/></dd>
		</dl>
     </div>
     <div class="col">
 		<dl>
		    <%-- <dt>직종&emsp;</dt><dd><c:out value="직종|boccupation"/></dd> --%>
		     <dt>직종&emsp;</dt><dd><c:out value="${recruit.boccupation }"/></dd>
		</dl>           
		<dl >
		    <dt>지역&emsp;</dt><dd><c:out value="${recruit.bregion }"/></dd>
		</dl>
		<dl >
		    <dt>모집인원&nbsp;</dt><dd><c:out value="${recruit.bhcnt }"/></dd>
		</dl>
		<dl>
		<dt>글번호</dt><dd><c:out value="${recruit.bno }"/></dd>
		</dl>
     </div>
        <br>
            </div>
       </div>
            <%-- 세부 기본내용 끝--%>
            <hr>
<%-- 구직글 내용 --%>
<div class="contentBox" style="padding-left:20%; padding-right:20%; margin:0px">

		<div class="form-group">
		<input type="hidden" id="bno" name="bno" value="${recruit.bno }">
	    	<textarea class="form-control" name="acontent" id="acontent" style="height: 500px;"
	    	 placeholder="1. 자기소개 &#10;&#10;2. 지원 동기 &#10;&#10;3. 경력사항 &#10;&#10; 각각의 항목을 500자 내로 작성해주세요"></textarea>
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
<c:choose>
<c:when test="${empty jobSeeker.jobSeekerAttachFileList }">
</c:when>
<c:otherwise>
    <c:forEach var="attachFile" items="${jobSeeker.jobSeekerAttachFileList }">
        <c:choose>
        <c:when test="${attachFile.fileType == 'F' }">
            <li class="attachLi"
                data-repopath = "${attachFile.repoPath }"
                data-uploadpath = "${attachFile.uploadPath }"
                data-uuid = "${attachFile.uuid }"
                data-filename = "${attachFile.fileName }"
                data-filetype = "F" >
                    <img src='${contextPath}/resources/icons/icon-attach2.png' style='width:25px;'>
                    &emsp;${attachFile.fileName}
            </li>
        </c:when>
        <c:otherwise>
            <c:set var="thumbnail" value="${attachFile.repoPath}/${attachFile.uploadPath}/s_${attachFile.uuid}_${attachFile.fileName}"/>
            <li class="attachLi"
                data-repopath = "${attachFile.repoPath }"
                data-uploadpath = "${attachFile.uploadPath }"
                data-uuid = "${attachFile.uuid }"
                data-filename = "${attachFile.fileName }"
                data-filetype = "I" >
                    <img src="${contextPath}/displayThumbnail?fileName=${thumbnail}" >
                    &nbsp;&nbsp;${attachFile.fileName}
            </li>
            <c:remove var="thumbnail"/>
        </c:otherwise>
        </c:choose>
    </c:forEach>
</c:otherwise>
</c:choose>

                    	</ul>
                    	  </div>
            <div class="btn_apply" style="margin-left: 80%;">
			<button type="button" id="jobApply" class="btn btn-outline btn-success jobApply">등록</button>      
	       	<button type="button" id="jobCancle" class="btn btn-outline btn-danger jobCancle" >지원 취소</button>    
	       	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
        </div>
                    </div>	
                
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
	               <%--  <security:authentication property="principal.username"/> --%>
		<div class="form-group" style="width: 100px; display: inline-block;">
		<!-- awriter -->
			<input class="form-control" name="awriter" id="awriter"  value="${principal.username }" readonly>
			
		</div>
		
	
		<sec:csrfInput />
	</form>




 <script>
 var csrfHeaderName = "${_csrf.headerName}"; 
 var csrfTokenValue = "${_csrf.token}";

 
 var frmRegister = $("#frmRegister");
 var fileUploadResultUL = $(".fileUploadResult ul") ;
 <%-- 취소버튼 클릭--%>
 $(".jobCancle").on("click",function(){
	 	frmRegister.empty();
	 	frmRegister.append('<input type="hidden" id="bno" name="bno" value="' + '${recruit.bno}' + '">');
	 	frmRegister.attr("action", "${contextPath}/board/detail");
	 	frmRegister.attr("method","get");
	 	
	 	frmRegister.submit();
	 });
<%--등록버튼 클릭 처리 제이쿼리--%>
 $(".jobApply").on("click",function(){
	 //alert("되긴함?") ;
	 if(!checkValues()){
			return;
		}
	 var attachFileInputHTML="";
	 $(".fileUploadResult ul li").each(function(i, objLi){
		   var attachLi = $(objLi);
		   
		   
		   attachFileInputHTML
		   +="<input type='hidden' name='jobSeekerAttachFileList[" + i + "].uuid' value='" + attachLi.data("uuid") + "'>"
		   +  "<input type='hidden' name='jobSeekerAttachFileList[" + i + "].uploadPath' value='" + attachLi.data("uploadpath") + "'>"
		   +  "<input type='hidden' name='jobSeekerAttachFileList[" + i + "].fileName' value='" + attachLi.data("filename") + "'>"
		   +  "<input type='hidden' name='jobSeekerAttachFileList[" + i + "].fileType' value='" + attachLi.data("filetype") + "'>" ;

		   /* +  "<input type='hidden' name='jobSeekerAttachFileList[" + i + "].ano' value='" + attachLi.data("") + "'>" */
		   
	   });
	 //alert(attachFileInputHTML);
	 if(attachFileInputHTML){
  	   frmRegister.append(attachFileInputHTML);
  	   }
	 frmRegister.submit();
});
 <%--내용확인 함수--%>
 function checkValues() {
 	var atitle = document.getElementById("atitle").value;
 	var acontent = document.getElementById("acontent").value;
 	
 	
 	
 	var regExp = /^\s+$/;
 	
		if(!atitle||!acontent||regExp.test(atitle)||regExp.test(acontent)){
			alert("모든 내용을입력하세요"+atitle+acontent);
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
           + "        <img src='${contextPath}/resources/icons/icon-attach.png' style='width:30px;'/>"
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

     var uploadFiles = fileInput[0].files ;
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
     	contentType: false ,
     	processData: false ,  
     	beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
        },
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
     var fileType = $(this).data("filetype") ;
     var fileLi = $(this).parent() ;
     //var fileLi = $(this).closest("li") ;
     
     //post 가 아닌 다른 type의 전송방식(예, delete)를 사용하려면
     //프로젝트의 web.xml 파일에 org.springframework.web.filter.FormContentFilter 필터를 설정해야 함
     $.ajax({
         type: "post" ,  
         url: "${contextPath}/deleteFile" ,
         data: {fileName: fileName, fileType: fileType} ,
        //data: JSON.stringify({fileName: fileName, fileType: fileType}) ,
        // contentType: "application/json; charset=utf-8" ,
         dataType: "text" ,
         beforeSend: function(xhr){
	         xhr.setRequestHeader(csrfHeaderName, csrfTokenValue) ;
		} ,
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