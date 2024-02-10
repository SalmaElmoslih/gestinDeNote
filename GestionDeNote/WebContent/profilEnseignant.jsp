<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profil Enseignant</title>
</head>
<body>
    <h1>Profil de l'enseignant</h1>
    <c:if test="${empty user}">
    <p>Veuillez vous connecter pour voir votre profil.</p>
</c:if>
<c:if test="${not empty user}">
    <p>Nom : ${user.getNom()}</p>
    <p>Email : ${user.getEmail()}</p>
</c:if>

</body>
</html>
