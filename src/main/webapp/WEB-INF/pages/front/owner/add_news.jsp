<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<t:template_owner2>
    <jsp:body>


        <!--=== Breadcrumbs ===-->
        <div class="breadcrumbs">
            <div class="container">
                <h1 class="pull-left"><spring:message code="Oad.insertNewAd"/></h1>
                <ul class="pull-right breadcrumb">
                    <li><a href="index.html"><spring:message code="Oad.home"/></a></li>
                    <li><a href="">Features</a></li>
                    <li class="active">General Forms</li>
                </ul>
            </div>
        </div><!--/breadcrumbs-->
        <!--=== End Breadcrumbs ===-->

        <div class="container content">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <!-- General Unify Forms -->
                    <form:form role="form"  action="" commandName="news" method="POST"  class="sky-form">
                        <header><spring:message code="Oad.insertNewAd"/></header>
                        <fieldset>
                            <section>
                                <label class="label"><spring:message code="Oad.title"/></label>
                                <label class="input">
                                    <form:input type="text" path="title" value="${news.title}" />
                                </label>
                            </section>
                            <section>
                                <label class="label"><spring:message code="Oad.text"/></label>
                                <label class="textarea ">
                                    <form:textarea class="form-control" rows="5" path="contents" value="${news.contents}"  />
                                </label>
                            </section>
                            <button type="submit" class="btn-u"><spring:message code="Oad.send"/></button>
                        </fieldset>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form:form>
                </div>
            </div>
        </div>
    </jsp:body>
</t:template_owner2>