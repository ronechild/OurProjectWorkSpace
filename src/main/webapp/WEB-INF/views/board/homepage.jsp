<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ page session="false" %>

<%@ include file="../include/header.jsp" %>
<style>
	th{text-align: center;}
	a{color: black;}
	a:link { text-decoration: none; }
	a:visited { text-decoration: none; }
	a:hover { text-decoration: none; }
	a:active { text-decoration: none; }
	div.jobBox{
	
	}
	
</style>

<h1>
	Hello world!  
</h1>
<br><br><br><br><br><br><br><br><br><br><br>
<div class="input-group search-input custom-search-form pull-right" >
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
</div>
<br><br>
<div>
<ul>
<%-- items="$" var="jobList" --%>
<c:forEach begin="1" end="20">
	<div class="jobBox">
		<div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><c:out value="jobList"/></div>
                                    <div><c:out value="신청자/모집인원"/></div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left"><c:out value="Detail"/></span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
	</div>
</c:forEach>

	

</ul>
</div>

<%--페이징 버튼 --%>
<div class="col-sm-6 pull-right" >
	<div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
		<ul class="pagination">
			<li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
				<a href="#">Previous</a>
			</li>
			<li class="paginate_button active" aria-controls="dataTables-example" tabindex="0">
				<a href="#">1</a>
			</li>
			<li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
				<a href="#">Next</a>
			</li>
		</ul>
	</div>
</div>

<form id="frmSendValue">
		<input type="hidden" id="pageNum" name="pageNum" <%-- value="${pagingCreator.myBoardPaging.pageNum }" --%>>
		<input type="hidden" id="rowAmountPerPage" name="rowAmountPerPage" <%-- value="${pagingCreator.myBoardPaging.rowAmountPerPage }" --%>>

</form>

<script>
var frmSendValue = $("#frmSendValue");
$(".panel-footer").on("click",function(){
	var bno = $(this).data("bno");
	frmSendValue.append('<input type="hidden" id="bno" name="bno" value="' + bno + '">');
	
	frmSendValue.attr("action", "${contextPath}/detail");
	frmSendValue.attr("method","get");
	    	
	frmSendValue.submit();
	
})



</script>
<%@ include file="../include/footer.jsp" %>
