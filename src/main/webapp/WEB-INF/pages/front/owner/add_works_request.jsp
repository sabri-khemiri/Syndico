<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<t:template_owner>
    <jsp:body>
        <div class="breadcrumbs-v1" style="background-image: url('${pageContext.request.contextPath}/resources/images/owner/works.jpg')">
            <div class="container">
                <span>Deamande Travaux</span>
            </div>
        </div>

        <div class="container content">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <!-- General Unify Forms -->
                    <form:form role="form"  action="" commandName="worksRequest" method="POST"  class="sky-form">
                        <header><spring:message code="Oawr.insertNewAd"/></header>
                        <fieldset>
                            <section>
                                <label class="label"><spring:message code="Oawr.title"/><label>
                                <label class="input">
                                    <form:input type="text" path="title" value="${worksRequest.title}" />
                                </label>
                            </section>
                            <section>
                                <label class="label"><spring:message code="Oawr.text"/></label>
                                <label class="textarea ">
                                    <form:textarea class="form-control" rows="5" path="contents" value="${news.contents}"  />
                                </label>
                            </section>
                            <button type="submit" class="btn-u"><spring:message code="Oawr.send"/></button>
                        </fieldset>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form:form>
                </div>
            </div>
        </div>
    </jsp:body>
</t:template_owner>