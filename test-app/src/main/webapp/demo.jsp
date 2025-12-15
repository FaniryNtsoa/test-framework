<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Demo - Sprint 4-bis</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Arial', sans-serif;
            background: #0f2027;
            background: linear-gradient(to right, #2c5364, #203a43, #0f2027);
            color: white;
            padding: 40px;
        }
        .demo-container {
            max-width: 900px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 20px;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        h1 {
            font-size: 3em;
            margin-bottom: 20px;
            text-align: center;
            background: linear-gradient(45deg, #00d2ff, #3a7bd5);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        .section {
            background: rgba(255, 255, 255, 0.05);
            padding: 20px;
            margin: 20px 0;
            border-radius: 10px;
            border-left: 4px solid #00d2ff;
        }
        h2 {
            color: #00d2ff;
            margin-bottom: 15px;
        }
        .code-block {
            background: #1e1e1e;
            color: #d4d4d4;
            padding: 15px;
            border-radius: 8px;
            font-family: 'Courier New', monospace;
            overflow-x: auto;
            margin: 10px 0;
        }
        .highlight {
            color: #4ec9b0;
            font-weight: bold;
        }
        ul {
            list-style-position: inside;
            line-height: 2;
        }
        li {
            padding: 5px 0;
        }
    </style>
</head>
<body>
    <div class="demo-container">
        <h1>🚀 Démonstration Sprint 4-bis</h1>
        
        <div class="section">
            <h2>📋 Étapes du dispatch :</h2>
            <ul>
                <li>1️⃣ URL appelée : <strong><%= request.getRequestURI() %></strong></li>
                <li>2️⃣ FrontServlet a intercepté la requête</li>
                <li>3️⃣ Méthode du contrôleur invoquée par réflexion</li>
                <li>4️⃣ Contrôleur retourne : <span class="highlight">ModelView</span></li>
                <li>5️⃣ FrontServlet détecte <code>result instanceof ModelView</code></li>
                <li>6️⃣ Récupération du chemin : <span class="highlight">modelView.getVue()</span></li>
                <li>7️⃣ Dispatch vers : <strong>/demo.jsp</strong></li>
                <li>8️⃣ Affichage de cette page ! ✅</li>
            </ul>
        </div>
        
        <div class="section">
            <h2>💻 Code du contrôleur :</h2>
            <div class="code-block">
@HandlePath("/view/demo")<br>
public <span class="highlight">ModelView</span> demo() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;ModelView mv = new ModelView();<br>
&nbsp;&nbsp;&nbsp;&nbsp;mv.<span class="highlight">setVue("/demo.jsp")</span>;<br>
&nbsp;&nbsp;&nbsp;&nbsp;return mv;<br>
}
            </div>
        </div>
        
        <div class="section">
            <h2>🔧 Code du FrontServlet :</h2>
            <div class="code-block">
if (result <span class="highlight">instanceof ModelView</span>) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;ModelView modelView = (ModelView) result;<br>
&nbsp;&nbsp;&nbsp;&nbsp;String viewPath = modelView.<span class="highlight">getVue()</span>;<br>
&nbsp;&nbsp;&nbsp;&nbsp;RequestDispatcher dispatcher = req.getRequestDispatcher(viewPath);<br>
&nbsp;&nbsp;&nbsp;&nbsp;dispatcher.<span class="highlight">forward</span>(req, resp);<br>
}
            </div>
        </div>
        
        <p style="text-align: center; margin-top: 40px; font-size: 1.2em;">
            ✨ Sprint 4-bis implémenté avec succès ! ✨
        </p>
    </div>
</body>
</html>
