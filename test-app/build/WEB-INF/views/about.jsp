<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About - Sprint 4-bis</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to bottom right, #667eea, #764ba2);
            margin: 0;
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
            color: #667eea;
            font-size: 2.8em;
            margin-bottom: 20px;
            text-align: center;
        }
        .feature {
            background: #f8f9fa;
            padding: 20px;
            margin: 15px 0;
            border-radius: 10px;
            border-left: 5px solid #667eea;
        }
        .feature h3 {
            color: #667eea;
            margin-bottom: 10px;
        }
        .tech-stack {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin: 20px 0;
        }
        .tech-badge {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 10px 20px;
            border-radius: 25px;
            font-weight: bold;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>📖 À propos du Framework</h1>
        
        <div class="feature">
            <h3>🎯 Sprint 4-bis : ModelView</h3>
            <p>
                Le framework supporte maintenant le pattern <strong>ModelView</strong> !<br>
                Les contrôleurs peuvent retourner un objet ModelView qui contient<br>
                le chemin vers une vue JSP, et le FrontServlet dispatch automatiquement.
            </p>
        </div>
        
        <div class="feature">
            <h3>🚀 Fonctionnalités complètes :</h3>
            <ul style="line-height: 2;">
                <li>✅ Sprint 1 : Interception de toutes les URLs</li>
                <li>✅ Sprint 2 : Annotations @Controller et @HandlePath</li>
                <li>✅ Sprint 2-bis : HashMap des routes + 404</li>
                <li>✅ Sprint 3 : Scanning automatique au démarrage</li>
                <li>✅ Sprint 4 : Invocation par réflexion + retour String</li>
                <li>✅ Sprint 4-bis : ModelView + dispatch JSP</li>
            </ul>
        </div>
        
        <div class="feature">
            <h3>💻 Technologies utilisées :</h3>
            <div class="tech-stack">
                <span class="tech-badge">Java 17</span>
                <span class="tech-badge">Jakarta EE 10</span>
                <span class="tech-badge">Servlets 6.0</span>
                <span class="tech-badge">JSP</span>
                <span class="tech-badge">Reflection API</span>
                <span class="tech-badge">Apache Tomcat 10</span>
            </div>
        </div>
        
        <div style="text-align: center; margin-top: 30px; padding: 20px; background: #e7f3ff; border-radius: 10px;">
            <p style="margin: 0; color: #0c5460; font-size: 1.1em;">
                Cette vue est protégée dans <code>/WEB-INF/views/about.jsp</code>
            </p>
        </div>
        
        <p style="text-align: center; margin-top: 30px; color: #888;">
            Framework MVC Custom - Sprint 4-bis ✨
        </p>
    </div>
</body>
</html>
