<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:template_manager>
    <jsp:attribute name="title">Assemblée générale</jsp:attribute>

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
                <h2>Assemblée générale</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${pageContext.request.contextPath}/manager">Accueil</a>
                    </li>
                    <li class="active">
                        <strong>Assemblée générale</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">
            </div>
        </div>

        <div class="wrapper wrapper-content  white-bg animated fadeInDown">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1">
                    <div class="tab-content">
                        <div class="tab-pane active">
                            <div class="panel-body">
                                <span class="row">
                                    <a href="${pageContext.request.contextPath}/manager/meeting/add">
                                        <button class="btn btn-success btn-outline "><i class="fa fa-plus"></i> Nouvelle assemblé générale</button>
                                    </a>
                                </span>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover dataCoOwnership" >
                                        <thead>
                                            <tr>
                                                <th>Date</th>
                                                <th>Description</th>
                                                <th>Résolution</th>
                                                <th>Option</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="meeting" items="${account.coOwnership.meetings}">
                                                <tr class="gradeX">
                                                    <td>${meeting.meetingDate}</td>
                                                    <td>${meeting.contents}</td>
                                                    <td>${fn:length(meeting.resolutions)}</td>
                                                    <td class="text-center">
                                                        <a href="${pageContext.request.contextPath}/manager/meeting/update/${meeting.id}"><i class="fa fa-edit"></i></a>
                                                        <c:if test="${meeting.report != null}">
                                                            <a href="${pageContext.request.contextPath}/resources/ag/${meeting.id}${meeting.report}"><i class="fa fa-download"></i></a>
                                                        </c:if>
                                                        <c:if test="${meeting.report == null}">   
                                                            <a href="${pageContext.request.contextPath}/manager/meeting/close/${meeting.id}"><i class="fa fa-close" style="color:  orange"></i></a>
                                                        </c:if>
                                                        <a href=""><i class="fa fa-trash" style="color: red"></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>Date</th>
                                                <th>Description</th>
                                                <th>Résolution</th>
                                                <th>Option</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <span class="row">
                                    <a href="${pageContext.request.contextPath}/manager/meeting/add">
                                        <button class="btn btn-success btn-outline pull-right"><i class="fa fa-plus"></i> Nouvelle assemblé générale</button>
                                    </a>                                
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:template_manager>