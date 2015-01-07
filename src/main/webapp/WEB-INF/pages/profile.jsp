<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>

<html>
<body>
<h1>${title}</h1>
<h3>${message}</h3>

<c:if test="${pageContext.request.userPrincipal.name != null}">
  <h2>Пользователь : ${pageContext.request.userPrincipal.name} | <a href="<c:url value="/logout" />" > Выйти</a></h2>
</c:if>

</body>
</html>
