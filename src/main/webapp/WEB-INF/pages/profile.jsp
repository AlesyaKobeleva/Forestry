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
<header>
    <c:choose>
        <c:when test="${pageContext.request.userPrincipal.name != null}">
            <div>
                Пользователь : ${pageContext.request.userPrincipal.name} | <a href="<c:url value="/logout" />">
                Выйти</a></div>

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

<h1>${title}</h1>

<h3>${message}</h3>

</body>
</html>
