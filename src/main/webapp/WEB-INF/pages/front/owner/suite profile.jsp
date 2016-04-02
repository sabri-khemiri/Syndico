 
                            
                            
                            <div class="ibox-content profile-content">
                                <h4><strong>${account.username}</strong></h4> 
                                <ul class="list-group clear-list">
                                    <li class="list-group-item fist-item">
                                        <span class="pull-right"> ${account.firstName} </span>
                                        <spring:message code="Oawr.firstName"/>
                                    </li>
                                    <li class="list-group-item fist-item">
                                        <span class="pull-right"> ${account.lastName} </span>
                                        <spring:message code="Oawr.name"/>
                                    </li>
                                    <li class="list-group-item fist-item">
                                        <span class="pull-right"> ${account.email} </span>
                                        <spring:message code="Oawr.mail"/>
                                    </li>
                                    <li class="list-group-item fist-item">
                                        <span class="pull-right"> ${account.coOwnership.name} </span>
                                        <spring:message code="Oawr.ownerShip"/>
                                    </li>
                                    <li class="list-group-item fist-item">
                                        <span class="pull-right"> ${account.creationDate} </span>
                                        <spring:message code="Oawr.create"/>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tabs-container col-lg-8">
                    <form:form role="form"  action="" commandName="faccount" method="POST" class="">  
                                        <div class="form-group"><label class="control-label"><spring:message code="Oawr.name"/></label> <small class="text-danger"><form:errors path="lastName"/></small>
                                            <div class="${errors.hasFieldErrors('lastName') ? 'has-error' : ''}"><form:input class="form-control" path="lastName" value="${faccount.lastName}" /></div>
                                        </div>
                                        <div class="form-group"><label class="control-label"><spring:message code="Oawr.fistName"/></label> <small class="text-danger"><form:errors path="firstName"/></small>
                                            <div class="${errors.hasFieldErrors('firstName') ? 'has-error' : ''}"><form:input class="form-control" path="firstName" value="${faccount.firstName}" /></div>
                                        </div>
                                        <div class="form-group"><label class="control-label"><spring:message code="Oawr.mail"/></label> <small class="text-danger"><form:errors path="email"/></small>
                                            <div class="${errors.hasFieldErrors('email') ? 'has-error' : ''}"><form:input class="form-control" path="email" value="${faccount.email}" /></div>
                                        </div>
                                        <div>
                                            <button class="btn btn-sm btn-primary pull-right m-t-n-xs" type="submit"><strong><spring:message code="Oawr.valid"/></strong></button>
                                        </div>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <input type="hidden" name="id" value="${coOwnership.id}"/>
                                    </form:form>
                </div>