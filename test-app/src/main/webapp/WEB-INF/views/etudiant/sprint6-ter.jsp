<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Sprint 6-ter</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 2rem; background-color: #f7f7f7; }
        h1 { color: #0057b8; }
        .card { background: #ffffff; border-radius: 8px; padding: 1.5rem; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); }
        dl { display: grid; grid-template-columns: max-content auto; row-gap: 0.5rem; column-gap: 1rem; margin: 0; }
        dt { font-weight: bold; color: #333; }
        dd { margin: 0; color: #555; }
        .note { margin-top: 1.5rem; font-size: 0.95rem; color: #666; }
    </style>
</head>
<body>
<div class="card">
    <h1>Résultat Sprint 6-ter</h1>
    <dl>
        <dt>Identifiant étudiant</dt>
        <dd><%= request.getAttribute("studentId") %></dd>
        <dt>Année de promotion</dt>
        <dd><%= request.getAttribute("promoYear") %></dd>
        <dt>Semestre</dt>
        <dd><%= request.getAttribute("semester") %></dd>
        <dt>Mode d'affichage</dt>
        <dd><%= request.getAttribute("displayMode") %></dd>
    </dl>
    <p class="note">
        Les valeurs ci-dessus proviennent exclusivement des segments dynamiques de l'URL
        et des paramètres de requête fournis au contrôleur.
    </p>
</div>
</body>
</html>
