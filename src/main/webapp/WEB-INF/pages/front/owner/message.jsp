<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:template_owner>
 <jsp:attribute name="title"><spring:message code="Omsg.message"/></jsp:attribute>

    <jsp:body>
        <div class="breadcrumbs-v1" style="background-image: url('${pageContext.request.contextPath}/resources/images/owner/6.jpg')">
            <div class="container">
                <span><spring:message code="Omsg.title"/></span>
                <h1><spring:message code="Omsg.ownerShip"/> ${coOwnership.name}</h1>
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
                              <ul class="nav nav-tabs" >
                                  <li class="list-group-active">
                                      <a class="btn btn-block btn-primary " href="${pageContext.request.contextPath}/owner/message/new" >
                                          <i class="fa fa-comments"></i> <spring:message code="Omsg.newMsg"/>
                                      </a>
                                  </li>
                                  <li class="list-group">
                                      <a href="${pageContext.request.contextPath}/owner/message">
                                          <i class="fa fa-inbox "></i> <spring:message code="Omsg.inbox"/> 
                                          <span class="label label-warning pull-right">${fn:length(account.messageReceived)}</span>
                                      </a>
                                  </li>
                                  <li class="list-group">
                                      <a href="#">
                                          <i class="fa fa-envelope-o"></i> <spring:message code="Omsg.msgSend"/>
                                      </a>
                                  </li>
                                  <li class="list-group">
                                      <a href="#">
                                          <i class="fa fa-trash-o"></i> <spring:message code="Omsg.trash"/>
                                      </a>
                                  </li>
                              </ul>
                                      
                         </div>
                    </div> 
                                      
                    <div class="mail-box-header">
                        <h2>
                            <spring:message code="Omsg.inbox"/>
                        </h2>
                        <div class="mail-tools tooltip-demo m-t-md">
                            <div class="btn-group pull-right">
                                <button class="btn btn-white btn-sm"><i class="fa fa-arrow-left"></i></button>
                                <button class="btn btn-white btn-sm"><i class="fa fa-arrow-right"></i></button>
                            </div>
                            <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Lu"><i class="fa fa-eye"></i> </button>
                            <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Important"><i class="fa fa-exclamation"></i> </button>
                            <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Effacer"><i class="fa fa-trash-o"></i> </button>
                        </div>
                    </div>
                    <div class="mail-box">
                        <table class="table table-hover table-mail">
                            <tbody>
                                <c:forEach var="message" items="${account.messageReceived}">
                                    <tr class="${message.status == "NON_LU" ? "unread" : "read"}"/>
                                <td class="check-mail">
                                    <input type="checkbox" class="i-checks">
                                </td>
                                <td class="mail-ontact"><a href="${pageContext.request.contextPath}/owner/message/view/${message.id}">${message.sender.firstName}  ${message.sender.lastName}</a></td>
                                <td class="mail-subject"><a href="${pageContext.request.contextPath}/owner/message/view/${message.id}">${message.subject}</a></td>
                                <td class="text-right mail-date">${message.creationDate}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:template_owner>