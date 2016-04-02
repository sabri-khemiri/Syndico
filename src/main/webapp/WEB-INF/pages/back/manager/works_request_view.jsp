<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:template_manager>
   <jsp:attribute name="title"><spring:message code="Mwrv.workRequete"/></jsp:attribute>

    <jsp:body>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2><spring:message code="Mwrv.request"/> ${request.owner.firstName} ${request.owner.lastName}</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${pageContext.request.contextPath}/manager"><spring:message code="Mwrv.home"/></a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/manager/works_requests"><spring:message code="Mwrv.demandes"/></a>
                    </li>
                    <li class="active">
                        <strong><spring:message code="Mwrv.demande"/> ${request.title}</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">
            </div>
        </div>

        <div class="wrapper wrapper-content">
            <div class="row">
                <div class="col-lg-3">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content mailbox-content">
                            <div class="file-manager">
                                <a class="btn btn-block btn-primary compose-mail" href="${pageContext.request.contextPath}/manager/message/new"><spring:message code="Mwrv.newMsg"/></a>
                                <div class="space-25"></div>
                                <h5><spring:message code="Mwrv.folder"/></h5>
                                <ul class="folder-list m-b-md" style="padding: 0">
                                    <li><a href="${pageContext.request.contextPath}/manager/message"> <i class="fa fa-inbox "></i> <spring:message code="Mwrv.inbox"/> <span class="label label-warning pull-right">${fn:length(account.messageReceived)}</span> </a></li>
                                    <li><a href=""> <i class="fa fa-envelope-o"></i> <spring:message code="Mwrv.msgSend"/></a></li>
                                    <li><a href=""> <i class="fa fa-certificate"></i> <spring:message code="Mwrv.important"/></a></li>
                                    <li><a href="${pageContext.request.contextPath}/manager/works/requests"> <i class="fa fa-certificate"></i> <spring:message code="Mwrv.workRequest"/></a></li>
                                    <li><a href=""> <i class="fa fa-trash-o"></i> <spring:message code="Mwrv.trash"/></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 animated fadeInRight">
                    <div class="mail-box-header">
                        <div class="pull-right tooltip-demo">
                            <a class="btn btn-sm btn-white" href="${pageContext.request.contextPath}/manager/works/add/${request.id}"><i class="fa fa-reply"></i> <spring:message code="Mwrv.valid"/></a>
                            <a class="btn btn-sm btn-white" href="${pageContext.request.contextPath}/manager/works/refuse/${request.id}"><i class="fa fa-trash-o"></i> <spring:message code="Mwrv.refuse"/></a>
                        </div>
                        <h2>
                            <spring:message code="Mwrv.demandes"/>
                        </h2>
                        <div class="mail-tools tooltip-demo m-t-md">
                            <h3>
                                <span class="font-noraml"><spring:message code="Mwrv.object"/></span>${request.title}
                            </h3>
                            <h5>
                                <span class="pull-right font-noraml">${request.creationDate}</span>
                                <span class="font-noraml"><spring:message code="Mwrv.de"/> </span>${request.owner.firstName} ${request.owner.lastName}
                            </h5>
                        </div>
                    </div>
                    <div class="mail-box">
                        <div class="mail-body">
                            <p>
                                ${request.contents}
                            </p>
                        </div>
                        <div class="mail-body text-right tooltip-demo">
                            <a class="btn btn-sm btn-white" href="${pageContext.request.contextPath}/manager/works/add/${request.id}"><i class="fa fa-reply"></i> <spring:message code="Mwrv.valid"/></a>
                            <a class="btn btn-sm btn-white" href="${pageContext.request.contextPath}/manager/works/refuse/${request.id}"><i class="fa fa-trash-o"></i> <spring:message code="Mwrv.refuse"/></a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:template_manager>