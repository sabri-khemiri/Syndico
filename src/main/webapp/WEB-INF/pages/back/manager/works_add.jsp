<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<t:template_manager>
    <jsp:attribute name="title">Ajoût petit travaux</jsp:attribute>

    <jsp:attribute name="css">
        <link href="${pageContext.request.contextPath}/resources/theme_2/assets/css/plugins/iCheck/custom.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/theme_2/assets/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
        
        <link href="${pageContext.request.contextPath}/resources/theme_2/assets/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/theme_2/assets/css/plugins/clockpicker/clockpicker.css" rel="stylesheet">


    </jsp:attribute>

    <jsp:attribute name="js">
        <script src="${pageContext.request.contextPath}/resources/theme_2/assets/js/plugins/iCheck/icheck.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/theme_2/assets/js/plugins/clockpicker/clockpicker.js"></script>
        <script src="${pageContext.request.contextPath}/resources/theme_2/assets/js/plugins/datapicker/bootstrap-datepicker.js"></script>

        <script>
            $(document).ready(function () {
                $('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green',
                });
            $('#data_1 .input-group.date').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                calendarWeeks: true,
                autoclose: true,
            });
            
            $('#data_2 .input-group.date').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                calendarWeeks: true,
                autoclose: true,
            });



            });
        </script>
    </jsp:attribute>

    <jsp:body>
 <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>Ajoût Petit Travaux</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${pageContext.request.contextPath}/manager">Accueil</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/manager/co_ownership">Copropriété</a>
                    </li>
                    <li class="active">
                        <strong>Ajoût Petit Travaux</strong>
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
                            <h5>Création de petit travaux</h5>
                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <div class="col-lg-offset-1 col-lg-10">
                                    <form:form role="form"  action="" commandName="works" method="POST" class="">  
                                        <div class="form-group"><label class="control-label">Titre</label><span class="text-danger">*</span>
                                            <div class=""><form:input class="form-control" path="title" /></div>
                                        </div>
                                        <div class="form-group" id="data_1">
                                            <label class="control-label">Date Debut</label><span class="text-danger">*</span>
                                            <div class="input-group date">
                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span><form:input path="startDate" type="text" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group" id="data_2">
                                            <label class="control-label">Date de fin</label>
                                            <div class="input-group date">
                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span><form:input path="endDate" type="text" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group"><label class="control-label">Description</label><span class="text-danger">*</span>
                                            <div class=""><form:textarea class="form-control" rows="10" path="contents" /></div>
                                        </div>
                                        <div class="form-group"><label class="control-label">Prix</label>
                                            <div class=""><form:input class="form-control" path="cost" /></div>
                                        </div>
                                        <div>
                                            <button class="btn btn-sm btn-primary pull-right m-t-n-xs" type="submit"><strong>Valider</strong></button>
                                        </div>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <input type="hidden" name="id" value="${works.id}"/>
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
</t:template_manager>