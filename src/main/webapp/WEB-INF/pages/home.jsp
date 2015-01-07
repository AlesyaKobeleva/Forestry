<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" %>
<html>
<head>
    <title>This is the home page</title>
</head>
<body>
    <header>
        <c:choose>
            <c:when test="${pageContext.request.userPrincipal.name != null}">
                <div>Пользователь : ${pageContext.request.userPrincipal.name} | <a href="<c:url value="/logout" />" > Выйти</a></div>
                <div><a href="<c:url value="/profile" />" > Профиль пользователя</a></div>
            </c:when>
            <c:when test="${pageContext.request.userPrincipal.name == null}">
                <div><a href="<c:url value="/login" />" > Войти</a></div>
            </c:when>
        </c:choose>
    </header>

    <h1>${title}</h1>

    <h3>${message}</h3>
</body>
</html>
