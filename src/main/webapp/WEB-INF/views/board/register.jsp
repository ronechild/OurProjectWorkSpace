<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%@include file="../include/header.jsp"%>

<style>
	.alert, dl{display:inline-block; width:200px; margin-left:50px;}
	dd{color:#28288C;}
	dt{float:left; height:34px;}
	.bcontentTextBox{margin-left:100px; background-color:white;}
	.contentBox{margin-left:100px; margin-right:100px;}
	.btn_apply{margin-left:60%; display:inline-block;}
	.inputdata{width:60%; display:inline-block;}
	.titleWrapper{padding-left:25%; padding-right:20%;}
</style>

<form role="form" id="frmRegister" name="frmRegister" method="post" action="${contextPath}/board/register">

<hr>

<%-- 구인글 정보 --%>
<div class="titleWrapper" style="padding-left:20%; padding-right:20%; margin:0px">
	<%-- 제목 --%>
	<div class="wrap_jv_header" >
	    <a class="placeholder" tabindex="-1"></a>
	    <div class="jv_header" data-rec_idx="48341817" data-rec_seq="0">
		    <div class="title_inner">
	               <h3><c:out value="${principal.username}"/><small> - 구인글 작성</small></h3><%-- * --%>
	         </div>
	        <h1 class="tit_job" >
				<input class="form-control" style="width:100%; height:70px; font-size:30pt;" id="btitle" name="btitle" placeholder="구인글 제목" autofocus>
	        </h1>
	    </div>
    </div><%-- 제목 끝 --%>

	<hr>

	<%--세부 정보 --%>
	<div class="cont wrapper">
		<div class="col">   
			<dl>
				<dt>마감일 : &nbsp;</dt><dd><input type="date" class="form-control inputdata" id="bendDate" name="bendDate"/></dd>
			</dl>
			<dl>
				<dt>직종 : &emsp;</dt><dd><input class="form-control inputdata" id="boccupation" name="boccupation"/></dd>
			</dl>           
			<dl>
				<dt>지역 : &emsp;</dt><dd><input class="form-control inputdata" id="bregion" name="bregion"></dd>
			</dl>
			<dl>
				<dt>모집인원 : &nbsp;</dt><dd><input type="number" class="form-control inputdata" id="bhcnt" name="bhcnt"></dd>
			</dl>
		</div>
		<div class="btn_apply" style="float:right;">
			<button type="button" id="registerRecruit" class="btn btn-outline btn-success registerRecruit">등록</button>
			<button type="button" id="registerCancle" class="btn btn-outline btn-danger registerCancle">취소</button>
		</div>
	</div><%-- 세부 정보 끝--%>
</div><%-- 구인글 정보 끝 --%>

<hr>

<%-- 구인글 내용 --%>
<div class="contentBox" style="padding-left:20%; padding-right:20%; margin:0px">
	<%-- 내용 --%>
	<div class="form-group">
		<textarea class="form-control" style="height:500px;" id="bcontent" name="bcontent" placeholder="구인글 내용"></textarea>
	</div><%-- 내용 끝 --%>
	<%-- 첨부 파일 --%>
	<div class="panel panel-default">
		<div class="panel-heading"><h4>첨부 파일</h4></div>
		<div class="panel-body">
			<div class="form-group uploadDiv">
				<input type="file" class="btn btn-primary fileInput" id="fileInput" name="fileInput" multiple>
			</div>
			<div class="form-group fileUploadResult">
				<ul>
<%-- 첨부 파일 영역 --%>
				</ul>
			</div>
		</div>
	</div><%-- 첨부 파일 끝 --%>

</div><%-- 구인글 내용 끝 --%>

<input class="form-control inputdata" type="hidden" id="bno" name="bno">
<input class="form-control inputdata" type="hidden" id="bwriter" name="bwriter" value="${principal.username}">
<input class="form-control inputdata" type="hidden" id="breplyCnt" name="breplyCnt">
<input class="form-control inputdata" type="hidden" id="bappCnt" name="bappCnt">
<input class="form-control inputdata" type="hidden" id="bblind" name="bblind">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

</form>

<script>
	
	<%-- csrf 토큰 처리 --%>
	var _csrfHeaderName = "${_csrf.headerName}";
	var _csrfTokenValue = "${_csrf.token}";
	
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(_csrfHeaderName, _csrfTokenValue);
	})
	
	
	var frmRegister = $("#frmRegister");
	var fileUploadResultUL = $(".fileUploadResult ul");
	
	<%-- 취소 버튼 클릭 --%>
	$(".registerCancle").on("click", function() {
		frmRegister.empty();
		frmRegister.attr("action", "${contextPath}/board/homepage");
		frmRegister.attr("method", "get");
		
		frmRegister.submit();
	})
	
	<%-- 등록 버튼 클릭 --%>
	$(".registerRecruit").on("click", function() {
		if(!checkValues()) {
			return;
		}
		
		var attachFileInputHTML = "";
		
		$(".fileUploadResult ul li").each(function(i, objLi) {
			var attachLi = $(objLi);
			
			attachFileInputHTML += 
			"<input type='hidden' name='attachFileList[" + i + "].bUuid' value='" + attachLi.data("uuid") + "'>" + 
			"<input type='hidden' name='attachFileList[" + i + "].bFileName' value='" + attachLi.data("filename") + "'>" + 
			"<input type='hidden' name='attachFileList[" + i + "].bUploadPath' value='" + attachLi.data("uploadpath") + "'>"/*  + 
			"<input type='hidden' name='attachFileList[" + i + "].bno' value='" + "${recruiterVO.bno}" + "'>" *//*  + 
			"<input type='hidden' name='attachFileList[" + i + "].bDelFlag'>" *//*  + 
			"<input type='hidden' name='attachFileList[" + i + "].fileType' value='" + attachLi.data("filetype") + "'>" */;
		})
		
		if(attachFileInputHTML) {
			frmRegister.append(attachFileInputHTML);
		}
		
		console.log(attachFileInputHTML);
		
		frmRegister.submit();
	})
	
	<%-- 내용 확인 --%>
	function checkValues() {
		var btitle = document.getElementById("btitle").value;
		var bcontent = document.getElementById("bcontent").value;
		var benddate = document.getElementById("bendDate").value;
		var boccupation = document.getElementById("boccupation").value;
		var bregion = document.getElementById("bregion").value;
		var bhcnt = document.getElementById("bhcnt").value;
		var regExp = /^\s+$/;
		
/* 		if(!btitle||!bcontent||!bendDate||!boccupation||!bregion||!bhcnt||regExp.test(btitle)||regExp.test(bcontent)||regExp.test(bendDate)||regExp.test(boccupation)||regExp.test(bregion)||regExp.test(bhcnt)) { */
		if(!btitle||!bcontent||regExp.test(btitle)||regExp.test(bcontent)){
			window.alert("모든 내용을입력하세요");
			return false;
			
		} else {
			return true;
		}
	}
	
	<%-- 파일 크기 및 확장자 제한 --%>
	function checkUploadFile(fileName, fileSize) {
		var allowedMaxSize = 104857600;
		var regExpForbiddenFile = /((^\.[^.]+$|^[^.]+$)|\.(exe|sh|c|dll|alz|zip|tar|7z)$)/i;
		var fileSizeMB = fileSize / (1024 * 1024);
		
		if(allowedMaxSize < fileSize) {
			window.alert("업로드 파일의 크기는 100MB보다 작아야합니다; 선택한 파일의 크기 : " + fileSize);
			return false;
		}
		
		if(regExpForbiddenFile.test(fileName)){
			window.alert("지원되지 않거나 잘못된 형식의 파일입니다.");
			return false;
		}
		
		return true;
	}
	
	<%-- 업로드 결과 표시 --%>
	function showUploadResult(uploadResult) {
		var htmlStr = "";
		
		if(uploadResult == null || uploadResult.length == 0) {
			htmlStr = "<li>첨부파일이 없습니다.</li>";
			fileUploadResultUL.html(htmlStr);
			return;
		}
		
		var fullFileName = null;
		
		<%-- 아이콘/썸네일 생성 --%>
		$(uploadResult).each(function(i, attachFile) {
			fullFileName = encodeURI(attachFile.repoPath + "/" + attachFile.uploadPath + "/" + attachFile.uuid + "_" + attachFile.fileName);
			
			if(attachFile.fileType == "F") {
				htmlStr += 
				"<li " + 
				"		data-uploadpath='" + attachFile.uploadPath + "'" + 
				"		data-uuid='" + attachFile.uuid + "'" + 
				"		data-filename='" + attachFile.fileName + "'" + 
				"		data-filetype='F'>" + 
				"	<img src='${contextPath}/resources/icons/icon-attach.png' style='width:50px;'/> &emsp;" + attachFile.fileName + 
				"	<span class='glyphicon glyphicon-remove-sign' data-filename='" + fullFileName + "' data-filetype='F' style='color:red;'></span>" + 
				"</li>"
				
			} else {
				var thumbnail = encodeURI(attachFile.repoPath + "/" + attachFile.uploadPath + "/s_" + attachFile.uuid + "_" + attachFile.fileName);
				
				htmlStr += 
				"<li " + 
				"		data-uploadpath='" + attachFile.uploadPath + "'" + 
				"		data-uuid='" + attachFile.uuid + "'" + 
				"		data-filename='" + attachFile.fileName + "'" + 
				"		data-filetype='I'>" + 
				"	<img src='${contextPath}/displayThumbnail?thumbnail=" + thumbnail + "' style='width:50px;'/> &emsp;" + attachFile.fileName + 
				"	<span class='glyphicon glyphicon-remove-sign' data-filename='" + thumbnail + "' data-filetype='I' style='color:red;'></span>" + 
				"</li>"
			}
		})
		
		fileUploadResultUL.append(htmlStr);
	}
	
	$("#fileInput").on("change", function() {
		var fileInput = $("input[name='fileInput']");
		var uploadFiles = fileInput[0].files;
		console.log(uploadFiles) ;
		
		var formData = new FormData();
		
		for(var i = 0; i < uploadFiles.length; i++) {
			if(!checkUploadFile(uploadFiles[i].name, uploadFiles[i].size)) {
				console.log("파일이름 : " + uploadFiles[i].name);
				console.log("파일크기 : " + uploadFiles[i].size);
				$("#fileInput").val("");
				return;   
			}
			
			formData.append("uploadFiles", uploadFiles[i]);
		}
		
		$.ajax({
			type : "post", 
			url : "${contextPath}/doFileUpload", 
			data : formData, 
			contentType : false, 
			processData : false, 
			dataType : "json", 
			
			beforeSend : function(xhr) {
	    		xhr.setRequestHeader(_csrfHeaderName, _csrfTokenValue);
	    	}, <%-- csrf 토큰 처리 --%>
			
			success : function(uploadResult, status) {
				console.log(uploadResult);
				$("#fileInput").val("");
				showUploadResult(uploadResult);
			}
		})
	})
	
	<%-- 파일 삭제 : 서버에 업로드된 파일 삭제 + 화면에 반영 --%>
	$(".fileUploadResult ul").on("click", "li span", function() {
		var fileName = $(this).data("filename");
		var fileLi = $(this).parent();
		
		$.ajax({
			type : "post", 
			url : "${contextPath}/deleteFile", 
			data : {fileName: fileName}, 
			dataType : "text", 
			
			success : function(result) {
				if(result == "DelSuccess") {
					window.alert("파일이 삭제되었습니다.");
					fileLi.remove();
					
				} else {
					if(confirm("파일이 존재하지 않습니다. 해당 항목을 삭제하시겠습니까?")) {
						fileLi.remove();
					}
				}
			}, 
			
			error: function(xhr, status, e) {
				window.alert("서버 장애");
				console.log(e);
				
				if(confirm("파일이 존재하지 않습니다. 해당 항목을 삭제하시겠습니까?")) {
					fileLi.remove();
				}
			}
		})
	})

</script>

<%@ include file="../include/footer.jsp" %>