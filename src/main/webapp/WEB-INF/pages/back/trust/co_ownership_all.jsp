<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<t:template_trust>
    <jsp:attribute name="title">Copropriétés</jsp:attribute>

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
            });
        </script>
    </jsp:attribute>

    <jsp:body>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>Copropriétés</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${pageContext.request.contextPath}/trust">Accueil</a>
                    </li>
                    <li class="active">
                        <strong>Copropriétés</strong>
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
                            <h5>Copropriétés</h5>
                        </div>
                        <div class="ibox-content">
                            <span class="row">
                                <a href="${pageContext.request.contextPath}/trust/co_ownership/add">
                                    <button class="btn btn-success btn-outline pull-right"><i class="fa fa-plus"></i> Nouvelle copropriété</button>
                                </a>
                            </span>
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover dataCoOwnership" >
                                    <thead>
                                        <tr>
                                            <th>Nom</th>
                                            <th>Adresse</th>
                                            <th>Date</th>
                                            <th>Nb gestionaire</th>
                                            <th>Copropriétaire</th>
                                            <th>Option</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="coOwnership" items="${trust.coOwnerships}">
                                            <tr class="gradeX">
                                                <td>${coOwnership.name}</td>
                                                <td>${coOwnership.address}</td>
                                                <td>${coOwnership.creationDate}</td>
                                                <td class="center">${fn:length(coOwnership.managers)}</td>
                                                <td class="center">${fn:length(coOwnership.owners)}</td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/trust/co_ownership/view/${coOwnership.id}"><i class="fa fa-eye"></i></a>
                                                    <a href="${pageContext.request.contextPath}/trust/co_ownership/update/${coOwnership.id}"><i class="fa fa-edit"></i></a>
                                                    <a href="${pageContext.request.contextPath}/trust/co_ownership/delete/${coOwnership.id}"><i class="fa fa-trash"></i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Nom</th>
                                            <th>Adresse</th>
                                            <th>Date</th>
                                            <th>Nb gestionaire</th>
                                            <th>Copropriétaire</th>
                                            <th>Option</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <span class="row">
                                <a href="${pageContext.request.contextPath}/trust/co_ownership/add">
                                    <button class="btn btn-success btn-outline pull-right"><i class="fa fa-plus"></i> Nouvelle copropriété</button>
                                </a>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:template_trust>