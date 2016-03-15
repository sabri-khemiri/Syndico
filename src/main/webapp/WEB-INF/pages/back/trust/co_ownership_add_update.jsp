<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<t:template_trust>
    <jsp:attribute name="title">Ajout Copropriété</jsp:attribute>

    <jsp:attribute name="css">
        <link href="${pageContext.request.contextPath}/resources/theme_2/assets/css/plugins/iCheck/custom.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/theme_2/assets/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    </jsp:attribute>

    <jsp:attribute name="js">
        <script src="${pageContext.request.contextPath}/resources/theme_2/assets/js/plugins/iCheck/icheck.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green',
                });
            });
        </script>
    </jsp:attribute>

    <jsp:body>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>Ajout d'une nouvelle copropriété</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${pageContext.request.contextPath}/trust">Accueil</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/trust/co_ownership/all">Copropriétés</a>
                    </li>
                    <li class="active">
                        <strong>Ajout copropriété</strong>
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
                            <h5>Création d'une nouvelle copropriété</h5>
                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <div class="col-lg-offset-1 col-lg-10">
                                    <form:form role="form"  action="" commandName="coOwnership" method="POST" class="">  
                                        <div class="form-group"><label class="control-label">Nom <span class="text-danger">*</span></label> <small class="text-danger"><form:errors path="name"/></small>
                                            <div class="${errors.hasFieldErrors('name') ? 'has-error' : ''}"><form:input class="form-control" path="name" value="${coOwnership.name}" /></div>
                                        </div>
                                        <div class="form-group"><label class="control-label">Adresse <span class="text-danger">*</span></label> <small class="text-danger"><form:errors path="address"/></small>
                                            <div class="${errors.hasFieldErrors('address') ? 'has-error' : ''}"><form:input class="form-control" path="address" value="${coOwnership.address}" /></div>
                                        </div>
                                        <div class="form-group"><label class="control-label">Description</label>
                                            <div class=""><form:textarea class="form-control" rows="10" path="description" value="${coOwnership.description}"  /></div>
                                        </div>
                                        <div>
                                            <button class="btn btn-sm btn-primary pull-right m-t-n-xs" type="submit"><strong>Valider</strong></button>
                                        </div>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <input type="hidden" name="id" value="${coOwnership.id}"/>
                                    </form:form>
                                    <p class="">(<span class="text-danger">*</span>)Champ obligatoire</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:template_trust>