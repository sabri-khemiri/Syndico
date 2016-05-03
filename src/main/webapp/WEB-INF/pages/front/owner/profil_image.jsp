<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<t:template_owner>
    <jsp:body>


        <!--=== Breadcrumbs ===-->
        <div class="breadcrumbs-v1" style="background-image: url('${pageContext.request.contextPath}/resources/images/owner/10.jpg')">
            <div class="container">
                <h1>Modification de l'image profil</h1>
            </div>
        </div>

        <div class="container content">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">

                    <form method="POST" class="sky-form" action="${pageContext.request.contextPath}/owner/profil/image/upload?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
                        <header>Ajout d'une nouvelle image de profil</header>
                        <fieldset>
                            <section>
                                <label class="label">Sélection de la nouvelle image</label>
                                <label class="input">
                                    <input type="file" class="form-control" name="fileUpload" />
                                </label>
                            </section>
                            <button type="submit" class="btn-u">Modifier</button>                                      
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </jsp:body>
</t:template_owner>