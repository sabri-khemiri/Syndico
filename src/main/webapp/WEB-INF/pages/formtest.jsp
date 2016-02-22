<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <form:form action="subform" commandName="trustee" method="POST">  
            <label>Name</label><form:input path="name" />  
            <label>Adress</label><form:input path="address" />  
            <label>Email</label><form:input path="email" />  
            <label>Phone</label><form:input path="phone" />  
            <input type="submit" value="Save" />  
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form:form>  
    </body>
</html>
