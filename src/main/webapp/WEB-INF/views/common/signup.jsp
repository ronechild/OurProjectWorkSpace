<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<title>LOGIN PAGE</title>
<link rel="stylesheet" href="${contextPath}/resources/css/sign.css" type="text/css">
</head>

<div class="login-box"> <!-- 전체 틀  -->
  <div class="login-html">
    <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">SIGN IN</label>
    <!-- input label을 붙여서 텍스트를 클릭시 자동으로 연결된 체크박스를 체크함  -->
    <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">SIGN UP</label>
    <!-- input label을 붙여서 텍스트를 클릭시 자동으로 연결된 체크박스를 체크함  -->
    
    <div class="login-form">
      
      <div class="sign-in-html">
      <form class="frmLogin" action="${contextPath}/login" method="post">
        <div class="group">
          <label for="user" class="label">USERID</label>
          <input id="username" name="username" type="text" class="input">
        </div>
      
        <div class="group">
          <label for="pass" class="label">PASSWORD</label>
          <input id="password" name="password" type="password" class="input">
        </div>
        
        <div class="group">
          <input id="check" name="remember" type="checkbox" class="check" checked>
          <label for="check"><span class="icon"></span> Keep me Signed in</label>
        </div>
      
        <div class="group">
          <input type="submit" class="button" value="SIGN IN">
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      </form>
      
        <div class="hr"></div> <!-- 수평선 입력 -->
        <div class="forget-password">
          <a href="아이디 찾는 사이트 이동">Forgot Password?</a> <!-- Forgot Password? 입력시 아이디 찾는 사이트 이동  -->
        </div>
    
      </div> <!-- sign-in-html end -->
    
      <form class="frmRegister" action="" method="post">
      <div class="sign-up-html">
        <div class="group">
          <label for="user" class="label">USERID</label>
          <input id="user" type="text" class="input">
        </div>
        
        <div class="group">
          <label for="pass" class="label">USERPW</label>
          <input id="pass" type="password" class="input">
        </div>
      
        <div class="group">
          <label for="pass" class="label">USERNAME</label>
          <input id="pass" type="text" class="input">
        </div>
      
        <div class="group">
          <label for="pass" class="label">EMAIL</label>
          <input id="pass" type="text" class="input">
        </div>
      
        <div class="group">
          <label for="pass" class="label">PHONE</label>
          <input id="pass" type="text" class="input">
        </div>
        
        <div class="group">
          <input type="submit" class="button" value="SIGN UP">
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      </form>
      	
      <div class="hr"></div> <!-- 수평선 입력 -->
    
      </div> <!-- sign-up-html end -->
    </div> <!-- login-form end -->
  </div> <!-- login-html end -->
</div> <!-- login-box end -->
</html>
