<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@attribute name="js" fragment="true" %>
<%@attribute name="css" fragment="true" %>
<%@attribute name="title" fragment="true" %>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Syndico <jsp:invoke fragment="title"/></title>

        <link href="${pageContext.request.contextPath}/resources/theme_2/assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/theme_2/assets/font-awesome/css/font-awesome.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/theme_2/assets/css/animate.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/theme_2/assets/css/style.css" rel="stylesheet">

        <jsp:invoke fragment="css"/>

    </head>

    <body class="skin-3">

        <div id="wrapper">

            <nav class="navbar-default navbar-static-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav metismenu" id="side-menu">
                        <li class="nav-header">
                            <div class="dropdown profile-element row"> 
                                <a href="#">
                                    <span class="col-lg-10 col-lg-offset-1">
                                        <img alt="image" class="img-responsive img-circle" src="${pageContext.request.contextPath}/resources/images/user/${account.id}${account.image}" />
                                    </span>
                                    <samp class="clearfix"></samp>
                                    <span class="clear"> 
                                        <span class="block m-t-xs"> <strong class="font-bold">${trust.name}</strong></span>
                                        <span class="text-xs block">${account.firstName} ${account.lastName}</span>
                                    </span>
                                </a>
                            </div>
                            <div class="logo-element">
                                Syn
                            </div>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/manager"><i class="fa fa-home"></i> <span class="nav-label">Acceuil</span></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/manager/co_ownership"><i class="fa fa-building-o"></i> <span class="nav-label">Copropriété</span></a>
                        </li>
                        <li>
                            <a  href="${pageContext.request.contextPath}/manager/message"><i class="fa fa-envelope-o"></i> <span class="nav-label">Message</span></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/manager/works/requests"><i class="fa fa-question"></i> <span class="nav-label">Travaux</span></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/manager/news/add"><i class="fa fa-comments-o"></i> <span class="nav-label">Annonce General</span></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/manager/profil"><i class="fa fa-user"></i> <span class="nav-label">Mon profil</span></a>
                        </li>                        
                        <li>
                            <a href=""><i class="fa fa-question"></i> <span class="nav-label">Aide</span></a>
                        </li>
                    </ul>
                </div>
            </nav>

            <div id="page-wrapper" class="gray-bg">
                <div class="row border-bottom">
                    <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                        <div class="navbar-header">
                            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                        </div>
                        <ul class="nav navbar-top-links navbar-right">
                            <li>
                                <span class="m-r-sm text-muted welcome-message">Lundi 01 Janvier 2016 : 16h00</span>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/logout">
                                    <i class="fa fa-sign-out"></i> Deconnexion
                                </a>
                            </li>
                        </ul>

                    </nav>
                </div>
                <jsp:doBody/>
                <div class="footer fixed">
                    <div>
                        <spring:message code="login.copyright"/>
                    </div>
                </div>

            </div>
        </div>


        <!-- Mainly scripts -->
        <script src="${pageContext.request.contextPath}/resources/theme_2/assets/js/jquery-2.1.1.js"></script>
        <script src="${pageContext.request.contextPath}/resources/theme_2/assets/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/theme_2/assets/js/plugins/metisMenu/jquery.metisMenu.js"></script>
        <script src="${pageContext.request.contextPath}/resources/theme_2/assets/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <!-- Custom and plugin javascript -->
        <script src="${pageContext.request.contextPath}/resources/theme_2/assets/js/inspinia.js"></script>
        <script src="${pageContext.request.contextPath}/resources/theme_2/assets/js/plugins/pace/pace.min.js"></script>

        <jsp:invoke fragment="js"/>

    </body>

</html>
