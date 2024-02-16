<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Include Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="style.css" rel="stylesheet"/> <!-- Your custom CSS -->
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="#"> gestion de note</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="dashboardAdmin.jsp">Accueil</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin?action=ajouterEnseigant">Ajouter Enseignant</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin?action=ajouterMatiere">Ajouter Matiere</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin?action=ajouterEtd">Ajouter Etudiant</a>
                </li>
                  <li class="nav-item">
                    <a class="nav-link" href="admin?action=ajouterMod">Ajouter module</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Liste
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="admin?action=afficherEtudiant">Afficher Étudiant</a>
                        <a class="dropdown-item" href="admin?action=afficherEnseignant">Afficher Enseignant</a>
                        <a class="dropdown-item" href="admin?action=afficherMatiere">Afficher Matière</a>
                        <a class="dropdown-item" href="admin?action=afficherModule">Afficher Modules</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout">Deconnexion</a>
                </li>
            </ul>
        </div>
        <a class="nav-link" href="profilAdmin.jsp">  <img src="icone.jpg" alt="Icône de compte" class="icon-small"></a>
    </div>
</nav>


<br><br><br><br><br><br><br>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="titre text-center">
                <h2 class="font-weight-bold">Bienvenue ${user.getNom()} sur votre tableau de bord administrateur</h2>
                
            </div>
        </div>
    </div>
</div>


<!-- Include Bootstrap JS at the end of the body to optimize page loading -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
