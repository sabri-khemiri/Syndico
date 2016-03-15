<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@attribute name="js" fragment="true" %>
<%@attribute name="css" fragment="true" %>
<%@attribute name="title" fragment="true" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
    <head>
        <title>Blog Medium Full Width 1 | Unify - Responsive Website Template</title>

        <!-- Meta -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Favicon -->
        <link rel="shortcut icon" href="favicon.ico">

        <!-- Web Fonts -->
        <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

        <!-- CSS Global Compulsory -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/assets/css/style.css">

        <!-- CSS Header and Footer -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/assets/css/headers/header-default.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/assets/css/footers/footer-v1.css">

        <!-- CSS Implementing Plugins -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/animate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/line-icons/line-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">

        <!-- CSS Theme -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/assets/css/theme-colors/default.css" id="style_color">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/assets/css/theme-skins/dark.css">

        <!-- CSS Customization -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme_1/assets/css/custom.css">

        <jsp:invoke fragment="css"/>

    </head>

    <body class="header-fixed boxed-layout container">
        <div class="wrapper">
            <!--=== Header ===-->
            <div class="header header-sticky">
                <div class="container">
                    <!-- Logo -->
                    <a class="logo" href="index.html">
                        <img src="${pageContext.request.contextPath}/resources/theme_1/assets/img/logo1-default.png" alt="Logo">
                    </a>
                    <!-- End Logo -->

                    <!-- Topbar -->
                    <div class="topbar">
                        <ul class="loginbar pull-right">
                            <li class="hoverSelector">
                                <i class="fa fa-globe"></i>
                                <a>Langue</a>
                                <ul class="languages hoverSelectorBlock">
                                    <li class="active">
                                        <a href="#">France <i class="fa fa-check"></i></a>
                                    </li>
                                    <li><a href="#">English</a></li>
                                </ul>
                            </li>
                            <li class="topbar-devider"></li>
                            <li><a href="">Déconnexion</a></li>
                        </ul>
                    </div>
                    <!-- End Topbar -->

                </div><!--/end container-->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse mega-menu navbar-responsive-collapse">
                    <div class="container">
                        <ul class="nav navbar-nav">
                            <!-- Home -->
                            <li>
                                <a href="${pageContext.request.contextPath}/owner" class="dropdown-toggle" data-toggle="dropdown">
                                    Accueil
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                                    Travaux
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                                    Assenblé général
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/owner/message" class="dropdown-toggle" data-toggle="dropdown">
                                    Message
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                                    Profil
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                                    Aide
                                </a>
                            </li>
                            <!-- End Home -->

                            <!-- Search Block -->
                            <li>
                                <i class="search fa fa-search search-btn"></i>
                                <div class="search-open">
                                    <div class="input-group animated fadeInDown">
                                        <input type="text" class="form-control" placeholder="Recherche">
                                        <span class="input-group-btn">
                                            <button class="btn-u" type="button">Go</button>
                                        </span>
                                    </div>
                                </div>
                            </li>
                            <!-- End Search Block -->
                        </ul>
                    </div><!--/end container-->
                </div><!--/navbar-collapse-->
            </div>
            <!--=== End Header ===-->

            <jsp:doBody/>

            <!--=== Footer Version 1 ===-->
            <div class="footer-v1">
                <div class="copyright">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6">
                                <p>
                                    <spring:message code="login.copyright"/>
                                </p>
                            </div>
                        </div>
                    </div>
                </div><!--/copyright-->
            </div>
            <!--=== End Footer Version 1 ===-->
        </div><!--/wrapper-->

        <!-- JS Global Compulsory -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/jquery/jquery-migrate.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <!-- JS Implementing Plugins -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/back-to-top.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/smoothScroll.js"></script>
        <!-- JS Customization -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/js/custom.js"></script>
        <!-- JS Page Level -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/js/app.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/js/plugins/style-switcher.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/backstretch/jquery.backstretch.min.js"></script>

        <jsp:invoke fragment="js"/>

        <script type="text/javascript">
            $.backstretch([
                "${pageContext.request.contextPath}/resources/images/login/login_bg_2.jpg"
            ]);
            jQuery(document).ready(function () {
                App.init();
                StyleSwitcher.initStyleSwitcher();
            });
        </script>
        <!--[if lt IE 9]>
            <script src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/respond.js"></script>
            <script src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/html5shiv.js"></script>
            <script src="${pageContext.request.contextPath}/resources/theme_1/assets/plugins/placeholder-IE-fixes.js"></script>
            <![endif]-->

    </body>
</html>
