<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<t:template>
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
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Ajoût d'une nouvelle copropriété</h5>
                    </div>
                    <div class="ibox-content">
                        <div class="row">
                            <form:form role="form"  action="" commandName="coOwnership" method="POST" class="form-horizontal">  
                                <div class="form-group"><label class="control-label">Nom</label>
                                    <div class=""><form:input class="form-control" path="name" /></div>
                                </div>
                                <div class="form-group"><label class="control-label">Adresse</label>
                                    <div class=""><form:input class="form-control" path="address" /></div>
                                </div>
                                <div class="form-group"><label class="control-label">Description</label>
                                    <div class=""><form:textarea class="form-control" rows="10" path="description" /></div>
                                </div>
                                <div>
                                    <button class="btn btn-sm btn-primary pull-right m-t-n-xs" type="submit"><strong>OK</strong></button>
                                    <input type="submit" />
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:template>