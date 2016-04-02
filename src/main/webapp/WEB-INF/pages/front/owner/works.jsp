<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<t:template_owner>
    <jsp:body>


        <div class="breadcrumbs-v1" style="background-image: url('${pageContext.request.contextPath}/resources/images/login/login_bg_2.jpg')">
            <div class="container">
                <span>Travaux</span>
            </div>
        </div>

        <div class="container content">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Titre</th> 
                                <th>Date Debut</th>       
                                <th>Date Fin</th>        
                                <th>Option</th>       
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="work" items="${account.coOwnership.works}">
                                    <tr>
                                        <td>${work.title}</td>
                                        <td>${work.startDate}</td>
                                        <td>${work.endDate}</td>
                                        <td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
                                    </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </jsp:body>
</t:template_owner>