<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:template_manager>
    <jsp:attribute name="title"><spring:message code="Mwrv.workRequest"/></jsp:attribute>

    <jsp:body>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2><spring:message code="Mwrv.workRequest"/></h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${pageContext.request.contextPath}/manager"><spring:message code="Mwrv.home"/></a>
                    </li>
                    <li class="active">
                        <strong><spring:message code="Mwrv.workRequest"/></strong>
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
                                    <li><a href="${pageContext.request.contextPath}/manager/message"> <i class="fa fa-inbox "></i> <spring:message code="Mwrv.inbox"/> </a></li>
                                    <li><a href=""> <i class="fa fa-envelope-o"></i><spring:message code="Mwrv.msgSend"/></a></li>
                                    <li><a href=""> <i class="fa fa-certificate"></i> <spring:message code="Mwrv.important"/></a></li>
                                    <li><a href="${pageContext.request.contextPath}/manager/works/requests"> <i class="fa fa-legal"></i><spring:message code="Mwrv.workRequest"/></a></li>
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
                            <spring:message code="Mwrv.workRequest"/>x
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
                                <c:forEach var="owner" items="${account.coOwnership.owners}">
                                    <c:forEach var="worksRequest" items="${owner.worksRequests}">
                                        <tr class="read"/>
                                    <td class="mail-ontact"><a href="${pageContext.request.contextPath}/manager/works/requests/view/${worksRequest.id}">${worksRequest.owner.firstName}  ${worksRequest.owner.lastName}</a></td>
                                    <td class="mail-subject"><a href="${pageContext.request.contextPath}/manager/works/requests/view/${worksRequest.id}">${worksRequest.title}</a></td>
                                    <td class="text-right mail-date">${worksRequest.creationDate}</td>
                                    </tr>
                                </c:forEach>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>















    </jsp:body>
</t:template_manager>