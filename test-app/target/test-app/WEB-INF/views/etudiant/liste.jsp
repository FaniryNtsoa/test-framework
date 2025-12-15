<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sprint 5 - Liste Étudiants</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            padding: 40px;
            min-height: 100vh;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 25px 80px rgba(0,0,0,0.5);
        }
        h1 {
            color: #2c5364;
            font-size: 2.8em;
            margin-bottom: 10px;
        }
        .header-info {
            display: flex;
            justify-content: space-between;
            margin: 20px 0;
        }
        .badge {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 10px 20px;
            border-radius: 25px;
            font-weight: bold;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 30px 0;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        thead {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
        }
        th, td {
            padding: 15px;
            text-align: left;
        }
        th {
            font-weight: bold;
            text-transform: uppercase;
            font-size: 0.9em;
            letter-spacing: 1px;
        }
        tbody tr {
            border-bottom: 1px solid #e0e0e0;
            transition: background 0.2s;
        }
        tbody tr:hover {
            background: #f5f7fa;
        }
        .id-col {
            font-weight: bold;
            color: #667eea;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>👨‍🎓 <%= request.getAttribute("titre") %></h1>
        
        <div class="header-info">
            <div class="badge">Année <%= request.getAttribute("annee") %></div>
            <div class="badge">Total : <%= request.getAttribute("total") %> étudiants</div>
        </div>
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Âge</th>
                    <th>Département</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Map<String, Object>> listeEtudiants = (List<Map<String, Object>>) request.getAttribute("listeEtudiants");
                    if (listeEtudiants != null && !listeEtudiants.isEmpty()) {
                        for (Map<String, Object> etudiant : listeEtudiants) {
                %>
                            <tr>
                                <td class="id-col">#<%= etudiant.get("id") %></td>
                                <td><strong><%= etudiant.get("nom") %></strong></td>
                                <td><%= etudiant.get("prenom") %></td>
                                <td><%= etudiant.get("age") %> ans</td>
                                <td><%= etudiant.get("departement") %></td>
                            </tr>
                <%
                        }
                    } else {
                %>
                        <tr>
                            <td colspan="5" style="text-align: center; padding: 40px; color: #999;">
                                Aucun étudiant trouvé
                            </td>
                        </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        
        <p style="text-align: center; margin-top: 30px; color: #666; font-size: 0.9em;">
            Sprint 5 : Affichage de données complexes (List&lt;Map&lt;String, Object&gt;&gt;) 🚀
        </p>
    </div>
</body>
</html>
