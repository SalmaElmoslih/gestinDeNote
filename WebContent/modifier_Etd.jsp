<%@page import="modele.etudiant" %>
<%@page import="java.util.List"%>

<%   
    etudiant etudiant = (etudiant)request.getAttribute("etudiant");
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="style.css" rel="stylesheet"/>
    <title>modifier</title>
</head>
<body>

    <c:import url="menuAdmin.jsp">
		<c:param name="titre" value="modifier un livre"/>
	</c:import>
    <form action="admin?action=modifier_Etd" method="post">
    <input type="hidden" name="id_M" value="<%= etudiant.getCIN() %>">
    
    <fieldset>
            <legend>etudiant :</legend>
            <div class="ligne">
                <div class="labels"><label for="nom">Nom : </label></div>
                <div class="zones"><input name="nom" type="text"/></div>
            </div>
            <div class="ligne">
                <div class="labels"><label for="prenom">prenom : </label></div>
                <div class="zones"><input name="prenom" type="text"/></div>
            </div>
            
            <div class="ligne">
                <div class="labels"><label for="CNE">CNE : </label></div>
                <div class="zones"><input name="CNE" type="text" /></div>
            </div>
            <div class="ligne">
                <div class="labels"><label for="age">age : </label></div>
                <div class="zones"><input name="age" type="text" /></div>
            </div>
            
        </fieldset>
        <fieldset>
            <legend>compte :</legend>
            <div class="ligne">
                <div class="labels"><label for="email">email : </label></div>
                <div class="zones"><input name="email" type="text" /></div>
            </div>
            <div class="ligne">
                <div class="labels"><label for="mdps">mot de passe : </label></div>
                <div class="zones"><input name="mdps" type="text" /></div>
            </div>
            
            <div class="ligne">
                <div class="labels"><label>&nbsp;</label></div>
                <div class="zones"><input type="submit" value="modifier"/></div>
            </div>
        </fieldset>
</form>


</body>
</html>
