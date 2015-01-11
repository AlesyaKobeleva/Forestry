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
                        <h1>Payment page</h1>
                        <hr class="featurette-divider"></hr>
                        <p>NOTE: This snippet was created with the help of derwiki's Stripe form.</p>
                        <hr class="featurette-divider"></hr>
                        <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="60"
                             aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
                            Step 4: Payment
                        </div>
                        <br>
                        <hr class="featurette-divider"></hr>
                    </div>
                    <script src='https://js.stripe.com/v2/' type='text/javascript'></script>
                    <form accept-charset="UTF-8" action="/" class="require-validation" data-cc-on-file="false"
                          data-stripe-publishable-key="pk_bQQaTxnaZlzv4FnnuZ28LFHccVSaj" id="payment-form"
                          method="post">
                        <div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden"
                                                                              value="✓"/><input name="_method"
                                                                                                type="hidden"
                                                                                                value="PUT"/><input
                                name="authenticity_token" type="hidden"
                                value="qLZ9cScer7ZxqulsUWazw4x3cSEzv899SP/7ThPCOV8="/></div>
                        <div class='form-row'>
                            <div class='col-xs-12 form-group required'>
                                <label class='control-label'>Name on Card</label>
                                <input class='form-control' size='4' type='text'>
                            </div>
                        </div>
                        <div class='form-row'>
                            <div class='col-xs-12 form-group card required'>
                                <label class='control-label'>Card Number</label>
                                <input autocomplete='off' class='form-control card-number' size='20' type='text'>
                            </div>
                        </div>
                        <div class='form-row'>
                            <div class='col-xs-12 form-group card required'>
                                <label class='control-label'>Billing Address</label>
                                <input autocomplete='off' class='form-control' size='20' type='text'>
                            </div>
                        </div>
                        <div class='form-row'>
                            <div class='col-xs-4 form-group cvc required'>
                                <label class='control-label'>CVC</label>
                                <input autocomplete='off' class='form-control card-cvc' placeholder='ex. 311' size='4'
                                       type='text'>
                            </div>
                            <div class='col-xs-4 form-group expiration required'>
                                <label class='control-label'>Expiration</label>
                                <input class='form-control card-expiry-month' placeholder='MM' size='2' type='text'>
                            </div>
                            <div class='col-xs-4 form-group expiration required'>
                                <label class='control-label'> </label>
                                <input class='form-control card-expiry-year' placeholder='YYYY' size='4' type='text'>
                            </div>
                        </div>


                        <div class='form-row'>
                            <div class='col-md-12 form-group'>
                                <hr class="featurette-divider"></hr>
                                <button class='form-control btn btn-success submit-button' disabled><span class="badge">Your total today: $300</span>
                                </button>
                                <button class='form-control btn btn-primary submit-button' type='submit'> Pay »</button>

                            </div>
                        </div>

                        <div class='form-row'>
                            <div class='col-md-12 error form-group hide'>
                                <div class='alert-danger alert'>
                                    Please correct the errors and try again.
                                </div>
                            </div>
                        </div>
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
