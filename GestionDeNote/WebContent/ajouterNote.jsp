<%@page import="metier.EtudiantRep"%>
<%@page import="java.util.List"%>
<%@page import="modele.Notes"%>
<%@page import="modele.Matiere"%>
<%@page import="modele.etudiant"%>
<%@page import="modele.Enseignant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<% 
	List<Matiere> matieres = (List<Matiere>)session.getAttribute("matieres");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter une note</title>
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
<div style="display:flex; justify-content:center; align-items:center; flex-direction:column;">
    <h1 style="margin:70px 0;">Ajouter une note</h1>
    <form action="" method="post">
        <div class="form-group" style="width:500px">
            <label for="matiere">Matiere:</label>
            <select class="form-control" id="matiere" name="matiere">
                <% for(Matiere matiere : matieres) { %>
                    <option value="<%= matiere.getId() %>"> <%= matiere.getNom() %> </option>
                <% } %>
            </select>
        </div>
        <div class="form-group" style="width:500px">
    		<label for="etudiant">Etudiant:</label>
    		<select class="form-control" id="etudiant" name="etudiant">
        		<% for(etudiant etudiant : (List<etudiant>)session.getAttribute("etudiants")) { %>
            	<option value="<%= etudiant.getCIN() %>"> <%= etudiant.getNom() %> </option>
        		<% } %>
    		</select>
		</div>

        <div class="form-group" style="width:100px">
            <label for="note">Note:</label>
            <input type="number" class="form-control" id="note" name="note" step="0.01">
        </div>
        <button type="submit" class="btn btn-primary">Ajouter note</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
