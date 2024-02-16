<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@page import="modele.Matiere" %>
<%
    Matiere matiere = (Matiere)request.getAttribute("matiere");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details de la matière ajoutée</title>
<!-- Include Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="style.css" rel="stylesheet"/> <!-- Your custom CSS -->
</head>
<body>
    <c:import url="menuAdmin.jsp">
        <c:param name="titre" value="details de la matière ajoutée"/>
    </c:import>
    
    <div class="container mt-5">
        <table class="table table-bordered">
            <tr>
                <th scope="row">Nom :</th>
                <td><%= matiere.getNom() %></td>
            </tr>
            <tr>
                <th scope="row">Date de contrôle :</th>
                <td><%= matiere.getControlle() %></td>
            </tr>
            <tr>
                <th scope="row">Date de rattrapage :</th>
                <td><%= matiere.getDate_ratt() %></td>
            </tr>
            <tr>
                <th scope="row">Nom de l'enseignant :</th>
                <td><%= matiere.getEnseignant().getNom() %></td>
            </tr>
            <tr>
                <th scope="row">Nom du module :</th>
                <td><%= matiere.getModule().getNom() %></td>
            </tr>
        </table>
    </div>
    
<!-- Include Bootstrap JS at the end of the body to optimize page loading -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
