<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajouter module</title>
<!-- Include Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="style.css" rel="stylesheet"/> <!-- Your custom CSS -->
</head>
<body>
    <c:import url="menuAdmin.jsp">
        <c:param name="titre" value="ajouter etudiant"/>
    </c:import>
    
    <div class="container mt-5">
        <form action="admin?action=ajouterMod" method="post">
            <input type="hidden" name="role" value="ETUDIANT">
            <fieldset>
                <legend>module :</legend>
                <div class="form-group row">
                    <label for="nom" class="col-sm-2 col-form-label">Nom du module :</label>
                    <div class="col-sm-10">
                        <input name="nom" type="text" class="form-control"/>
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
