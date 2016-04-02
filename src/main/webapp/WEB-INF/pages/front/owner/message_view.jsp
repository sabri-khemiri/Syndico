<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<t:template_owner>
   <jsp:attribute name="title"><spring:message code="Oview.new"/></jsp:attribute>

    <jsp:body>
        <div class="breadcrumbs-v1" style="background-image: url('${pageContext.request.contextPath}/resources/images/owner/6.jpg')">
            <div class="container">
                <span><spring:message code="Oview.title"/></span>
                <h1><spring:message code="Oview.ownerShip"/> ${coOwnership.name}</h1>
            </div>
        </div>
            <br/>
        

       <div class="wrapper wrapper-content">
            <div class="row">
              <div class="col-lg-1">
                                   
                </div> 
                
 <div class="col-lg-10 animated fadeInRight">
                    <div class="ibox float-e-margins"> 
                        <div class="ibox-content mailbox-content">
                              <ul class="nav nav-pills" >
                                  <li class="list-group-active">
                                      <a class="btn btn-block btn-primary " href="${pageContext.request.contextPath}/owner/message/new" >
                                          <i class="fa fa-comments"></i> <spring:message code="Oview.newMsg"/>
                                      </a>
                                  </li>
                                  <li class="list-group">
                                      <a href="${pageContext.request.contextPath}/owner/message">
                                          <i class="fa fa-inbox "></i> <spring:message code="Oview.inbox"/> 
                                          <span class="label label-warning pull-right">${fn:length(account.messageReceived)}</span>
                                      </a>
                                  </li>
                                  <li class="list-group">
                                      <a href="#">
                                          <i class="fa fa-envelope-o"></i> <spring:message code="Oview.msgSend"/>
                                      </a>
                                  </li>
                                  <li class="list-group">
                                      <a href="#">
                                          <i class="fa fa-trash-o"></i> <spring:message code="Oview.trash"/>
                                      </a>
                                  </li>
                              </ul>
                         </div>
                    </div> 
                             
                    <div class="mail-box-header">
                        <div class="pull-right tooltip-demo">
                            <a class="btn btn-sm btn-white" href=""><i class="fa fa-reply"></i> <spring:message code="Oview.answer"/></a>
                            <button title="" data-placement="top" data-toggle="tooltip" data-original-title="Trash" class="btn btn-sm btn-white"><i class="fa fa-trash-o"></i><spring:message code="Oview.delete"/></button>
                        </div>
                        <h2>
                            <spring:message code="Oview.message"/>
                        </h2>
                        <div class="mail-tools tooltip-demo m-t-md">
                            <h3>
                                <span class="font-noraml"><u><spring:message code="Oview.object"/></u> </span>${message.subject}
                            </h3>
                            <h5>
                                <span class="pull-right font-noraml">${message.creationDate}</span>
                                <span class="font-noraml"><u><spring:message code="Oview.de"/></u></span>${message.sender.firstName} ${message.sender.lastName}
                            </h5>
                        </div>
                    </div>
                    <div class="mail-box">
                        <div class="mail-body">
                            <p>
                                ${message.contents}
                            </p>
                        </div>
                        <div class="mail-body text-right tooltip-demo">
                            <a class="btn btn-sm btn-white" href=""><i class="fa fa-reply"></i> <spring:message code="Oview.answer"/></a>
                            <button title="" data-placement="top" data-toggle="tooltip" data-original-title="Trash" class="btn btn-sm btn-white"><i class="fa fa-trash-o"></i><spring:message code="Oview.delete"/></button>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:template_owner>