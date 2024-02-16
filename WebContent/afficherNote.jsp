<%@page import="modele.Notes"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    List<Notes> listL = (List<Notes>) session.getAttribute("liste");
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Relevé de notes</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
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
<div class="container mt-4">
    <h2 class="mb-4">Liste des notes</h2>

    <div class="row">
        <div class="col">
            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                <tr>
                    <th>Module</th>
                    <th>Matière</th>
                    <th>Etudiant</th>
                    <th>Note</th>
                    <th style="width:250px">Action</th> <!-- New column for buttons -->
                </tr>
                </thead>
                <tbody>
                <% for(Notes notes : listL){ %>
                <tr>
                    <td><%= notes.getMatiere().getModule().getNom() %></td>
                    <td><%= notes.getMatiere().getNom() %></td>
                    <td><%= notes.getEtudiant().getNom() + " " + notes.getEtudiant().getPrenom() %></td>
                    <td><%= notes.getNote() %></td>
                    <td style="padding-left:40px;">
                        <a href="enseignant?action=formulaire_MJ_Note&id_M=<%= notes.getId() %>" class="btn btn-primary btn-sm" style="margin-right:10px;">Modifier</a>
              			<a href="enseignant?action=delete_note&id_S=<%= notes.getId()%>" class="btn btn-danger btn-sm">Supprimer</a>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>