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
<title>ajouter matiere</title>
<link href="style.css" rel="stylesheet"/>
</head>
<body>
	<c:import url="menuAdmin.jsp">
		<c:param name="titre" value="ajouter matiere"/>
	</c:import>
	
	<form action="admin?action=modifier_matiere" method="post">
    <input type="hidden" name="id_M" value="<%= matiere.getId() %>">
        <fieldset>
            <legend>matiere :</legend>
            <div class="ligne">
                <div class="labels"><label for="nom">Nom : </label></div>
                <div class="zones"><input name="nom" type="text"/></div>
            </div>
            <div class="ligne">
                <div class="labels"><label for="controlle">date controlle : </label></div>
                <div class="zones"><input name="controlle" type="text"/></div>
            </div>
            <div class="ligne">
                <div class="labels"><label for="rattrapage">date rattrapage: </label></div>
                <div class="zones"><input name="rattrapage" type="text" /></div>
            </div>
            
	      
			
			<select class="form-control" id="enseignant" name="enseignant">
   				 <% for(Enseignant enseignant : enseignants) { %>
        		<option value="<%= enseignant.getCIN() %>"> <%= enseignant.getNom() %> </option>
   				 <% } %>
			</select>
			<select class="form-control" id="module" name="module">
   				 <% for(Modules module : modules) { %>
        		<option value="<%= module.getId() %>"> <%= module.getNom() %> </option>
   				 <% } %>
			</select>


 			<div class="ligne">
                <div class="labels"><label>&nbsp;</label></div>
                <div class="zones"><input type="submit" value="ajouter"/></div>
            </div>
        </fieldset>
       
    </form>
    <br/><br/><br/><br/><br/><br/>
    
</body>
</html>