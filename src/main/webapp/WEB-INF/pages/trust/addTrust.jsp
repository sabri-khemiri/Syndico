<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Create Trust</title>
    </head>
    <body>
        <h1>Create Trust</h1>
        <c:if test="${not empty errors}">${errors}</c:if>
        <form:form action="subCreateTrust" commandName="trust" method="POST">  
            <label>Name</label><form:input path="name" />  <br /> 
            <label>Adress</label><form:input path="address" />  <br /> 
            <label>Email</label><form:input path="email" />  <br /> 
            <label>Phone</label><form:input path="phone" />  <br /> 
            <input type="submit" value="Save" />  
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form:form>  
    </body>
</html>
