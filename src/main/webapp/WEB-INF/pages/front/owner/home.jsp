<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:template_owner>
    <jsp:body>
        <div class="breadcrumbs-v1" style="background-image: url('${pageContext.request.contextPath}/resources/images/login/login_bg_2.jpg')">
            <div class="container">
                <span><spring:message code="owner.welcome"/></span>
                <h1><spring:message code="owner.ownerShip"/> ${coOwnership.name}</h1>
            </div>
        </div>
        <div class="container content-md">
            <c:forEach var="news" items="${coOwnership.news}">

                <div class="row margin-bottom-20">
                    <div class="col-sm-5 sm-margin-bottom-20">
                        <img class="img-responsive img-bordered" src="${pageContext.request.contextPath}/resources/images/news/${news.image}" alt="">
                    </div>
                    <div class="col-sm-7">
                        <div class="news-v3">
                            <ul class="list-inline posted-info">
                                <li><spring:message code="owner.by"/> ${news.account.firstName} ${news.account.lastName} <spring:message code="owner.slash"/> ${news.creationDate}</li>
                            </ul>
                            <h2><a href="#">${news.title}</a></h2>
                            <p>${news.contents}</p>
                            <ul class="post-shares">
                                <li>
                                    <a data-toggle="modal" data-target=".comments${news.id}">
                                        <i class="rounded-x icon-speech"></i>
                                        <span>${fn:length(news.comments)}</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div><!--/end row-->
                <!-- End News v3 -->

                <div class="modal fade comments${news.id}" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                <h4 id="myLargeModalLabel2" class="modal-title"><spring:message code="owner.comm"/></h4>
                            </div>
                            <div class="modal-body">
                                <c:forEach var="comment" items="${news.comments}">
                                    <div class="row blog-comments margin-bottom-30">
                                        <div class="col-sm-2 sm-margin-bottom-40">
                                            <img src="${pageContext.request.contextPath}/resources/images/user/${comment.author.id}${comment.author.image}" alt="">
                                        </div>
                                        <div class="col-sm-10">
                                            <div class="comments-itself">
                                                <h4>
                                                    ${comment.author.firstName} ${comment.author.lastName}
                                                    <span>${comment.creationDate}</span>
                                                </h4>
                                                <p>${comment.contents}</p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <div class="clearfix margin-bottom-20"><hr></div>

                                <div class="row">
                                    <form action="owner/comment/add" method="POST" class="sky-form">
                                        <h3 class="col-md-offset-1"><spring:message code="owner.newComm"/></h3>
                                        <fieldset>
                                            <div class='row'>
                                                <textarea class="col-md-10 col-md-offset-1" name="contents" rows="3"></textarea>
                                            </div>
                                            <div class="clearfix margin-bottom-20"></div>
                                            <div class='row text-center'>
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                <input type="hidden" name="idNew" value="${news.id}"/>
                                                <button type="submit" class="btn-u"><spring:message code="owner.send"/></button>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix margin-bottom-20"><hr></div>
                </c:forEach>


            <ul class="pager pager-v3 pager-md no-margin-bottom">
                <li class="previous"><a href="#">&larr; <spring:message code="owner.previous"/></a></li>
                <li class="next"><a href="#"><spring:message code="owner.next"/> &rarr;</a></li>
            </ul>
            <p class="text-center"><a href="${pageContext.request.contextPath}/owner/news/add"><button class="btn-u">Ajouter</button></a></p>
        </div>
    </jsp:body>
</t:template_owner>