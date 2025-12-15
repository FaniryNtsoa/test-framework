<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome - Sprint 4-bis</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #fc5c7d, #6a82fb);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .card {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.2);
            text-align: center;
            max-width: 600px;
        }
        h1 {
            color: #fc5c7d;
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        .badge {
            display: inline-block;
            background: #6a82fb;
            color: white;
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 0.9em;
            margin: 10px 0;
        }
        p {
            color: #555;
            line-height: 1.8;
            font-size: 1.1em;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>Bienvenue ! 👋</h1>
        <div class="badge">Sprint 4-bis : ModelView + JSP</div>
        <p>
            Cette page a été affichée grâce au <strong>ModelView</strong> !<br>
            Le contrôleur a retourné <code>new ModelView("/welcome.jsp")</code><br>
            et le FrontServlet a dispatché vers cette vue.
        </p>
        <p style="margin-top: 30px; color: #888; font-size: 0.9em;">
            URL : <%= request.getRequestURI() %><br>
            Heure : <%= new java.text.SimpleDateFormat("HH:mm:ss").format(new java.util.Date()) %>
        </p>
    </div>
</body>
</html>
