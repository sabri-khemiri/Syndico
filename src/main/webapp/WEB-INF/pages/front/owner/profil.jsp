<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:template_owner>
    <jsp:attribute name="title">${account.username}</jsp:attribute>

    <jsp:attribute name="css">
    </jsp:attribute>

    <jsp:attribute name="js">        
    </jsp:attribute>
    <jsp:body>
        <div class="breadcrumbs-v1" style="background-image: url('${pageContext.request.contextPath}/resources/images/owner/10.jpg')">
            <div class="container">
                <h1> <spring:message code="Oawr.profile"/> </h1>
                <span> ${account.firstName} ${account.lastName} </span>
            </div>
        </div>

        <div class="wrapper wrapper-content">
            <div class="wrapper wrapper-content animated fadeInDown">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="container content profile">
                            <div class="row">
                                <div class="col-md-3 md-margin-bottom-40">
                                    <img class="img-responsive profile-img margin-bottom-20" src="${pageContext.request.contextPath}/resources/images/user/${account.id}${account.image}" alt="">
                                    <a href="${pageContext.request.contextPath}/owner/profil/image/"><button type="button" class="btn-u btn-u-default btn-u-sm btn-block">Modifier image profil</button></a>

                                    <div class="panel-heading-v2 overflow-h">
                                        <h2 class="heading-xs pull-left"><i class="fa fa-user"></i> Detail</h2>
                                    </div>
                                    <ul class="list-group clear-list">
                                        <li class="list-group-item fist-item">
                                            <span class="pull-right"> ${account.firstName} </span>
                                            <spring:message code="Mprof.firstName"/>
                                        </li>
                                        <li class="list-group-item fist-item">
                                            <span class="pull-right"> ${account.lastName} </span>
                                            <spring:message code="Mprof.name"/>
                                        </li>
                                        <li class="list-group-item fist-item">
                                            <span class="pull-right"> ${account.email} </span>
                                            <spring:message code="Mprof.mail"/>
                                        </li>
                                        <li class="list-group-item fist-item">
                                            <span class="pull-right"> ${account.coOwnership.name} </span>
                                            <spring:message code="Mprof.ownerShip"/>
                                        </li>
                                        <li class="list-group-item fist-item">
                                            <span class="pull-right"> ${account.creationDate} </span>
                                            <spring:message code="Mprof.create"/>
                                        </li>
                                    </ul>
                                    <div class="margin-bottom-50"></div>
                                </div>

                                <!-- Profile Content -->
                                <div class="col-md-9">
                                    <div class="">
                                        <div id="passwordTab" class="profile-edit">
                                            <h2 class="heading-md">Gérer votre profil .</h2>
                                            <br>

                                            <form:form role="form"  action="" commandName="faccount" method="POST" class="sky-form" id="sky-form4">  
                                                <dl class="dl-horizontal">
                                                    <dt><spring:message code="Mprof.name"/></dt>
                                                    <dd>
                                                        <section>
                                                            <label class="input">
                                                                <i class="icon-append fa fa-user"></i>
                                                                <form:input class="form-control" path="lastName" value="${faccount.lastName}" />
                                                            </label>
                                                        </section>
                                                    </dd>
                                                    <dt><spring:message code="Mprof.firstName"/></dt>
                                                    <dd>
                                                        <section>
                                                            <label class="input">
                                                                <i class="icon-append fa fa-user"></i>
                                                                <form:input class="form-control" path="firstName" value="${faccount.firstName}" />
                                                            </label>
                                                        </section>
                                                    </dd>
                                                    <dt><spring:message code="Mprof.name"/></dt>
                                                    <dd>
                                                        <section>
                                                            <label class="input">
                                                                <i class="icon-append fa fa-user"></i>
                                                                <form:input class="form-control" path="email" value="${faccount.email}" />
                                                            </label>
                                                        </section>
                                                    </dd>
                                                </dl>
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                <button class="btn-u" type="submit">Enregistrer les modifications</button>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:template_owner>