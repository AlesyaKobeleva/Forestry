<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>

<html>
<head>
    <title>Профиль пользователя</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<header style="margin: 30px;">
    <c:choose>
        <c:when test="${pageContext.request.userPrincipal.name != null}">
            <div style="float: right;">
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                Пользователь : ${pageContext.request.userPrincipal.name} |
                <a href="<c:url value="/logout" />"> Выйти</a>
            </div>

            <nav>
                <ul class="nav nav-pills" role="tablist">
                    <li role="presentation"><a href="<c:url value="/home" />">Home</a></li>
                    <li role="presentation" class="active"><a href="<c:url value="/profile" />">Профиль пользователя</a></li>
                </ul>
            </nav>
        </c:when>
        <c:when test="${pageContext.request.userPrincipal.name == null}">
            <div><a href="<c:url value="/login" />"> Войти</a></div>
        </c:when>
    </c:choose>
</header>

<div style="margin: 30px;" class="panel panel-default">
    <div class="panel-body">
        <h3>${title}</h3>
        <p>${message}</p>
    </div>
</div>

</body>
</html>
