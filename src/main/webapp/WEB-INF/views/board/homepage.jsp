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
	
</style>

<img class="card-img-bottom d-block newRegister" src="${contextPath }/resources/images/banner.png" alt="Card image cap">
<br><br><br><br><br><br><br><br><br><br><br>
<br><br>
<div>
<ul>
<%-- items="$" var="jobList" --%>
<c:forEach  items="${recruitList }" var = "recruit">
  <fmt:formatDate var="formbendDate" value="${recruit.bendDate}" pattern="yyyy/MM/dd" />

<c:if test="${formbendDate ge formattedToday}">

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
	</c:if>
</c:forEach>

	

</ul>
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

$(".newRegister").on("click",function(){
	
	frmSendValue.attr("action", "${contextPath}/board/register");
	frmSendValue.attr("method","get");
	    	
	frmSendValue.submit();
	
})





</script>
<%@ include file="../include/footer.jsp" %>
