<%@page import="modele.etudiant"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    List<etudiant> listL = (List<etudiant>) session.getAttribute("liste");
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Relev� de notes</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
</head>
<body>

<c:import url="menuAdmin.jsp">
        <c:param name="titre" value=""/>
    </c:import>
<div class="container mt-4">
    <h2 class="mb-4">Liste des etudiants</h2>
 	
    <div class="row">
        <div class="col">
            <table class="table table-striped">
                <thead class="thead-light">
                <tr>
                    <th>nom</th>
                    <th>prenom</th>
                    <th>age</th>
                    <th>CIN</th>
                    <th>CNE</th>
                    <th>email</th>
                    <th>password</th>
                    <th>Action</th> <!-- New column for buttons -->
                </tr>
                </thead>
                <tbody>
                <% for(etudiant etd : listL){ %>
                <tr>
                    <td><%= etd.getNom() %></td>
                    <td><%= etd.getPrenom() %></td>
                    <td><%= etd.getAge() %></td>
                    <td><%= etd.getCIN() %></td>
                    <td><%= etd.getCNE() %></td>
                    <td><%= etd.getEmail() %></td>
                    <td><%= etd.getPassword() %></td>
                    
                    <td>
                        <a href="admin?action=modifier_Etd&id_M=<%= etd.getCIN() %>" class="btn btn-primary btn-sm">Modifier</a>
              			<a href="admin?action=delete_Etd&id_S=<%= etd.getCIN()%>" class="btn btn-danger btn-sm">Supprimer</a>
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