<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:template_manager>
    <jsp:body>
        <div class="row  border-bottom white-bg dashboard-header">
            <h2><spring:message code="manager.welcome"/> ${account.firstName} ${account.lastName}</h2>
        </div>
        <div class="row">
            <div class="col-lg-3 col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-success pull-right"><spring:message code="manager.monthly"/></span>
                        <h5><spring:message code="manager.requete"/></h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><spring:message code="manager.201"/></h1>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-success pull-right"><spring:message code="manager.monthly"/></span>
                        <h5><spring:message code="manager.requete"/></h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><spring:message code="manager.201"/></h1>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-success pull-right"><spring:message code="manager.monthly"/></span>
                        <h5><spring:message code="manager.requete"/></h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><spring:message code="manager.201"/></h1>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-success pull-right"><spring:message code="manager.monthly"/></span>
                        <h5><spring:message code="manager.requete"/></h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><spring:message code="manager.201"/></h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-5 col-lg-offset-1 col-md-6 col-sm-6 ">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><spring:message code="manager.meeting"/></h5>
                    </div>
                    <div class="ibox-content">
                        <div class="feed-element">
                            <img alt="image" class="img-circle pull-left" src="<c:url value="resources/images/co_ownership/test.jpg" />">
                            <div class="media-body ">
                                <small class="pull-right">5m ago</small>
                                <strong>Monica Smith</strong> posted a new blog. <br>
                                <small class="text-muted">Today 5:60 pm - 12.06.2014</small>
                            </div>
                        </div>
                        <div class="feed-element">
                            <img alt="image" class="img-circle pull-left" src="<c:url value="resources/images/co_ownership/test.jpg" />">
                            <div class="media-body ">
                                <small class="pull-right">5m ago</small>
                                <strong>Monica Smith</strong> posted a new blog. <br>
                                <small class="text-muted">Today 5:60 pm - 12.06.2014</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-5 col-md-6 col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><spring:message code="manager.message"/></h5>
                    </div>
                    <div class="ibox-content ibox-heading">
                        <h3><i class="fa fa-envelope-o"></i> New messages</h3>
                        <small><i class="fa fa-tim"></i> You have 22 new messages and 16 waiting in draft folder.</small>
                    </div>
                    <div class="ibox-content">
                        <div class="feed-activity-list">
                            <div class="feed-element">
                                <div>
                                    <small class="pull-right text-navy">1m ago</small>
                                    <strong>Monica Smith</strong>
                                    <div>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum</div>
                                    <small class="text-muted">Today 5:60 pm - 12.06.2014</small>
                                </div>
                            </div>
                            <div class="feed-element">
                                <div>
                                    <small class="pull-right text-navy">1m ago</small>
                                    <strong>Monica Smith</strong>
                                    <div>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum</div>
                                    <small class="text-muted">Today 5:60 pm - 12.06.2014</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>




















    </jsp:body>
</t:template_manager>