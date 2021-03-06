<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:template_trust>
    <jsp:attribute name="title">Profil</jsp:attribute>
    
    <jsp:body>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2> <spring:message code="Tp.title"/> ${account.firstName} ${account.lastName}</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${pageContext.request.contextPath}/trust"><spring:message code="Tp.home"/></a>
                    </li>
                    <li class="active">
                        <strong><spring:message code="Tp.profile"/></strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2"></div>
        </div>

        <div class="wrapper wrapper-content animated fadeInDown">
            <div class="row">
                <div class="col-lg-4">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5><spring:message code="Tp.detail"/></h5>
                        </div>
                        <div>
                            <div class="ibox-content no-padding border-left-right">
                                <img alt="image" class="img-responsive" src="${pageContext.request.contextPath}/resources/images/user/${account.id}${account.image}">
                            </div>
                            <div class="ibox-content profile-content">
                                <h4><strong>${account.username}</strong></h4> 
                                <ul class="list-group clear-list">
                                    <li class="list-group-item fist-item">
                                        <span class="pull-right"> ${account.firstName} </span>
                                        <spring:message code="Tp.firstName"/>
                                    </li>
                                    <li class="list-group-item fist-item">
                                        <span class="pull-right"> ${account.lastName} </span>
                                        <spring:message code="Tp.name"/>
                                    </li>
                                    <li class="list-group-item fist-item">
                                        <span class="pull-right"> ${account.email} </span>
                                        <spring:message code="Tp.mail"/>
                                    </li>
                                    <li class="list-group-item fist-item">
                                        <span class="pull-right"> ${account.trust.name} </span>
                                        <spring:message code="Tp.syndic"/>
                                    </li>
                                    <li class="list-group-item fist-item">
                                        <span class="pull-right"> ${account.creationDate} </span>
                                        <spring:message code="Tp.create"/>
                                    </li>
                                </ul>
                                <span class="small text-center"><a href="${pageContext.request.contextPath}/trust/profil/image/">Modifier image</a></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tabs-container col-lg-8">
                    <form:form role="form"  action="" commandName="faccount" method="POST" class="">  
                        <div class="form-group"><label class="control-label"> <spring:message code="Tp.name"/></label> <small class="text-danger"><form:errors path="lastName"/></small>
                            <div class="${errors.hasFieldErrors('lastName') ? 'has-error' : ''}"><form:input class="form-control" path="lastName" value="${faccount.lastName}" /></div>
                        </div>
                        <div class="form-group"><label class="control-label"> <spring:message code="Tp.firstName"/></label> <small class="text-danger"><form:errors path="firstName"/></small>
                            <div class="${errors.hasFieldErrors('firstName') ? 'has-error' : ''}"><form:input class="form-control" path="firstName" value="${faccount.firstName}" /></div>
                        </div>
                        <div class="form-group"><label class="control-label"> <spring:message code="Tp.mail"/></label> <small class="text-danger"><form:errors path="email"/></small>
                            <div class="${errors.hasFieldErrors('email') ? 'has-error' : ''}"><form:input class="form-control" path="email" value="${faccount.email}" /></div>
                        </div>
                        <div>
                            <button class="btn btn-sm btn-primary pull-right m-t-n-xs" type="submit"><strong> <spring:message code="Tp.valid"/></strong></button>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form:form>
                </div>
            </div>
        </div>
    </jsp:body>
</t:template_trust>