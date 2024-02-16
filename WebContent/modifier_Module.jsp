<%@page import="modele.Modules" %>
<%@page import="java.util.List"%>

<%   
    Modules mod = (Modules)request.getAttribute("mod");
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <title>Modifier un module</title>
</head>
<body>

<div class="container">
    <jsp:include page="menuAdmin.jsp">
        <jsp:param name="titre" value="Modifier un module"/>
    </jsp:include>

    <form action="admin?action=modifier_Module" method="post">
        <input type="hidden" name="id_M" value="<%= mod.getId() %>">
        
        <fieldset>
            <legend>Module :</legend>
            <div class="form-group row">
                <label for="nom" class="col-sm-2 col-form-label">Nom :</label>
                <div class="col-sm-10">
                    <input name="nom" type="text" class="form-control" value="<%= mod.getNom() %>">
                </div>
            </div>
           
            <div class="form-group row">
                <div class="offset-sm-2 col-sm-10">
                    <input type="submit" value="Modifier" class="btn btn-primary">
                </div>
            </div>
        </fieldset>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
