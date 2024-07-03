<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ page session="false" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ include file="../include/header.jsp" %>
<c:set var="now" value="<%= new java.util.Date() %>" />
<fmt:formatDate var="formattedToday" value="${now}" pattern="yyyy/MM/dd" />

<style>
	th{text-align: center;}
	a{color: black;}
	a:link { text-decoration: none; }
	a:visited { text-decoration: none; }
	a:hover { text-decoration: none; }
	a:active { text-decoration: none; }
	div.jobBox{
	
	}
	col-xs-3{
	position: absolute;
	display: inline-block;
	}
	.newRegister{
	margin: auto;
    display: block;
	}
	
	        .banner-container {
            width: 100%;
            background-color: #f8f8f8;
            padding: 10px 0;
            position: relative;
            border-bottom: 1px solid #ccc;
        }

        .banner-img {
            display: block;
            margin: 0 auto;
            max-width: 100%; 
        }


.container {
    position: sticky;
    top: 0;
    z-index: 1000;
    background-color: #f8f8f8;
    padding: 10px 0;
    border-bottom: 1px solid #ccc;
}

.wrapper{
overflow-x : hidden;

overflow-y : scroll;
}

	
</style>

 <div class="banner-container">
<img class="card-img-bottom d-block newRegister" src="${contextPath }/resources/images/banner.png" alt="Card image cap">
<br><br><br>
 </div>
<!-- 1. select:표시 게시물수 선택  -->
<div class= "bigContainer">
		<div class="container">
		
		<form role = "form" class="form-inline" id="frmSendValue" method="get" action="${contextPath }/board/homepage">
		
                       <div class="form-group">
                            <label class="sr-only">selectRowAmountPerPage</label>
                            <select class="form-control" id="selectRowAmountPerPage" name="rowAmountPerPage">
                                <option value="20" ${pagingCreator.paging.rowAmountPerPage==20? "selected" : "" }>20</option>
                                <option value="40" ${pagingCreator.paging.rowAmountPerPage==40? "selected" : "" }>40</option>
                                <option value="100" ${pagingCreator.paging.rowAmountPerPage==100? "selected" : "" }>100</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="sr-only">selectScopeDate</label>
                            <select class="form-control" id="selectScopeDate" name="scopeDate" >
                            	<option value="" ${pagingCreator.paging.scopeDate==null ? "selected" : "" }>모집종료 여부</option>
                            	<option value="E" ${pagingCreator.paging.scopeDate== "E" ? "selected" : "" }>모집중</option>
                            	<option value="N" ${pagingCreator.paging.scopeDate== "N" ? "selected" : "" }>종료된글포함</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="sr-only">selectScope</label>
                            <select class="form-control" id="selectScope" name="scope" >
                            	<option value="" ${pagingCreator.paging.scope==null ? "selected" : "" }>검색범위</option>
                            	<option value="TC" ${pagingCreator.paging.scope== "TC" ? "selected" : "" }>제목+내용</option>
                                <option value="T" ${pagingCreator.paging.scope== "T" ? "selected" : "" }>제목</option>
                                <option value="C" ${pagingCreator.paging.scope== "C" ? "selected" : "" }>내용</option>
                                <option value="J" ${pagingCreator.paging.scope== "J" ? "selected" : "" }>직종</option>
                                <option value="R" ${pagingCreator.paging.scope== "R" ? "selected" : "" }>지역</option>
                                <option value="W" ${pagingCreator.paging.scope== "W" ? "selected" : "" }>작성자</option>
                            </select>
                        </div>
                        <!-- 3. input: 검색어 입력 -->
                        <div class="input-group custom-search-form">
                        	<input type="text" class="form-control" id="inputKeyword" name="keyword"
                        		   placeholder="검색어를 입력하세요" value= '<c:out value="${pagingCreator.paging.keyword }"/>'>
                            <span class="input-group-btn">
                            <button class="btn btn-warning" type="button" id="btnSearchGo">
                                <i class="fa fa-search"></i>
                            </button>
                        	</span>
                        </div>
                        <!-- 4. 초기화 -->
                        <div class="input-group custom-search-form">
                            <button class="btn btn-danger" type="button" id="btnReset">
                                <span class="glyphicon glyphicon-remove"></span>
                            </button>
                        </div>
                        <input type="hidden" id="pageNum" name="pageNum" value='<c:out value="${pagingCreator.paging.pageNum }"/>' >

						</form>	
            </div>
<div>
<ul>
<%-- items="$" var="jobList" --%>
<c:forEach  items="${pagingCreator.recruiter}" var = "recruit">
  <fmt:formatDate var="formbendDate" value="${recruit.bendDate}" pattern="yyyy/MM/dd" />
	<div class="jobBox">
		<div class="col-lg-3 col-md-6">
			<c:choose>
				<c:when test="${formbendDate  < formattedToday}">
	                    <div class="panel panel-red">
                </c:when>
                <c:otherwise>
                		<div class="panel panel-primary">
                </c:otherwise>
            </c:choose>
                        <div class="panel-heading" style="height: 110px;">
                            <div class="row">
                                <div class="col-xs-3 text-left" style="margin-top:10px; font-size: large; width: 75%">
                                 <div ><c:out value="${recruit.btitle }"/></div>
                                 <div style="font-size: medium; margin-top: 5px; color: #E1FFE1;"><c:out value="🏦${recruit.bwriter }"/></div>
                                </div>
                                <div class="col-xs-3 pull-right" >
                                    <div class="huge"><c:out value="${recruit.bappCnt }/${recruit.bhcnt }"/></div>
                                    <div style="width: 140%; position: relative; right: 30%;"><c:out value="지원자/모집인원"/></div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer" style="height: 40px;">
                            	<input type="hidden" id="bnotrunk" value="${recruit.bno }">
                                <span class="pull-left"><c:out value="Detail"/></span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
	</div>

</c:forEach>

 <%--페이징버튼 --%>
                            <div class="pagination pull-right">
                            <ul class="pagination"  >
                           		<c:if test="${pagingCreator.prev}">
                           			<li class="paginate_button previous" tabindex="0">
                            			<a href="1">&laquo;</a>
                            		</li>
                            		<li class="paginate_button previous" tabindex="0">
                            			<a href="${pagingCreator.startPagingNum-10 }">이전</a>
                            		</li>
                            	</c:if>
                            	<c:forEach var="pageNum" begin="${pagingCreator.startPagingNum }" end="${pagingCreator.endPagingNum }" >
                            	 <li class='paginate_button ${pagingCreator.paging.pageNum == i ? "active" : "" }'  tabindex="0" >
                            		 <a style="width: 62px; text-align: center;" 
                            		    href="${pageNum }">${pageNum }</a>
                            	 </li>
                            	</c:forEach>
                            	<c:if test="${pagingCreator.next}">
                           			<li class="paginate_button next"  tabindex="0" >
                            			<a href="${pagingCreator.startPagingNum+10 }">이후</a>
                           			</li>
                           			<li class="paginate_button previous" tabindex="0">
                            			<a href="${pagingCreator.lastPageNum}">&raquo;</a>
                            		</li>
                           			
                           		</c:if>
                        	</ul>
                        	
                        	</div>
                        	<%--페이징버튼 --%>

	

</ul>
</div>




<form id="frmSendValue">

		<input type="hidden" id="pageNum" name="pageNum" value="${pagingCreator.paging.pageNum }">
		<input type="hidden" id="rowAmountPerPage" name="rowAmountPerPage" value="${pagingCreator.paging.rowAmountPerPage }">
</form>

</div>
</div>

<script>
var frmSendValue = $("#frmSendValue");
$(".panel-footer").on("click",function(){
	var bno = $(this).children("#bnotrunk").val();
	frmSendValue.append('<input type="hidden" id="bno" name="bno" value="' + bno + '">');
	
	frmSendValue.attr("action", "${contextPath}/board/detail");
	frmSendValue.attr("method","get");
	    	
	frmSendValue.submit();
	
})

$(".newRegister").on("click",function(){
	
	frmSendValue.attr("action", "${contextPath}/board/register");
	frmSendValue.attr("method","get");
	    	
	frmSendValue.submit();
	
})
 <%--표시글변경 버튼 클릭 이벤트 처리--%>
$("#selectRowAmountPerPage").on("change",function(){
		<%--frmSendValue.find("input[id='pageNum']").val(1);--%>
		$("#pageNum").val(1);
		frmSendValue.submit();
	});

 <%--검색 버튼 클릭 이벤트 처리--%>
    $("#btnSearchGo").on("click", function(){
    	
    	var scope = $("#selectScope").find("option:selected");
    	var scopeDate = $("#selectscopeDate").find("option:selected");
    	
    	var keyword = $("#inputKeyword").val();
    	
    	if(!scope&&!scopeDate){
    		alert("검색범위를 선택해주세요");
    		return;
    	} else if (!keyword){
    		alert("검색어를 입력하세요");
    		return;
    	}
    	 $("#pageNum").val(1); // 페이지 번호 초기화
         $("#frmSendValue").submit(); 
    		});
    <%-- 검색 초기화 버튼 클릭 이벤트 처리--%>
    $("#btnReset").on("click", function(){
    	$("#selectRowAmountPerPage").val(20);
    	$("#selectScope").val("");
    	$("#selectScopeDate").val("");
    	$("#inputKeyword").val("");
    	$("#pageNum").val(1);
    	
    	//frmSendValue.submit();
    	
    });
    
    $(".paginate_button a").on("click", function(e) {
    	e.preventDefault();
    	
    	//$("#pageNum").val($(this).attr("href"));
    	frmSendValue.find("input[id='pageNum']").val($(this).attr("href"));
    	//alert($("#pageNum").val());
    	
    	frmSendValue.attr("action", "${contextPath}/board/homepage");
    	frmSendValue.attr("method","get");
    	
    	frmSendValue.submit();
        
     });





</script>
<%@ include file="../include/footer.jsp" %>
