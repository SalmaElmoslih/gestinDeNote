<%@page import="modele.Enseignant" %>
<%@page import="java.util.List"%>

<%   
Enseignant Enseignant = (Enseignant)request.getAttribute("Enseignant");
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="style.css" rel="stylesheet"/>
    <title>Modifier</title>
</head>
<body>

    <c:import url="menuAdmin.jsp">
		<c:param name="titre" value="Modifier un enseignant"/>
	</c:import>
    
    <div class="container">
        <form action="admin?action=modifier_enseignant" method="post">
            <input type="hidden" name="id_M" value="<%= Enseignant.getCIN() %>">
            
            <fieldset>
                <legend>Enseignant :</legend>
                <div class="form-group row">
                    <label for="nom" class="col-sm-2 col-form-label">Nom :</label>
                    <div class="col-sm-10">
                        <input name="nom" type="text" class="form-control" value="<%= Enseignant.getNom() %>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="prenom" class="col-sm-2 col-form-label">Prénom :</label>
                    <div class="col-sm-10">
                        <input name="prenom" type="text" class="form-control" value="<%= Enseignant.getPrenom() %>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="age" class="col-sm-2 col-form-label">Âge :</label>
                    <div class="col-sm-10">
                        <input name="age" type="text" class="form-control" value="<%= Enseignant.getAge() %>">
                    </div>
                </div>
            </fieldset>
            
            <fieldset>
                <legend>Compte :</legend>
                <div class="form-group row">
                    <label for="email" class="col-sm-2 col-form-label">Email :</label>
                    <div class="col-sm-10">
                        <input name="email" type="text" class="form-control" value="<%= Enseignant.getEmail() %>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="mdps" class="col-sm-2 col-form-label">Mot de passe :</label>
                    <div class="col-sm-10">
                        <input name="mdps" type="text" class="form-control" value="<%= Enseignant.getPassword() %>">
                    </div>
                </div>
            </fieldset>
            
            <div class="form-group row">
                <div class="col-sm-10 offset-sm-2">
                    <input type="submit" value="Modifier" class="btn btn-primary">
                </div>
            </div>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
