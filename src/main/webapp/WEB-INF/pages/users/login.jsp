
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="fr"> <!--<![endif]-->
    <head>
        <title><spring:message code="login.titlePage"/></title>

        <!-- Meta -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Favicon -->
        <link rel="shortcut icon" href="favicon.ico">

        <!-- Web Fonts -->
        <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans:400,300,700&amp;subset=cyrillic,latin">

        <!-- CSS Global Compulsory -->
        <link rel="stylesheet" href="<c:url value="resources/theme_1/assets/plugins/bootstrap/css/bootstrap.min.css" />">
        <link rel="stylesheet" href="<c:url value="resources/theme_1/assets/css/style.css" />">

        <!-- CSS Implementing Plugins -->
        <link rel="stylesheet" href="<c:url value="resources/theme_1/assets/plugins/animate.css" />">
        <link rel="stylesheet" href="<c:url value="resources/theme_1/assets/plugins/line-icons/line-icons.css" />">
        <link rel="stylesheet" href="<c:url value="resources/theme_1/assets/plugins/font-awesome/css/font-awesome.min.css" />">
        <link rel="stylesheet" href="<c:url value="resources/theme_1/assets/plugins/brand-buttons/brand-buttons.css" />">

        <!-- CSS Page Style -->
        <link rel="stylesheet" href="<c:url value="resources/theme_1/assets/css/pages/page_log_reg_v4.css" />">

        <!-- CSS Theme -->
        <link rel="stylesheet" href="<c:url value="resources/theme_1/assets/css/theme-colors/blue.css" />">

        <!-- CSS Customization -->
        <link rel="stylesheet" href="<c:url value="resources/theme_1/assets/css/custom.css" />">


        <!-- JS Global Compulsory -->
        <script src="<c:url value="resources/theme_1/assets/plugins/jquery/jquery.min.js" />"></script>
        <script src="<c:url value="resources/theme_1/assets/plugins/jquery/jquery-migrate.min.js" />"></script>
        <script src="<c:url value="resources/theme_1/assets/plugins/bootstrap/js/bootstrap.min.js" />"></script>

        <!-- JS Implementing Plugins -->
        <script src="<c:url value="resources/theme_1/assets/plugins/back-to-top.js" />"></script>
        <script src="<c:url value="resources/theme_1/assets/plugins/backstretch/jquery.backstretch.min.js" />"></script>

        <!-- JS Customization -->
        <script src="<c:url value="resources/theme_1/assets/js/custom.js" />"></script>
        

    </head>
    <body>
        <!--=== Content Part ===-->
        <div class="container-fluid">
            <div class="row equal-height-columns">
                <div class="col-md-6 col-sm-6 hidden-xs image-block equal-height-column"></div>
                <div class="col-md-6 col-sm-6 form-block equal-height-column">
                    <img src="<c:url value="resources/theme_1/assets/img/themes/logo1-blue.png" />" alt="">
                    <h2 class="margin-bottom-30"><spring:message code="login.titleForm"/></h2>
                    <c:if test="${error != null}">
                        <div class="alert alert-danger fade in">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <p class="center-block"><spring:message code="login.error"/></p>
                        </div> 
                    </c:if>
                    <form name='loginForm' action="<c:url value='/login' />" method='POST'>
                        <div class="login-block">
                            <div class="input-group margin-bottom-20">
                                <span class="input-group-addon rounded-left"><i class="icon-user color-blue"></i></span>
                                <input name="username" type="text" class="form-control rounded-right" placeholder="<spring:message code="login.username"/>">
                            </div>

                            <div class="input-group margin-bottom-20">
                                <span class="input-group-addon rounded-left"><i class="icon-lock color-blue"></i></span>
                                <input name="password" type="password" class="form-control rounded-right" placeholder="<spring:message code="login.password"/>">
                            </div>

                            <div class="checkbox">
                                <ul class="list-inline">
                                    <li>
                                        <label>
                                            <input type="checkbox"> <spring:message code="login.remember"/>
                                        </label>
                                    </li>

                                    <li class="pull-right">
                                        <a href="#"><spring:message code="login.forgotPassword"/></a>
                                    </li>
                                </ul>
                            </div>

                            <div class="row margin-bottom-70">
                                <div class="col-md-12">
                                    <button type="submit" class="btn-u btn-u-blue btn-block rounded"><spring:message code="login.signIn"/></button>
                                </div>
                            </div>

                            <div class="social-login text-center">
                                <div class="or rounded-x"><spring:message code="login.or"/></div>
                                <ul class="list-inline margin-bottom-20">
                                    <li>
                                        <button class="btn rounded btn-lg btn-appnet">
                                            <spring:message code="login.aboutUs"/>
                                        </button>
                                    </li>
                                    <li>
                                        <button class="btn rounded btn-lg btn-blogger">
                                            <spring:message code="login.joinUs"/>
                                        </button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </form>
                </div>
            </div>
        </div><!--/container-->
        <!--=== Sticky Footer ===-->
        <div class="container sticky-footer">
            <p class="copyright-space">
                <spring:message code="login.copyright"/>
            </p>
        </div>
        <!--=== End Sticky Footer ===-->

    </body>
</html>


<!-- JS Page Level -->
<script src="<c:url value="resources/theme_1/assets/js/app.js" />"></script>
<script>
    jQuery(document).ready(function () {
        App.init();

    });
</script>
<script>
    $(".image-block").backstretch([
        "${pageContext.request.contextPath}/<c:url value="resources/images/login/login_bg_1.jpg" />",
                "${pageContext.request.contextPath}/<c:url value="resources/images/login/login_bg_2.jpg" />",
                        "${pageContext.request.contextPath}/<c:url value="resources/images/login/login_bg_3.jpg" />"

                            ], {
                                fade: 1000,
                                duration: 7000
                            });
</script>
<!--[if lt IE 9]>
    <script src="<c:url value="resources/theme_1/assets/plugins/respond.js" />"></script>
    <script src="<c:url value="resources/theme_1/assets/plugins/html5shiv.js" />"></script>
    <script src="<c:url value="resources/theme_1/assets/plugins/placeholder-IE-fixes.js" />"></script>
    <![endif]-->
