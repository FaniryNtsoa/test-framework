<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sprint 5 - Détails Département</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #fc5c7d, #6a82fb);
            padding: 40px;
            min-height: 100vh;
        }
        .card {
            max-width: 700px;
            margin: 0 auto;
            background: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 25px 70px rgba(0,0,0,0.4);
        }
        h1 {
            color: #fc5c7d;
            font-size: 2.5em;
            margin-bottom: 20px;
        }
        .stat {
            background: #f8f9fa;
            padding: 20px;
            margin: 15px 0;
            border-radius: 10px;
            border-left: 5px solid #6a82fb;
        }
        .stat-label {
            color: #666;
            font-size: 0.9em;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .stat-value {
            color: #333;
            font-size: 1.8em;
            font-weight: bold;
            margin-top: 5px;
        }
        .highlight {
            color: #6a82fb;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>🏫 <%= request.getAttribute("nomDept") %></h1>
        
        <div class="stat">
            <div class="stat-label">Chef de département</div>
            <div class="stat-value highlight"><%= request.getAttribute("chef") %></div>
        </div>
        
        <div class="stat">
            <div class="stat-label">👨‍🎓 Nombre d'étudiants</div>
            <div class="stat-value"><%= request.getAttribute("nombreEtudiants") %></div>
        </div>
        
        <div class="stat">
            <div class="stat-label">👨‍🏫 Nombre de professeurs</div>
            <div class="stat-value"><%= request.getAttribute("nombreProfesseurs") %></div>
        </div>
        
        <p style="text-align: center; margin-top: 30px; color: #888;">
            Sprint 5 : Données récupérées avec <code>request.getAttribute()</code>
        </p>
    </div>
</body>
</html>
