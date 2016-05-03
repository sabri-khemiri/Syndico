<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<t:template_trust>
    <jsp:attribute name="title">Modification de l'image du syndic</jsp:attribute>

    <jsp:body>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>Image du syndic</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${pageContext.request.contextPath}/trust">Accueil</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/trust/syndic/profil">Profil</a>
                    </li>
                    <li class="active">
                        <strong>Modification de l'image du syndic</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">
            </div>
        </div>

        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>Modification de l'image du syndic</h5>
                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <div class="col-lg-offset-1 col-lg-10">
                                    <form method="POST" action="${pageContext.request.contextPath}/trust/syndic/profil/image/upload?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
                                        <div class="form-group"><label class="control-label">Sélection de la nouvelle image</label><span class="text-danger">*</span>

                                            <div><input type="file" class="form-control" name="fileUpload" /></div>
                                        </div>
                                        <div>
                                            <button class="btn btn-sm btn-primary pull-right m-t-n-xs" type="submit"><strong>Valider</strong></button>
                                        </div>                                        
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:template_trust>