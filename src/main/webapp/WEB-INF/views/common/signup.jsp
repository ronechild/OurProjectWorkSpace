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
<body>
<div class="login-box">
    <div class="login-html">
        <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">SIGN IN</label>
        <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">SIGN UP</label>
        
        <div class="login-form">
            <div class="sign-in-html">
                <form class="frmLogin" action="${contextPath}/login" method="post">
                    <div class="group">
                        <label for="username" class="label">USERID</label>
                        <input id="username" name="username" type="text" class="input" required>
                    </div>
                    <div class="group">
                        <label for="password" class="label">PASSWORD</label>
                        <input id="password" name="password" type="password" class="input" required>
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
                <div class="hr"></div>
                <div class="forget-password">
                    <a href="아이디 찾는 사이트 이동">Forgot Password?</a>
                </div>
            </div>
            
            <div class="sign-up-html">
                <form class="frmRegister" action="${contextPath}/register" method="post">
                    <div class="group">
                        <label for="userid" class="label">USERID</label>
                        <input id="userid" name="userid" type="text" class="input" required>
                    </div>
                    <div class="group">
                        <label for="userpw" class="label">USERPW</label>
                        <input id="userpw" name="userpw" type="password" class="input" required oninput="checkPasswordStrength()">
                        <div id="password-strength"></div>
                    </div>
                    <div class="group">
                        <label for="userpw_confirm" class="label">CONFIRM PASSWORD</label>
                        <input id="userpw_confirm" name="userpw_confirm" type="password" class="input" required>
                    </div>
                    <div class="group">
                        <label for="username" class="label">USERNAME</label>
                        <input id="username" name="username" type="text" class="input" required>
                    </div>
                    <div class="group">
                        <label for="email" class="label">EMAIL</label>
                        <input id="email" name="email" type="email" class="input" required>
                    </div>
                    <div class="group">
                        <label for="phone" class="label">PHONE</label>
                        <input id="phone" name="phone" type="text" class="input" required>
                    </div>
                   <div class="group">
					    <input type="submit" class="button" value="SIGN UP" onclick="registerUser(event)">
				   </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                </form>
                <div class="hr"></div>
            </div>
        </div>
    </div>
</div>

<script>

<%-- password 보안성 검사--%>
function checkPasswordStrength() {
    var strengthBar = document.getElementById("password-strength");
    var password = document.getElementById("userpw").value;
    var strength = 0;

    if (password.length >= 8) strength++;
    if (password.match(/[a-z]+/)) strength++;
    if (password.match(/[A-Z]+/)) strength++;
    if (password.match(/[0-9]+/)) strength++;
    if (password.match(/[\W_]+/)) strength++;

    var strengthText = "";
    switch (strength) {
        case 0:
        case 1:
            strengthText = "Weak";
            strengthBar.style.color = "red";
            break;
        case 2:
            strengthText = "Fair";
            strengthBar.style.color = "orange";
            break;
        case 3:
            strengthText = "Good";
            strengthBar.style.color = "yellow";
            break;
        case 4:
            strengthText = "Strong";
            strengthBar.style.color = "lightgreen";
            break;
        case 5:
            strengthText = "Very Strong";
            strengthBar.style.color = "green";
            break;
    }

    strengthBar.innerText = strengthText;
}

<%--  --%>
function registerUser(event) {
    event.preventDefault(); // 기본 폼 제출을 방지

    var userid = document.getElementById("userid").value;
    var userpw = document.getElementById("userpw").value;
    var userpw_confirm = document.getElementById("userpw_confirm").value;
    var username = document.getElementById("username").value;
    var email = document.getElementById("email").value;
    var phone = document.getElementById("phone").value;

    if (userpw !== userpw_confirm) {
        alert("Passwords do not match");
        return;
    }

    var csrfParameterName = "${_csrf.parameterName}";
    var csrfToken = "${_csrf.token}";

    var data = {
        userid: userid,
        userpw: userpw,
        username: username,
        email: email,
        phone: phone
    };
    data[csrfParameterName] = csrfToken;

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "${contextPath}/register", true);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                alert("Registration successful");
                // 성공시 추가 행동 (예: 로그인 페이지로 리디렉션)
            } else {
                alert("Registration failed");
                // 실패시 추가 행동
            }
        }
    };
    xhr.send(JSON.stringify(data));
}

</script>
</body>
</html>