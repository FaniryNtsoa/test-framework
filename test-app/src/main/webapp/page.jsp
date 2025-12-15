<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sprint 4-bis - Test Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }
        h1 {
            color: #667eea;
            border-bottom: 3px solid #667eea;
            padding-bottom: 10px;
        }
        .success {
            background: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 5px;
            border-left: 4px solid #28a745;
            margin: 20px 0;
        }
        .info {
            background: #d1ecf1;
            color: #0c5460;
            padding: 15px;
            border-radius: 5px;
            border-left: 4px solid #17a2b8;
            margin: 20px 0;
        }
        code {
            background: #f4f4f4;
            padding: 2px 6px;
            border-radius: 3px;
            font-family: 'Courier New', monospace;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🎉 Sprint 4-bis : ModelView Dispatch</h1>
        
        <div class="success">
            <strong>✅ Succès !</strong><br>
            Le dispatch vers la page JSP fonctionne parfaitement !
        </div>
        
        <div class="info">
            <h3>Comment ça marche ?</h3>
            <ol>
                <li>Le contrôleur a créé un <code>ModelView</code></li>
                <li>Il a appelé <code>setVue("/page.jsp")</code></li>
                <li>Le <code>FrontServlet</code> a détecté que le retour est un <code>ModelView</code></li>
                <li>Il a appelé <code>getVue()</code> pour récupérer le chemin</li>
                <li>Il a utilisé <code>RequestDispatcher.forward()</code> pour dispatcher vers cette page</li>
            </ol>
        </div>
        
        <h3>Informations de la requête :</h3>
        <ul>
            <li><strong>URL appelée :</strong> <%= request.getRequestURI() %></li>
            <li><strong>Méthode HTTP :</strong> <%= request.getMethod() %></li>
            <li><strong>Context Path :</strong> <%= request.getContextPath() %></li>
            <li><strong>Date/Heure :</strong> <%= new java.util.Date() %></li>
        </ul>
        
        <p style="text-align: center; margin-top: 30px; color: #666;">
            Sprint 4-bis implémenté avec succès ! 🚀
        </p>
    </div>
</body>
</html>
