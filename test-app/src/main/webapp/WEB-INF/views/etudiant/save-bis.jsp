<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sprint 6-Bis - Résultat RequestParam</title>
    <style>
        body { margin: 0; padding: 0; font-family: Arial, sans-serif; background: #0f172a; color: #f8fafc;
               min-height: 100vh; display: flex; align-items: center; justify-content: center; }
        .card { background: #15213b; padding: 40px 55px; border-radius: 18px;
                 box-shadow: 0 25px 75px rgba(0, 0, 0, 0.45); max-width: 520px; width: 100%; }
        h1 { margin-top: 0; font-size: 30px; color: #a5b4fc; }
        .field { margin-bottom: 18px; }
        .field span { display: block; font-size: 13px; letter-spacing: 1px; text-transform: uppercase;
                      color: #94a3b8; margin-bottom: 6px; }
        .value { font-size: 20px; line-height: 1.4; }
        .value.empty { color: #f97316; font-style: italic; }
        a.button { display: inline-block; margin-top: 32px; padding: 12px 22px;
                   background: linear-gradient(120deg, #2563eb, #7c3aed); border-radius: 10px;
                   text-decoration: none; color: white; font-weight: bold;
                   transition: transform 0.15s ease, box-shadow 0.15s ease; }
        a.button:hover { transform: translateY(-2px); box-shadow: 0 14px 30px rgba(37, 99, 235, 0.35); }
    </style>
</head>
<body>
    <div class="card">
        <h1>Résultat Sprint 6-Bis</h1>
        <div class="field">
            <span>Identifiant reçu</span>
            <div class="value"><%= request.getAttribute("id") %></div>
        </div>
        <div class="field">
            <span>Nom reçu</span>
            <div class="value"><%= request.getAttribute("nom") %></div>
        </div>
        <div class="field">
            <span>Prénom reçu</span>
            <div class="value <%= request.getAttribute("prenom") == null ? "empty" : "" %>">
                <%= request.getAttribute("prenom") == null ? "(non fourni)" : request.getAttribute("prenom") %>
            </div>
        </div>

        <a class="button" href="<%= request.getContextPath() %>/etudiant/form-bis">Retour au formulaire 6-Bis</a>
    </div>
</body>
</html>
