<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<t:template_manager>
     <jsp:attribute name="title">Nouveau Message</jsp:attribute>

    <jsp:body>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>Nouveau Message</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${pageContext.request.contextPath}/manager">Accueil</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/manager/message">Message</a>
                    </li>
                    <li class="active">
                        <strong>Nouveau Message</strong>
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
                                <a class="btn btn-block btn-primary compose-mail" href="${pageContext.request.contextPath}/manager/message/new">Nouveau Message</a>
                                <div class="space-25"></div>
                                <h5>Dossier</h5>
                                <ul class="folder-list m-b-md" style="padding: 0">
                                    <li><a href="${pageContext.request.contextPath}/manager/message"> <i class="fa fa-inbox "></i> Inbox <span class="label label-warning pull-right">${fn:length(account.messageReceived)}</span> </a></li>
                                    <li><a href=""> <i class="fa fa-envelope-o"></i> Message envoyé</a></li>
                                    <li><a href=""> <i class="fa fa-certificate"></i> Important</a></li>
                                    <li><a href=""> <i class="fa fa-trash-o"></i> Poubelle</a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 animated fadeInRight">
                    <div class="mail-box-header">
                        <h2>
                            Nouveau Message
                        </h2>
                    </div>
                    <div class="mail-box">
                        <div class="mail-body">
                            <form:form role="form" class="form-horizontal" commandName="message" method="POST">
                                <div class="form-group"><label class="col-sm-2 control-label">À :</label>
                                    <div class="col-sm-10"><form:select path="recipient.id" items="${list}" class="form-control">  </form:select></div>
                                    </div>
                                    <div class="form-group"><label class="col-sm-2 control-label">Objet :</label>
                                        <div class="col-sm-10"><form:input type="text" path="subject" class="form-control" /></div>
                                </div>
                                <div class="form-group"><label class="col-sm-2 control-label">Contenue :</label>
                                    <div class="col-sm-10 "><form:textarea rows="10" type="text" path="contents" class="form-control" /></div>
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button type="submit" class="btn-success">Envoyer</button>
                            </form:form>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:template_manager>