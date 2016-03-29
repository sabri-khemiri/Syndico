
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
                    <c:forEach var="error" items="${errors}">
                        ${error}
                    </c:forEach>
                    <form action="" method="POST" id="sky-form2" class="sky-form">
                    <fieldset>
                        <section>
                            <div class="row">
                                    <label class="col col-4">Identifiant</label>
                                    <div class="col col-8">
                                            <label class="input">
                                                    <input type="text" name="username">
                                            </label>
                                    </div>
                            </div>
                            <div class="row">
                                    <label class="col col-4">Mot de passe</label>
                                    <div class="col col-8">
                                            <label class="input">
                                                <input type="password" name="password">
                                            </label>
                                    </div>
                            </div>
                        </section>
                        <section>
                            <div class="row">
                                    <label class="col col-4">Nouveau Identifiant</label>
                                    <div class="col col-8">
                                            <label class="input">
                                                    <input type="text" name="newUsername">
                                            </label>
                                    </div>
                            </div>
                            <div class="row">
                                    <label class="col col-4">Nouveau Mot de passe</label>
                                    <div class="col col-8">
                                            <label class="input">
                                                    <input type="password" name="newPassword">
                                            </label>
                                    </div>
                            </div>
                            <div class="row">
                                    <label class="col col-4">Prenon</label>
                                    <div class="col col-8">
                                            <label class="input">
                                                    <input type="text" name="firstName">
                                            </label>
                                    </div>
                            </div>
                            <div class="row">
                                    <label class="col col-4">Nom</label>
                                    <div class="col col-8">
                                            <label class="input">
                                                    <input type="text" name="lastName">
                                            </label>
                                    </div>
                            </div>
                            <div class="row">
                                    <label class="col col-4">Email</label>
                                    <div class="col col-8">
                                            <label class="input">
                                                    <input type="text" name="email">
                                            </label>
                                    </div>
                            </div>
                        </section>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                        <button type="submit" class="btn-u">Envoyer</button>
                    </fieldset>
                    
                </form>
                    </
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
