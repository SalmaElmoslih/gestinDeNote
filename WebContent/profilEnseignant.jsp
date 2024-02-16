<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profil Enseignant</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="padding: 5px 10%;">
    <a class="navbar-brand" href="#" style="margin-right:70%;">Prof. ${user.getNom()}</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <!-- Add your navbar links here -->
            <li class="nav-item active" style="margin-right: 40px">
                <a class="nav-link" href="profilEnseignant.jsp">Profil <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active" style="margin-right: 40px">
                <a class="nav-link" href="enseignant?action=ajouterNote">Ajouter<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="enseignant?action=afficherNote" style="margin-right: 40px">Affichage <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="logout">Déconnexion<span class="sr-only">(current)</span></a>
            </li>
        </ul>
    </div>
</nav>
<div style="padding:50px 10%;">
    <h1 style="margin-bottom:30px;">Profil de l'enseignant</h1>
    <c:if test="${empty user}">
    <p>Veuillez vous connecter pour voir votre profil.</p>
</c:if>
<c:if test="${not empty user}">
    <p style="font-size:30px">Nom : ${user.getNom()}</p>
    <p style="font-size:30px">Prénom : ${user.getPrenom()}</p>
    <p style="font-size:30px">Email : ${user.getEmail()}</p>
    <hr>
</c:if>

</div>


</body>
</html>
