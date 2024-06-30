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
	col-xs-3{
	position: absolute;
	display: inline-block;
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
<c:forEach  items="${recruitList }" var = "recruit">
	<div class="jobBox">
		<div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
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

</form>

<script>
var frmSendValue = $("#frmSendValue");
$(".panel-footer").on("click",function(){
	var bno = $(this).children("#bnotrunk").val();
	frmSendValue.append('<input type="hidden" id="bno" name="bno" value="' + bno + '">');
	
	frmSendValue.attr("action", "${contextPath}/board/detail");
	frmSendValue.attr("method","get");
	    	
	frmSendValue.submit();
	
})



</script>
<%@ include file="../include/footer.jsp" %>
