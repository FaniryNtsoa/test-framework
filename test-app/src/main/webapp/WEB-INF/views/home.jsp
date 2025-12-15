<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home - Sprint 4-bis</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            margin: 0;
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
            color: #f5576c;
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        .protected {
            background: #fff3cd;
            color: #856404;
            padding: 15px;
            border-radius: 8px;
            border-left: 4px solid #ffc107;
            margin: 20px 0;
        }
        .info {
            background: #e7f3ff;
            padding: 20px;
            border-radius: 8px;
            margin: 20px 0;
        }
        code {
            background: #f4f4f4;
            padding: 3px 8px;
            border-radius: 4px;
            font-family: monospace;
            color: #c7254e;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🏠 Page d'accueil</h1>
        
        <div class="protected">
            <strong>🔒 Vue protégée</strong><br>
            Cette page JSP est dans <code>/WEB-INF/views/</code><br>
            Elle n'est pas accessible directement depuis le navigateur !<br>
            Seul le FrontServlet peut la dispatcher.
        </div>
        
        <div class="info">
            <h3>Comment y accéder ?</h3>
            <p>
                Le contrôleur retourne :<br>
                <code>new ModelView("/WEB-INF/views/home.jsp")</code>
            </p>
            <p style="margin-top: 15px;">
                Le FrontServlet utilise un <strong>RequestDispatcher</strong> pour<br>
                dispatcher vers cette vue qui est protégée dans WEB-INF.
            </p>
        </div>
        
        <h3>Informations :</h3>
        <ul>
            <li><strong>URL :</strong> <%= request.getRequestURI() %></li>
            <li><strong>Context Path :</strong> <%= request.getContextPath() %></li>
            <li><strong>Fichier JSP :</strong> /WEB-INF/views/home.jsp</li>
            <li><strong>Heure :</strong> <%= new java.util.Date() %></li>
        </ul>
        
        <p style="text-align: center; margin-top: 30px; color: #888;">
            Sprint 4-bis : Vue protégée dans WEB-INF ! 🛡️
        </p>
    </div>
</body>
</html>
