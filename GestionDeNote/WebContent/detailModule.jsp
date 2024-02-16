<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@page import="modele.Modules" %>
<%
    Modules mod = (Modules)request.getAttribute("mod");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details du module ajouté</title>
<!-- Include Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="style.css" rel="stylesheet"/> <!-- Your custom CSS -->
</head>
<body>
    <c:import url="menuAdmin.jsp">
        <c:param name="titre" value="details du module ajouté"/>
    </c:import>
    
    <div class="container mt-5">
        <table class="table table-bordered">
            <tr>
                <th scope="row">Nom :</th>
                <td><%= mod.getNom() %></td>
            </tr>
          
        </table>
    </div>
    
<!-- Include Bootstrap JS at the end of the body to optimize page loading -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
