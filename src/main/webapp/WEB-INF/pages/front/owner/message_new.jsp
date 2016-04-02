<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<t:template_owner>
     <jsp:attribute name="title"><spring:message code="Onew.new"/></jsp:attribute>

     
    <jsp:body>
        <div class="breadcrumbs-v1" style="background-image: url('${pageContext.request.contextPath}/resources/images/owner/6.jpg')">
            <div class="container">
                <span><spring:message code="Onew.title"/></span>
                <h1><spring:message code="Onew.ownerShip"/> ${coOwnership.name}</h1>
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
                                          <i class="fa fa-comments"></i> <spring:message code="Onew.newMsg"/>
                                      </a>
                                  </li>
                                  <li class="list-group">
                                      <a href="${pageContext.request.contextPath}/owner/message">
                                          <i class="fa fa-inbox "></i> <spring:message code="Onew.inbox"/> 
                                          <span class="label label-warning pull-right">${fn:length(account.messageReceived)}</span>
                                      </a>
                                  </li>
                                  <li class="list-group">
                                      <a href="#">
                                          <i class="fa fa-envelope-o"></i> <spring:message code="Onew.msgSend"/>
                                      </a>
                                  </li>
                                  <li class="list-group">
                                      <a href="#">
                                          <i class="fa fa-trash-o"></i> <spring:message code="Onew.trash"/>
                                      </a>
                                  </li>
                              </ul>
                         </div>
                    </div> 
   <!-- contact -->                          
            <div  id="sky-form3" class="sky-form"> 
                 <form:form role="form" class="form-horizontal" commandName="message" method="POST">
                    <header><spring:message code="Onew.newMsg"/></header>

                    <fieldset>
                            <div class="row">
                                    <section class="col col-6">
                                            <label class="label"><spring:message code="Onew.a"/></label>
                                            <label class="input">
                                                 <form:select path="recipient.id" items="${list}" class="name">  </form:select>
                                            </label>
                                    </section>
                            </div>

                            <section>
                                    <label class="label"><spring:message code="Onew.object"/></label>
                                    <label class="input">
                                            <i class="icon-append fa fa-tag"></i>
                                            <form:input type="text" path="subject" class="form-control" />
                                    </label>
                            </section>

                            <section>
                                    <label class="label"><spring:message code="Onew.text"/></label>
                                    <label class="textarea">
                                            
                                            <form:textarea rows="5" type="text" path="contents" class="message" />
                                    </label>
                            </section>
                         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button type="submit" class="button"><spring:message code="Onew.send"/></button>
                    </fieldset>
                    </form:form>
                    <br/>
                    <div class="message">
                            <i class="rounded-x fa fa-check"></i>
                            <p>Your message was successfully sent!</p>
                    </div>
           </div> 
    </div>
                    <!-- Contacts -->
            </div>
        </div>
    </jsp:body>
</t:template_owner>
     