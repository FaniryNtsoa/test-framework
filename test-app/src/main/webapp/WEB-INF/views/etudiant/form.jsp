<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sprint 6 - Formulaire Étudiant</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6fb;
            margin: 0;
            padding: 0;
        }
        .wrapper {
            max-width: 640px;
            margin: 60px auto;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 15px 45px rgba(0, 0, 0, 0.08);
            padding: 40px 50px;
        }
        h1 {
            margin: 0 0 20px;
            font-size: 28px;
            color: #1b3c59;
        }
        p.description {
            margin: 0 0 30px;
            color: #607489;
            line-height: 1.6;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #3b536b;
        }
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 20px;
            border: 1px solid #d6ddeb;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.2s ease;
        }
        input[type="text"]:focus,
        input[type="number"]:focus {
            outline: none;
            border-color: #4c7de3;
        }
        button {
            background: linear-gradient(120deg, #4c7de3, #3a56b7);
            color: #ffffff;
            border: none;
            padding: 14px 28px;
            border-radius: 10px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 0 12px 24px rgba(76, 125, 227, 0.35);
            transition: transform 0.15s ease;
        }
        button:hover {
            transform: translateY(-2px);
        }
        .hint {
            margin-top: 25px;
            padding: 15px;
            background: #eff4ff;
            border-radius: 8px;
            border: 1px dashed #b3c7ff;
            color: #3b536b;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <h1><%= request.getAttribute("titre") %></h1>
        <p class="description">
            Les noms des champs du formulaire correspondent exactement aux paramètres de la méthode
            <code>enregistrerEtudiant(int id, String nom, String prenom)</code> du contrôleur.
        </p>

        <form action="<%= request.getContextPath() %>/etudiant/save" method="post">
            <label for="id">Identifiant</label>
            <input type="number" id="id" name="id" placeholder="Ex: 2025" required>

            <label for="nom">Nom</label>
            <input type="text" id="nom" name="nom" placeholder="Ex: Rakoto" required>

            <label for="prenom">Prénom</label>
            <input type="text" id="prenom" name="prenom" placeholder="Ex: Soa">

            <button type="submit">Envoyer</button>
        </form>

        <div class="hint">
            <strong>Rappel :</strong> Lorsque le formulaire est soumis, le framework injecte automatiquement les
            valeurs lues dans la requête dans les paramètres du contrôleur grâce au mapping par nom.
        </div>
    </div>
</body>
</html>
