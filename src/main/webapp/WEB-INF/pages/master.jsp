<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>

<html>
<head>
    <title>Учет Древесины</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <style>
        body {
            background: url("http://bootstraptaste.com/theme/siimple/assets/img/main-bg.jpg") 50%;
            color: #fff;
        }

        .panel-custom {
            color: black;
        }
    </style>
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
                    <li role="presentation"><a href="<c:url value="/profile" />">Профиль пользователя</a></li>
                    <c:choose>
                        <c:when test="${pageContext.request.isUserInRole('ROLE_MASTER')}">
                            <li role="presentation" class="active"><a href="<c:url value="/master" />">Учет
                                Древесины</a></li>
                        </c:when>
                    </c:choose>
                </ul>
            </nav>
        </c:when>
    </c:choose>
</header>

<div style="margin: 30px;" class="panel panel-default">
    <div class="panel-body panel-custom">
        <br>

        <div class="panel panel-danger"></div>
        <div class="container">
            <div class='row'>
                <div class='col-md-4'></div>
                <div class='col-md-4'>
                    <div class='col-md-12 form-group'>
                        <h1>Добавить древесину</h1>
                    </div>
                    <form action="#" th:action="@{/master}" th:object="${master}"  class="require-validation" id="payment-form"
                          method="POST">

                        <div class='form-row'>
                            <div class='col-md-12 form-group card'>
                                <label class='control-label'>Порода древесины: </label>
                                <input autocomplete='off' class='form-control' type='text' th:field="*{species}">
                            </div>
                        </div>

                        <div class='form-row'>
                            <div class='col-md-12 form-group'>
                                <label class='control-label'>Участок вырубки: </label>
                                <select class="form-control" th:field="*{cuttingSection}"  id="cuttingSection">
                                    <c:forEach  items="${cuttingSections}" var="item">
                                        <option value="${item}">${item}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class='form-row'>
                            <div class='col-md-12 form-group'>
                                <button class='form-control btn btn-primary submit-button' type='submit'> Добавить »</button>

                            </div>
                        </div>

                        <div class='form-row'>
                            <div class='col-md-12 error form-group hide'>
                                <div class='alert-danger alert'>
                                    Please correct the errors and try again.
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}"/>
                    </form>
                </div>

                <div class='col-md-4'></div>
            </div>
        </div>
    </div>
    <br>

    <div class="panel panel-danger"></div>
</div>
</div>

</body>
</html>
