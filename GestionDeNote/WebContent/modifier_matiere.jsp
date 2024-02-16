<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@page import="modele.Enseignant" %>
<%@page import="modele.Modules" %>
<%@page import="modele.Matiere" %>
<%@ page session="true" %>
<% 
	List<Enseignant> enseignants = (List<Enseignant>)session.getAttribute("enseignants");
	List<Modules> modules  = (List<Modules>)session.getAttribute("modules");
 
	Matiere matiere = (Matiere)request.getAttribute("matiere");

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter Matière</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="style.css" rel="stylesheet"/>
</head>
<body>
    <div class="container">
        <c:import url="menuAdmin.jsp">
            <c:param name="titre" value="Ajouter Matière"/>
        </c:import>
        
        <form action="admin?action=modifier_matiere" method="post">
            <input type="hidden" name="id_M" value="<%= matiere.getId() %>">
            <fieldset>
                <legend>Matière :</legend>
                <div class="form-group row">
                    <label for="nom" class="col-sm-2 col-form-label">Nom :</label>
                    <div class="col-sm-10">
                        <input name="nom" type="text" class="form-control">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="controlle" class="col-sm-2 col-form-label">Date contrôle :</label>
                    <div class="col-sm-10">
                        <input name="controlle" type="text" class="form-control">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="rattrapage" class="col-sm-2 col-form-label">Date rattrapage :</label>
                    <div class="col-sm-10">
                        <input name="rattrapage" type="text" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="enseignant">Enseignant :</label>
                    <select class="form-control" id="enseignant" name="enseignant">
                        <% for(Enseignant enseignant : enseignants) { %>
                            <option value="<%= enseignant.getCIN() %>"> <%= enseignant.getNom() %> </option>
                        <% } %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="module">Module :</label>
                    <select class="form-control" id="module" name="module">
                        <% for(Modules module : modules) { %>
                            <option value="<%= module.getId() %>"> <%= module.getNom() %> </option>
                        <% } %>
                    </select>
                </div>
                <div class="form-group row">
                    <div class="offset-sm-2 col-sm-10">
                        <input type="submit" value="Ajouter" class="btn btn-primary">
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
