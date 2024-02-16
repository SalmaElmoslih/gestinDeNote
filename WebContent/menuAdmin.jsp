<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Include Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    /* Custom CSS styles */
    .titre {
        text-align: center;
        margin-top: 20px;
    }
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="dashboardAdmin.jsp">Accueil</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="ajouterEnseignant.jsp">Ajouter Enseignant</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ajouterMatiere.jsp">Ajouter Matière</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ajouterEtd.jsp">Ajouter Étudiant</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Liste
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="afficherEtudiant.jsp">Afficher Étudiant</a>
                        <a class="dropdown-item" href="afficherEnseignant.jsp">Afficher Enseignant</a>
                        <a class="dropdown-item" href="afficherMatiere.jsp">Afficher Matière</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout">Deconnexion</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="titre">
        <h2>${param.titre}</h2>
    </div>
</div>

<!-- Include Bootstrap JS at the end of the body to optimize page loading -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
