<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<t:template_trust>
    <jsp:attribute name="title">Nouvelle Annonce</jsp:attribute>

    <jsp:body>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>Nouvelle Annonce</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${pageContext.request.contextPath}/trust">Accueil</a>
                    </li>
                    <li class="active">
                        <strong>Nouvelle Annonce</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">
            </div>
        </div>

        <div class="wrapper wrapper-content">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 animated fadeInRight">
                    <div class="mail-box-header">
                        <h2>
                            Nouvelle Annonce
                        </h2>
                    </div>
                    <div class="mail-box">
                        <div class="mail-body">
                            <form:form role="form" class="form-horizontal" commandName="news" method="POST">
                                <div class="form-group"><label class="col-sm-2 control-label">Titre :</label>
                                    <div class="col-sm-10"><form:input type="text" path="title" class="form-control" /></div>
                                </div>
                                <div class="form-group"><label class="col-sm-2 control-label">Contenu :</label>
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
</t:template_trust>