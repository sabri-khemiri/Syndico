<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:template_manager>
    <jsp:attribute name="title"><spring:message code="Mmsg.message"/></jsp:attribute>

    <jsp:body>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2><spring:message code="Mmsg.message"/></h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${pageContext.request.contextPath}/manager"><spring:message code="Mmsg.home"/></a>
                    </li>
                    <li class="active">
                        <strong><spring:message code="Mmsg.message"/></strong>
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
                                <a class="btn btn-block btn-primary compose-mail" href="${pageContext.request.contextPath}/manager/message/new"><spring:message code="Mmsg.newMsg"/></a>
                                <div class="space-25"></div>
                                <h5>Dossier</h5>
                                <ul class="folder-list m-b-md" style="padding: 0">
                                    <li><a href="${pageContext.request.contextPath}/manager/message"> <i class="fa fa-inbox "></i> <spring:message code="Mmsg.inbox"/> </a></li>
                                    <li><a href=""> <i class="fa fa-envelope-o"></i> <spring:message code="Mmsg.msgSend"/></a></li>
                                    <li><a href=""> <i class="fa fa-certificate"></i> <spring:message code="Mmsg.important"/></a></li>
                                    <li><a href="${pageContext.request.contextPath}/manager/works/requests"> <i class="fa fa-legal"></i> <spring:message code="Mwrv.workRequest"/></a></li>
                                    <li><a href="${pageContext.request.contextPath}/manager/message/delete"> <i class="fa fa-trash-o"></i> Corbeille</a></li>
                                </ul>

                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 animated fadeInRight">
                    <div class="mail-box-header">
                        <h2>
                            <spring:message code="Mmsg.inbox"/>
                        </h2>
                        <div class="mail-tools tooltip-demo m-t-md">
                            <div class="btn-group pull-right">
                                <button class="btn btn-white btn-sm"><i class="fa fa-arrow-left"></i></button>
                                <button class="btn btn-white btn-sm"><i class="fa fa-arrow-right"></i></button>
                            </div>
                            <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Lu"><i class="fa fa-eye"></i> </button>
                            <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Important"><i class="fa fa-exclamation"></i> </button>
                            <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Effacer"><i class="fa fa-trash-o"></i> </button>
                        </div>
                    </div>
                    <div class="mail-box">
                        <table class="table table-hover table-mail">
                            <tbody>
                                <c:forEach var="message" items="${account.messageReceived}">
                                    <c:if test="${message.status != 'DELETE'}" >
                                        <tr class="${message.status == "NON_LU" ? "unread" : "read"}"/>
                                            <td class="check-mail">
                                                <input type="checkbox" class="i-checks">
                                            </td>
                                            <td class="mail-ontact">
                                                ${message.sender.role == "ROLE_TRUST" ? "Syndic : " : ""}
                                                ${message.sender.role == "ROLE_MANAGER" ? "Gestionnaire : " : ""}
                                                ${message.sender.role == "ROLE_OWNER" ? "Copropriétaire : " : ""}
                                                <a href="${pageContext.request.contextPath}/manager/message/view/${message.id}">
                                                    ${message.sender.firstName}  ${message.sender.lastName}
                                                </a>
                                            </td>                                            <td class="mail-subject"><a href="${pageContext.request.contextPath}/manager/message/view/${message.id}">${message.subject}</a></td>
                                            <td class="text-right mail-date">${message.creationDate}</td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:template_manager>