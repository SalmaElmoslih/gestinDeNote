<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@page import="modele.etudiant" %>
<%
    etudiant etd = (etudiant)request.getAttribute("etd");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details de l'etudiant ajouté</title>
<!-- Include Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="style.css" rel="stylesheet"/> <!-- Your custom CSS -->
</head>
<body>
    <c:import url="menuAdmin.jsp">
        <c:param name="titre" value="details de l'etudiant ajouté"/>
    </c:import>
    
    <div class="container mt-5">
        <table class="table table-bordered">
            <tr>
                <th scope="row">Nom :</th>
                <td><%= etd.getNom() %></td>
            </tr>
            <tr>
                <th scope="row">Prenom :</th>
                <td><%= etd.getPrenom() %></td>
            </tr>
            <tr>
                <th scope="row">CIN :</th>
                <td><%= etd.getCIN() %></td>
            </tr>
            <tr>
                <th scope="row">CNE :</th>
                <td><%= etd.getCNE() %></td>
            </tr>
            <tr>
                <th scope="row">Age :</th>
                <td><%= etd.getAge() %></td>
            </tr>
            <tr>
                <th scope="row">Email :</th>
                <td><%= etd.getEmail() %></td>
            </tr>
            <tr>
                <th scope="row">Mot de passe :</th>
                <td><%= etd.getPassword() %></td>
            </tr>
        </table>
    </div>
    
<!-- Include Bootstrap JS at the end of the body to optimize page loading -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
