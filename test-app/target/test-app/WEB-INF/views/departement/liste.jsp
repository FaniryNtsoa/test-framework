<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sprint 5 - Liste des Départements</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 40px;
            min-height: 100vh;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
        }
        h1 {
            color: #667eea;
            margin-bottom: 10px;
            font-size: 2.5em;
        }
        .badge {
            display: inline-block;
            background: #667eea;
            color: white;
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 0.9em;
            margin: 20px 0;
        }
        .info-box {
            background: #e7f3ff;
            padding: 15px;
            border-radius: 8px;
            border-left: 4px solid #2196F3;
            margin: 20px 0;
        }
        ul {
            list-style: none;
            margin: 20px 0;
        }
        li {
            background: #f8f9fa;
            padding: 15px;
            margin: 10px 0;
            border-radius: 8px;
            border-left: 4px solid #667eea;
            font-size: 1.1em;
            transition: transform 0.2s;
        }
        li:hover {
            transform: translateX(10px);
            background: #e7f3ff;
        }
        .count {
            background: #28a745;
            color: white;
            padding: 5px 12px;
            border-radius: 15px;
            font-weight: bold;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🎓 <%= request.getAttribute("titre") %></h1>
        <div class="badge">Sprint 5 : Envoi de données vers la vue</div>
        
        <div class="info-box">
            <strong>✅ Succès !</strong><br>
            Les données ont été envoyées depuis le contrôleur via <code>ModelView.addObject()</code><br>
            et récupérées dans la JSP via <code>request.getAttribute()</code>
        </div>
        
        <p><strong>Total de départements :</strong> <span class="count"><%= request.getAttribute("total") %></span></p>
        
        <h2 style="margin-top: 30px; color: #667eea;">📋 Liste des départements :</h2>
        
        <ul>
            <%
                List<String> listeDept = (List<String>) request.getAttribute("listeDept");
                if (listeDept != null && !listeDept.isEmpty()) {
                    for (String dept : listeDept) {
            %>
                        <li>🏫 <%= dept %></li>
            <%
                    }
                } else {
            %>
                    <li>Aucun département trouvé</li>
            <%
                }
            %>
        </ul>
        
        <p style="text-align: center; margin-top: 30px; color: #888; font-size: 0.9em;">
            Sprint 5 : Transfert de données avec ModelView ! 🚀
        </p>
    </div>
</body>
</html>
