<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<t:template_trust>
    <jsp:attribute name="title">Message de ${message.sender.firstName} ${message.sender.lastName}</jsp:attribute>

    <jsp:body>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>Message de ${message.sender.firstName} ${message.sender.lastName}</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${pageContext.request.contextPath}/trust">Accueil</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/trust/message">Message</a>
                    </li>
                    <li class="active">
                        <strong>Message : ${message.subject}</strong>
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
                                <a class="btn btn-block btn-primary compose-mail" href="${pageContext.request.contextPath}/trust/message/new">Nouveau Message</a>
                                <div class="space-25"></div>
                                <h5>Dossier</h5>
                                <ul class="folder-list m-b-md" style="padding: 0">
                                    <li><a href="${pageContext.request.contextPath}/trust/message"> <i class="fa fa-inbox "></i> Inbox</a></li>
                                    <li><a href=""> <i class="fa fa-envelope-o"></i> Message envoyé</a></li>
                                    <li><a href=""> <i class="fa fa-certificate"></i> Important</a></li>
                                    <li><a href="${pageContext.request.contextPath}/trust/message/delete"> <i class="fa fa-trash-o"></i> Corbeille</a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 animated fadeInRight">
                    <div class="mail-box-header">
                        <div class="pull-right tooltip-demo">
                            <a class="btn btn-sm btn-white" href="${pageContext.request.contextPath}/trust/message/new"><i class="fa fa-reply"></i> Répondre</a>
                            <a class="btn btn-sm btn-white" href="${pageContext.request.contextPath}/trust/message/delete/${message.id}"><i class="fa fa-trash-o"></i> Corbeille</a>
                        </div>
                        <h2>
                            Message
                        </h2>
                        <div class="mail-tools tooltip-demo m-t-md">
                            <h3>
                                <span class="font-noraml">Objet : </span>${message.subject}
                            </h3>
                            <h5>
                                <span class="pull-right font-noraml">${message.creationDate}</span>
                                <span class="font-noraml">De : </span>${message.sender.firstName} ${message.sender.lastName}
                            </h5>
                        </div>
                    </div>
                    <div class="mail-box">
                        <div class="mail-body">
                            <p>
                                ${message.contents}
                            </p>
                        </div>
                        <div class="mail-body text-right tooltip-demo">
                            <a class="btn btn-sm btn-white" href="${pageContext.request.contextPath}/trust/message/new"><i class="fa fa-reply"></i> Répondre</a>
                            <a class="btn btn-sm btn-white" href="${pageContext.request.contextPath}/trust/message/delete/${message.id}"><i class="fa fa-trash-o"></i> Corbeille</a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:template_trust>