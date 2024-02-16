<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@page import="modele.Enseignant" %>
<%@page import="modele.Modules" %>
<%@ page session="true" %>
<% 
    List<Enseignant> enseignants = (List<Enseignant>)session.getAttribute("enseignants");
    List<Modules> modules  = (List<Modules>)session.getAttribute("modules");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajouter matiere</title>
<!-- Include Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="style.css" rel="stylesheet"/> <!-- Your custom CSS -->
</head>
<body>
    <c:import url="menuAdmin.jsp">
        <c:param name="titre" value="ajouter matiere"/>
    </c:import>
    
    <div class="container mt-5">
        <form action="admin?action=ajouterMatiere" method="post">
            <fieldset>
                <legend>matiere :</legend>
                <div class="form-group row">
                    <label for="nom" class="col-sm-2 col-form-label">Nom :</label>
                    <div class="col-sm-10">
                        <input name="nom" type="text" class="form-control"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="controlle" class="col-sm-2 col-form-label">Date controlle :</label>
                    <div class="col-sm-10">
                        <input name="controlle" type="text" class="form-control"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="rattrapage" class="col-sm-2 col-form-label">Date rattrapage :</label>
                    <div class="col-sm-10">
                        <input name="rattrapage" type="text" class="form-control"/>
                    </div>
                </div>
                
                <div class="form-group row">
                    <label for="enseignant" class="col-sm-2 col-form-label">Enseignant :</label>
                    <div class="col-sm-10">
                        <select class="form-control" id="enseignant" name="enseignant">
                            <% for(Enseignant enseignant : enseignants) { %>
                                <option value="<%= enseignant.getCIN() %>"> <%= enseignant.getNom() %> </option>
                            <% } %>
                        </select>
                    </div>
                </div>
                
                <div class="form-group row">
                    <label for="module" class="col-sm-2 col-form-label">Module :</label>
                    <div class="col-sm-10">
                        <select class="form-control" id="module" name="module">
                            <% for(Modules module : modules) { %>
                                <option value="<%= module.getId() %>"> <%= module.getNom() %> </option>
                            <% } %>
                        </select>
                    </div>
                </div>
                
                <div class="form-group row">
                    <div class="col-sm-10 offset-sm-2">
                        <input type="submit" value="ajouter" class="btn btn-primary"/>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
    
    <br/><br/><br/><br/><br/><br/>
    
<!-- Include Bootstrap JS at the end of the body to optimize page loading -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
