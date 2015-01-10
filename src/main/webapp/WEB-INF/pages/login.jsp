<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

    <style>
        body {
            background: url("http://bootstraptaste.com/theme/siimple/assets/img/main-bg.jpg") 50%;
        }
        .error {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 4px;
            color: #a94442;
            background-color: #f2dede;
            border-color: #ebccd1;
        }

        .msg {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 4px;
            color: #31708f;
            background-color: #d9edf7;
            border-color: #bce8f1;
        }
        .form-wrap {
            margin: 15% 30%;
        }
    </style>
</head>
<body onload='document.loginForm.username.focus();'>
<div class="form-wrap">
<h3>Login with Username and Password</h3>

<c:if test="${not empty error}">
    <div class="error">${error}</div>
</c:if>
<c:if test="${not empty msg}">
    <div class="msg">${msg}</div>
</c:if>

<form class="form-horizontal" name='loginForm' action="<c:url value='/login' />" method='POST'>
    <fieldset style="width: 50%;">
        <div class="form-group">
            <label for="inputLogin" class="control-label col-xs-2">Login: </label>

            <div class="col-xs-10">
                <input type="text" name="username" class="form-control" id="inputLogin" placeholder="Login">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword" class="control-label col-xs-2">Password: </label>

            <div class="col-xs-10">
                <input type="password" name="password" class="form-control" id="inputPassword" placeholder="Password">
            </div>
        </div>

        <div class="form-group">
            <div class="col-xs-offset-2 col-xs-10">
                <button type="submit" class="btn btn-primary">Login</button>
            </div>
        </div>
    </fieldset>

    <input type="hidden" name="${_csrf.parameterName}"
           value="${_csrf.token}"/>
</form></div>
</body>
</html>