<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<t:template_manager>
    <jsp:attribute name="title"><spring:message code="Mwork.insertLittleWork"/></jsp:attribute>

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
                <h2></h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${pageContext.request.contextPath}/manager"></a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/manager/co_ownership"></a>
                    </li>
                    <li class="active">
                        <strong>Nouveau travaux majeur</strong>
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
                            <h5>Nouveau travaux majeur</h5>
                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <div class="col-lg-offset-1 col-lg-10">
                                    <form action="/manager/works/major/add/upload?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data" method="POST" class="">  
                                        <div class="form-group"><label class="control-label">Titre</label><span class="text-danger">*</span>
                                            <div class=""><input class="form-control" name="title" /></div>
                                        </div>
                                        <div class="form-group" id="data_1">
                                            <label class="control-label">Date de debut</label><span class="text-danger">*</span>
                                            <div class="input-group date">
                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input name="startDate" type="text" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group" id="data_2">
                                            <label class="control-label">Date de fin</label>
                                            <div class="input-group date">
                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input name="endDate" type="text" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group"><label class="control-label">Description</label><span class="text-danger">*</span>
                                            <div class=""><textarea class="form-control" rows="10" name="contents" ></textarea></div>
                                        </div>
                                            
                                        <div class="form-group"><label class="control-label">Nom Entreprise</label>
                                            <div class=""><input class="form-control" name="companyName" /></div>
                                        </div>                                            
                                        <div class="form-group"><label class="control-label"><spring:message code="Mwork.price"/></label>
                                            <div class=""><input class="form-control" name="cost" /></div>
                                        </div>
                                        <div class="form-group"><label class="control-label">Fichier</label>
                                            <div class=""><input type="file" class="form-control" name="fileUpload" /></div>
                                        </div>
                                        <div>
                                            <button class="btn btn-sm btn-primary pull-right m-t-n-xs" type="submit"><strong><spring:message code="Mwork.valid"/></strong></button>
                                        </div>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    </form>
                                    <p class="">(<span class="text-danger">*</span>)<spring:message code="Mwork.required"/>e</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </jsp:body>
</t:template_manager>