<%@page import="modele.Notes"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.stream.Collectors"%>

<%
    List<Notes> listL = (List<Notes>) session.getAttribute("listeNotes");

    // Calculate the average of all notes
    Double averageAllNotes = listL.stream()
                                  .mapToDouble(Notes::getNote)
                                  .average()
                                  .orElse(Double.NaN);

    // Calculate the average note per module
    Map<String, Double> averagePerModule = listL.stream()
                                                .collect(Collectors.groupingBy(
                                                        notes -> notes.getMatiere().getModule().getNom(),
                                                        Collectors.averagingDouble(Notes::getNote)
                                                ));
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Relevés de notes - ${user.getNom()} ${user.getPrenom()}</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="padding: 5px 10%;">
    <a class="navbar-brand" href="#" style="margin-right:75%;">Étudiant(e) ${user.getNom()} ${user.getPrenom()}</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="logout">Déconnexion <span class="sr-only">(current)</span></a>
            </li>
        </ul>
    </div>
</nav>
<div class="container mt-4">
    <h2 class="mb-4">Relevés de notes</h2>

    <div class="row">
        <div class="col">
            <table class="table table-striped table-bordered" style="margin-bottom:50px;">
                <thead class="thead-light">
                <tr>
                    <th>Module</th>
                    <th>Matière</th>
                    <th>Note</th>
                </tr>
                </thead>
                <tbody>
                <% for(Notes notes : listL){ %>
                <tr>
                    <td><%= notes.getMatiere().getModule().getNom() %></td>
                    <td><%= notes.getMatiere().getNom() %></td>
                    <td><%= notes.getNote() %></td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>



    <div class="row">
        <div class="col">
            <table class="table table-striped table-bordered">
                <thead class="thead-light">
                <tr>
                    <th>Module</th>
                    <th>Note</th>
                </tr>
                </thead>
                <tbody>
                <% for(Map.Entry<String, Double> entry : averagePerModule.entrySet()){ %>
                <tr>
                    <td><%= entry.getKey() %></td>
                    <td><%= String.format("%.2f", entry.getValue()) %></td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
        <div class="row mt-4">
        <div class="col">
            <h2 class="mb-2">Note générale: <%= String.format("%.2f", averageAllNotes) %></h2>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
