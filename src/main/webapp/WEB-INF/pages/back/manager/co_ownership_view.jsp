<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:template_manager>
    <jsp:attribute name="title">${coOwnership.name}</jsp:attribute>

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
                <h2>Copropriété : ${coOwnership.name}</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${pageContext.request.contextPath}/manager">Accueil</a>
                    </li>
                    <li class="active">
                        <strong>Copropriété</strong>
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
                                <img alt="image" class="img-responsive" src="${pageContext.request.contextPath}/resources/images/co_ownership/${coOwnership.id}${coOwnership.image}">
                            </div>
                            <div class="ibox-content profile-content">
                                <h4><strong>${coOwnership.name}</strong></h4>
                                <ul class="list-group clear-list">
                                    <li class="list-group-item fist-item">
                                        <span class="pull-right"> ${coOwnership.address} </span>
                                        Adresse
                                    </li>
                                    <li class="list-group-item fist-item">
                                        <span class="pull-right"> ${coOwnership.creationDate} </span>
                                        Date de création
                                    </li>
                                    <li class="list-group-item fist-item">
                                        Description : <br/><br/>
                                        <span class=""> ${coOwnership.description} </span>

                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tabs-container col-lg-8">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#tab-1"> Copropriétaire</a></li>
                        <li class=""><a data-toggle="tab" href="#tab-2"> Gestionnaire</a></li>
                        <li class=""><a data-toggle="tab" href="#tab-3"> Assemblé Générale</a></li>
                        <li class=""><a data-toggle="tab" href="#tab-4"> Travaux</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane active">
                            <div class="panel-body">
                                <span class="row">
                                    <button class="btn btn-success btn-outline pull-right" data-toggle="modal" data-target="#addowner"><i class="fa fa-plus"></i> Nouvelle copropriétaire</button>
                                </span>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover dataCoOwnership" >
                                        <thead>
                                            <tr>
                                                <th>Identifiant</th>
                                                <th>Prenom</th>
                                                <th>Nom</th>
                                                <th>Email</th>
                                                <th>Date Creation</th>
                                                <th>Etat</th>
                                                <th>Option</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="owner" items="${coOwnership.owners}">
                                                <tr class="gradeX">
                                                    <td>${owner.username}</td>
                                                    <td>${owner.firstName}</td>
                                                    <td>${owner.lastName}</td>
                                                    <td class="center">${owner.email}</td>
                                                    <td class="center">${owner.creationDate}</td>
                                                    <td class="center">${owner.enabled}</td>
                                                    <td>
                                                        <a href=""><i class="fa fa-edit"></i></a>
                                                        <a href=""><i class="fa fa-trash"></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>Identifiant</th>
                                                <th>Prenom</th>
                                                <th>Nom</th>
                                                <th>Email</th>
                                                <th>Date Creation</th>
                                                <th>Etat</th>
                                                <th>Option</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <span class="row">
                                    <button class="btn btn-success btn-outline pull-right" data-toggle="modal" data-target="#addowner"><i class="fa fa-plus"></i> Nouvelle copropriétaire</button>
                                </span>
                                <div class="modal inmodal" id="addowner" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content animated bounceInDown">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fermer</span></button>
                                                <i class="fa fa-building-o modal-icon"></i>
                                                <h4 class="modal-title">Ajoût de nouveau copropriétaire</h4>
                                            </div>
                                            <form action="${pageContext.request.contextPath}/manager/owner/add" method="POST">
                                                <div class="modal-body text-center">
                                                    <label class="control-label">Nombre de nouveau copropriétaire</label><br/>
                                                    <input type="text" name="nbAccount" value="0" class="dial m-r" data-fgColor="#ED5565" data-width="85" data-height="85" data-max="500" />
                                                    <input type="hidden" name="idCownership" value="${coOwnership.id}"/>
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-white" data-dismiss="modal">Fermer</button>
                                                    <button type="submit" class="btn btn-primary">Envoyer</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-2" class="tab-pane">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover dataCoOwnership" >
                                        <thead>
                                            <tr>
                                                <th>Identifiant</th>
                                                <th>Prenom</th>
                                                <th>Nom</th>
                                                <th>Email</th>
                                                <th>Date Creation</th>
                                                <th>Etat</th>
                                                <th>Option</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="manager" items="${coOwnership.managers}">
                                                <tr class="gradeX">
                                                    <td>${manager.username}</td>
                                                    <td>${manager.firstName}</td>
                                                    <td>${manager.lastName}</td>
                                                    <td class="center">${manager.email}</td>
                                                    <td class="center">${manager.creationDate}</td>
                                                    <td class="center">${manager.enabled}</td>
                                                    <td>
                                                        <a href=""><i class="fa fa-edit"></i></a>
                                                        <a href=""><i class="fa fa-trash"></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>Identifiant</th>
                                                <th>Prenom</th>
                                                <th>Nom</th>
                                                <th>Email</th>
                                                <th>Date Creation</th>
                                                <th>Etat</th>
                                                <th>Option</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div id="tab-3" class="tab-pane">
                            <div class="panel-body">
                                <span class="row">
                                    <a href="${pageContext.request.contextPath}/manager/meeting/add">
                                        <button class="btn btn-success btn-outline pull-right"><i class="fa fa-plus"></i> Nouvelle assemblé générale</button>
                                    </a>
                                </span>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover dataCoOwnership" >
                                        <thead>
                                            <tr>
                                                <th>Date</th>
                                                <th>Description</th>
                                                <th>Fichier</th>
                                                <th>Résolution</th>
                                                <th>Etat</th>
                                                <th>Option</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="meeting" items="${coOwnership.meetings}">
                                                <tr class="gradeX">
                                                    <td>${meeting.meetingDate}</td>
                                                    <td>${meeting.contents}</td>
                                                    <td>${meeting.report}</td>
                                                    <td class="center">${fn:length(meeting.resolutions)}</td>
                                                    <td>En cours</td>
                                                    <td>
                                                        <a><i class="fa fa-edit"></i></a>
                                                        <a><i class="fa fa-trash"></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>Date</th>
                                                <th>Description</th>
                                                <th>Fichier</th>
                                                <th>Résolution</th>
                                                <th>Etat</th>
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
                        <div id="tab-4" class="tab-pane">
                            <div class="panel-body">
                                <span class="row">
                                    <a href="${pageContext.request.contextPath}/manager/works/add">
                                        <button class="btn btn-success btn-outline pull-right" ><i class="fa fa-plus"></i> Nouveaux travaux</button>
                                    </a>
                                </span>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover dataCoOwnership" >
                                        <thead>
                                            <tr>
                                                <th>Date Debut</th>
                                                <th>Date Fin</th>
                                                <th>Type</th>
                                                <th>Titre</th>
                                                <th>Description</th>
                                                <th>Etat</th>
                                                <th>Option</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="work" items="${coOwnership.works}">
                                                <tr class="gradeX">
                                                    <td>${work.startDate}</td>
                                                    <td>${work.endDate}</td>
                                                    <td>Petit</td>
                                                    <td>${work.title}</td>
                                                    <td>${work.contents}</td>
                                                    <td>En cours</td>
                                                    <td>
                                                        <a><i class="fa fa-edit"></i></a>
                                                        <a><i class="fa fa-trash"></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>Date</th>
                                                <th>Description</th>
                                                <th>Fichier</th>
                                                <th>Résolution</th>
                                                <th>Etat</th>
                                                <th>Option</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <span class="row">
                                    <a href="${pageContext.request.contextPath}/manager/works/add">
                                        <button class="btn btn-success btn-outline pull-right"><i class="fa fa-plus"></i> Nouveau travaux</button>
                                    </a>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </jsp:body>
        </t:template_manager>