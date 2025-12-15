<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sprint 6-Bis - Formulaire Étudiant</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f6fb; margin: 0; padding: 0; }
        .wrapper { max-width: 640px; margin: 60px auto; background: #ffffff; border-radius: 12px;
                   box-shadow: 0 15px 45px rgba(0, 0, 0, 0.08); padding: 40px 50px; }
        h1 { margin: 0 0 20px; font-size: 28px; color: #1b3c59; }
        p.description { margin: 0 0 30px; color: #607489; line-height: 1.6; }
        label { display: block; margin-bottom: 8px; font-weight: bold; color: #3b536b; }
        input[type="text"], input[type="number"] { width: 100%; padding: 12px 15px; margin-bottom: 20px;
            border: 1px solid #d6ddeb; border-radius: 8px; font-size: 16px; transition: border-color 0.2s ease; }
        input[type="text"]:focus, input[type="number"]:focus { outline: none; border-color: #4c7de3; }
        button { background: linear-gradient(120deg, #4c7de3, #3a56b7); color: #ffffff; border: none;
                 padding: 14px 28px; border-radius: 10px; font-size: 16px; font-weight: bold; cursor: pointer;
                 box-shadow: 0 12px 24px rgba(76, 125, 227, 0.35); transition: transform 0.15s ease; }
        button:hover { transform: translateY(-2px); }
        .hint { margin-top: 25px; padding: 15px; background: #eff4ff; border-radius: 8px;
                border: 1px dashed #b3c7ff; color: #3b536b; font-size: 14px; }
    </style>
</head>
<body>
    <div class="wrapper">
        <h1><%= request.getAttribute("titre") %></h1>
        <p class="description">
            Cette variante démontre <code>@RequestParam</code> : les champs ci-dessous utilisent des noms
            différents de ceux déclarés dans la méthode du contrôleur.
        </p>

        <form action="<%= request.getContextPath() %>/etudiant/save-bis" method="post">
            <label for="studentId">Identifiant</label>
            <input type="number" id="studentId" name="studentId" placeholder="Ex: 2025" required>

            <label for="studentLastName">Nom</label>
            <input type="text" id="studentLastName" name="studentLastName" placeholder="Ex: Rakoto" required>

            <label for="studentFirstName">Prénom</label>
            <input type="text" id="studentFirstName" name="studentFirstName" placeholder="Ex: Soa">

            <button type="submit">Envoyer</button>
        </form>

        <div class="hint">
            <strong>Rappel :</strong> La méthode du contrôleur reçoit les paramètres <code>idEtudiant</code>,
            <code>nomRecu</code> et <code>prenomRecu</code>. L'annotation <code>@RequestParam</code> fait le lien
            avec les noms du formulaire.
        </div>
    </div>
</body>
</html>
