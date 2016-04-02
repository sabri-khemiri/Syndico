<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<t:template_owner>
    <jsp:body>


        <!--=== Breadcrumbs ===-->
        <div class="breadcrumbs">
            <div class="container">
                <h1 class="pull-left">Ajout d'une resolution</h1>
                <ul class="pull-right breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/owner">Accueil</a></li>
                    <li class="active">Ajout resolution</li>
                </ul>
            </div>
        </div><!--/breadcrumbs-->
        <!--=== End Breadcrumbs ===-->

        <div class="container content">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <!-- General Unify Forms -->
                    <form:form role="form"  action="" commandName="resolution" method="POST"  class="sky-form">
                        <header>Ajout d'une resolution</header>
                        <fieldset>
                            <section>
                                <label class="label">Titre</label>
                                <label class="input">
                                    <form:input type="text" path="title" value="${resolution.title}" />
                                </label>
                            </section>
                            <section>
                                <label class="label">Contenu</label>
                                <label class="textarea ">
                                    <form:textarea class="form-control" rows="5" path="contents" value="${resolution.contents}"  />
                                </label>
                            </section>
                            <button type="submit" class="btn-u">Envoyer</button>
                        </fieldset>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form:form>
                </div>
            </div>
        </div>
    </jsp:body>
</t:template_owner>