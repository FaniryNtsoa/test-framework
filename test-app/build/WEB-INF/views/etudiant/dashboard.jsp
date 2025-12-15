<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sprint 5 - Dashboard Étudiant</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f7fa;
            padding: 40px;
        }
        .dashboard {
            max-width: 1200px;
            margin: 0 auto;
        }
        h1 {
            color: #2c3e50;
            font-size: 2.5em;
            margin-bottom: 30px;
        }
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 40px;
        }
        .stat-card {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            text-align: center;
            transition: transform 0.3s;
        }
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
        }
        .stat-icon {
            font-size: 3em;
            margin-bottom: 10px;
        }
        .stat-value {
            font-size: 2.5em;
            font-weight: bold;
            color: #3498db;
            margin: 10px 0;
        }
        .stat-label {
            color: #7f8c8d;
            font-size: 1.1em;
        }
        .chart-container {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        .chart-title {
            font-size: 1.5em;
            color: #2c3e50;
            margin-bottom: 20px;
        }
        .chart-bar {
            display: flex;
            align-items: center;
            margin: 15px 0;
        }
        .bar-label {
            width: 150px;
            font-weight: bold;
            color: #34495e;
        }
        .bar-visual {
            flex: 1;
            height: 40px;
            background: linear-gradient(90deg, #667eea, #764ba2);
            border-radius: 10px;
            position: relative;
            overflow: hidden;
        }
        .bar-value {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: white;
            font-weight: bold;
        }
        .success { background: linear-gradient(90deg, #56ab2f, #a8e063); }
        .info { background: linear-gradient(90deg, #3498db, #2980b9); }
        .warning { background: linear-gradient(90deg, #f39c12, #e67e22); }
        .danger { background: linear-gradient(90deg, #e74c3c, #c0392b); }
    </style>
</head>
<body>
    <div class="dashboard">
        <h1>📊 Dashboard des Étudiants</h1>
        
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon">👥</div>
                <div class="stat-value"><%= request.getAttribute("totalEtudiants") %></div>
                <div class="stat-label">Total Étudiants</div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon">🆕</div>
                <div class="stat-value" style="color: #2ecc71;"><%= request.getAttribute("nouveauxInscrits") %></div>
                <div class="stat-label">Nouveaux Inscrits</div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon">🎓</div>
                <div class="stat-value" style="color: #9b59b6;"><%= request.getAttribute("diplomes") %></div>
                <div class="stat-label">Diplômés</div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon">📈</div>
                <div class="stat-value" style="color: #e74c3c;"><%= request.getAttribute("tauxReussite") %>%</div>
                <div class="stat-label">Taux de Réussite</div>
            </div>
        </div>
        
        <div class="chart-container">
            <div class="chart-title">📌 Répartition par Département</div>
            <%
                Map<String, Integer> repartitionDept = (Map<String, Integer>) request.getAttribute("repartitionDept");
                if (repartitionDept != null) {
                    int maxValue = repartitionDept.values().stream().max(Integer::compare).orElse(1);
                    String[] colors = {"success", "info", "warning", "danger", ""};
                    int colorIndex = 0;
                    
                    for (Map.Entry<String, Integer> entry : repartitionDept.entrySet()) {
                        int percentage = (entry.getValue() * 100) / maxValue;
                        String colorClass = colors[colorIndex % colors.length];
            %>
                        <div class="chart-bar">
                            <div class="bar-label"><%= entry.getKey() %></div>
                            <div class="bar-visual <%= colorClass %>" style="width: <%= percentage %>%;">
                                <div class="bar-value"><%= entry.getValue() %></div>
                            </div>
                        </div>
            <%
                        colorIndex++;
                    }
                }
            %>
        </div>
        
        <p style="text-align: center; margin-top: 40px; color: #7f8c8d; font-size: 0.9em;">
            Sprint 5 : Dashboard avec données complexes (Map&lt;String, Integer&gt;) 🚀
        </p>
    </div>
</body>
</html>
