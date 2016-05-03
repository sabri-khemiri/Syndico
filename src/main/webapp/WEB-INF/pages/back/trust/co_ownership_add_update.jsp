<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<t:template_trust>
    <jsp:attribute name="title">Ajouter/Modifier une copropriété</jsp:attribute>
    
    <jsp:body>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>Création/Modification d'une nouvelle copropriété</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${pageContext.request.contextPath}/trust"><spring:message code="Toau.home"/></a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/trust/co_ownership/all"><spring:message code="Toau.ownerShip"/></a>
                    </li>
                    <li class="active">
                        <strong>Ajout/Modification d'une nouvelle copropriété</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2"></div>
        </div>

        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>Création/Modification d'une nouvelle copropriété</h5>
                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <div class="col-lg-offset-1 col-lg-10">
                                    <form:form role="form"  action="" commandName="coOwnership" method="POST" class="">  
                                        <div class="form-group"><label class="control-label"><spring:message code="Toau.name"/> <span class="text-danger">*</span></label> <small class="text-danger"><form:errors path="name"/></small>
                                            <div class="${errors.hasFieldErrors('name') ? 'has-error' : ''}"><form:input class="form-control" path="name" value="${coOwnership.name}" /></div>
                                        </div>
                                        <div class="form-group"><label class="control-label"><spring:message code="Toau.adress"/> <span class="text-danger">*</span></label> <small class="text-danger"><form:errors path="address"/></small>
                                            <div class="${errors.hasFieldErrors('address') ? 'has-error' : ''}"><form:input class="form-control" path="address" value="${coOwnership.address}" /></div>
                                        </div>
                                        <div class="form-group"><label class="control-label"><spring:message code="Toau.text"/></label>
                                            <div class=""><form:textarea class="form-control" rows="10" path="description" value="${coOwnership.description}"  /></div>
                                        </div>
                                        <div>
                                            <button class="btn btn-sm btn-primary pull-right m-t-n-xs" type="submit"><strong><spring:message code="Toau.valid"/></strong></button>
                                        </div>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <input type="hidden" name="id" value="${coOwnership.id}"/>
                                    </form:form>
                                    <p class="">(<span class="text-danger">*</span>)<spring:message code="Toau.required"/></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:template_trust>