<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:template>
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
                <h2>Copropriété</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="index.html">Home</a>
                    </li>
                    <li>
                        <a>Tables</a>
                    </li>
                    <li class="active">
                        <strong>Data Tables</strong>
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
                            <h5>Copropriété</h5>
                        </div>
                        <div class="ibox-content">
                            <span class="row">
                                <a href="${pageContext.request.contextPath}/trust/add_co_ownership"><button class="btn btn-success btn-outline pull-right"><i class="fa fa-plus"></i> Nouvelle copropriété</button></a>
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
                                                <td class="center">50</td>
                                                <td class="center">50</td>
                                                <td><a><i class="fa fa-edit"></i></a></td>
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
                                <a href="${pageContext.request.contextPath}/trust/add_co_ownership"><button class="btn btn-success btn-outline pull-right"><i class="fa fa-plus"></i> Nouvelle copropriété</button></a>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:template>