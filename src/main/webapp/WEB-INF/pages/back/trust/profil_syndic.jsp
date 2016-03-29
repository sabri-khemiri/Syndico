<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:template_trust>
    <jsp:attribute name="title">${account.username}</jsp:attribute>

    <jsp:attribute name="css">
        <link href="${pageContext.request.contextPath}/resources/theme_2/assets/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/theme_2/assets/css/plugins/dataTables/dataTables.responsive.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/theme_2/assets/css/plugins/dataTables/dataTables.tableTools.min.css" rel="stylesheet">
    </jsp:attribute>

    <jsp:attribute name="js">
        <script src="${pageContext.request.contextPath}/resources/theme_2/assets/js/plugins/dataTables/jquery.dataTables.js"></script>
        <script src="${pageContext.request.contextPath}/resources/theme_2/assets/js/plugins/dataTables/dataTables.bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/resources/theme_2/assets/js/plugins/dataTables/dataTables.responsive.js"></script>
        <script src="${pageContext.request.contextPath}/resources/theme_2/assets/js/plugins/dataTables/dataTables.tableTools.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/theme_2/assets/js/plugins/pace/pace.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/theme_2/assets/js/plugins/jsKnob/jquery.knob.js"></script>

        <script>
            $(document).ready(function () {
                $('.dataCoOwnership').DataTable({
                    "dom": 'lTfigtp',
                    "tableTools": {
                        "sSwfPath": "${pageContext.request.contextPath}/resources/theme_2/assets/js/plugins/dataTables/swf/copy_csv_xls_pdf.swf"
                    },
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/French.json"
                    }
                });
                $(".dial").knob();
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>Profile Syndic : ${trust.name}</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${pageContext.request.contextPath}/manager">Accueil</a>
                    </li>
                    <li class="active">
                        <strong>Profile Syndic</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">
            </div>
        </div>

        <div class="wrapper wrapper-content animated fadeInDown">
            <div class="row">
                <div class="col-lg-4">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>Détail</h5>
                        </div>
                        <div>
                            <div class="ibox-content no-padding border-left-right">
                                <img alt="image" class="img-responsive" src="${pageContext.request.contextPath}/resources/images/trust/${trust.id}${trust.image}">
                            </div>
                            <div class="ibox-content profile-content">
                                <h4><strong>${account.trust.name}</strong></h4> 
                                <ul class="list-group clear-list">
                                    <li class="list-group-item fist-item">
                                        <span class="pull-right"> ${account.trust.address} </span>
                                        Adresse
                                    </li>
                                    <li class="list-group-item fist-item">
                                        <span class="pull-right"> ${account.trust.email} </span>
                                        Email
                                    </li>
                                    <li class="list-group-item fist-item">
                                        <span class="pull-right"> ${account.trust.phone} </span>
                                        Telephone
                                    </li>
                                    <li class="list-group-item fist-item">
                                        <span class="pull-right"> ${account.trust.fax} </span>
                                        Fax
                                    </li>
                                    <li class="list-group-item fist-item">
                                        <span class="pull-right"> ${account.trust.website} </span>
                                        Site web
                                    </li>
                                    <li class="list-group-item fist-item">
                                        <span class="pull-right"> ${account.trust.description} </span>
                                        Description
                                    </li>
                                    <li class="list-group-item fist-item">
                                        <span class="pull-right"> ${account.trust.legalInfomation} </span>
                                        Infomation Legale
                                    </li>
                                    <li class="list-group-item fist-item">
                                        <span class="pull-right"> ${account.trust.creationDate} </span>
                                        Date de création
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tabs-container col-lg-8">
                    <form:form role="form"  action="" commandName="newTrust" method="POST" class="">  
                        <div class="form-group"><label class="control-label">Nom</label> <small class="text-danger"><form:errors path="name"/></small>
                            <div class="${errors.hasFieldErrors('name') ? 'has-error' : ''}"><form:input class="form-control" path="name" value="${trust.name}" /></div>
                        </div>
                        <div class="form-group"><label class="control-label">Email</label> <small class="text-danger"><form:errors path="email"/></small>
                            <div class="${errors.hasFieldErrors('email') ? 'has-error' : ''}"><form:input class="form-control" path="email" value="${trust.email}" /></div>
                        </div>
                        <div class="form-group"><label class="control-label">Adresse</label> <small class="text-danger"><form:errors path="address"/></small>
                            <div class="${errors.hasFieldErrors('address') ? 'has-error' : ''}"><form:input class="form-control" path="address" value="${trust.address}" /></div>
                        </div>
                        <div class="form-group"><label class="control-label">Telephone</label>
                            <div class=""><form:input class="form-control" path="phone" value="${trust.phone}" /></div>
                        </div>
                        <div class="form-group"><label class="control-label">Fax</label>
                            <div class=""><form:input class="form-control" path="fax" value="${trust.fax}" /></div>
                        </div>
                        <div class="form-group"><label class="control-label">Site web</label>
                            <div class=""><form:input class="form-control" path="website" value="${trust.website}" /></div>
                        </div>
                        <div class="form-group"><label class="control-label">Description</label>
                            <div class=""><form:textarea class="form-control" path="description" value="${trust.description}" /></div>
                        </div>
                        <div class="form-group"><label class="control-label">Information legal</label>
                            <div class=""><form:textarea class="form-control" path="legalInfomation" value="${trust.legalInfomation}" /></div>
                        </div>
                        <div>
                            <button class="btn btn-sm btn-primary pull-right m-t-n-xs" type="submit"><strong>Valider</strong></button>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form:form>
                </div>
            </div>
        </div>
    </jsp:body>
</t:template_trust>