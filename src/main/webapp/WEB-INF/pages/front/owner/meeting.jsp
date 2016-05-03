<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:template_owner>
    <jsp:body>



        <div class="breadcrumbs-v1" style="background-image: url('${pageContext.request.contextPath}/resources/images/login/login_bg_2.jpg')">
            <div class="container">
                <span>Bienvenue</span>
                <h1>Copropriété ${coOwnership.name}</h1>
            </div>
        </div>

        <div class="bg-grey">
            <div class="margin-bottom-50"></div>
            <div class="container margin-top-10 margin-bottom-30">
                <div class="row">
                    <c:forEach var="meeting" items="${account.coOwnership.meetings}"  end="0">

                        <div class="col-md-4 col-md-offset-1 md-margin-bottom-30">
                            <h2 class="title-v2"> Dernière assemblee générale</h2>
                            <p>Date : ${meeting.meetingDate}</p>
                            <p>Heures : ${meeting.meetingHours}</p>
                            <a href="${pageContext.request.contextPath}/owner/meeting/resolution/add/${meeting.id}" class="btn-u">Ajout d'une résolution</a>
                            <a data-toggle="modal" data-target=".comments" class="btn-u btn-twitter">Voir les résolutions</a>
                        </div>
                        <div class="col-md-7">
                            <h4 class="title-v2"> Description</h4>
                            <p>${meeting.contents}</p>

                        </div>
                            
                            
                        <div class="modal fade comments" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                        <h4 id="myLargeModalLabel2" class="modal-title">Résolution</h4>
                                    </div>
                                    <div class="modal-body">
                                        <c:forEach var="resolution" items="${meeting.resolutions}">
                                            <div class="row blog-comments margin-bottom-30">
                                                <div class="col-sm-2 sm-margin-bottom-40">
                                                    <img src="${pageContext.request.contextPath}/resources/images/user/${resolution.owner.id}${resolution.owner.image}">
                                                </div>
                                                <div class="col-sm-10">
                                                    <div class="comments-itself">
                                                        <h3>${resolution.title}</h3>
                                                        <h4>
                                                            ${resolution.owner.firstName} ${resolution.owner.lastName}
                                                            <span>${resolution.creationDate}</span>
                                                        </h4>
                                                        <p>${resolution.contents}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <div class="clearfix margin-bottom-20"><hr></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div> 




        <div class="container content margin-top-20">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <h1>Ancienne assemblee générale</h1>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Date</th>       
                                <th>Description</th>  
                                <th>Option</th>       
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="meeting" items="${account.coOwnership.meetings}" begin="1">
                                <tr>
                                    <td>${meeting.meetingDate}</td>
                                    <td>${meeting.contents}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/resources/ag/${meeting.id}${meeting.report}">
                                            <span class="label label-blue">Telecharger</span>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>










    </jsp:body>
</t:template_owner>