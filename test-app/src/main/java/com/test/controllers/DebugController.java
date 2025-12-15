package com.test.controllers;

import com.framework.Scanners.UrlDetails;
import com.framework.Scanners.UrlDetails.HandlerMethod;
import com.framework.annotation.Controller;
import com.framework.annotation.HandlePath;
import com.framework.annotation.HttpMethodType;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.TreeMap;

/**
 * Controleur de debug pour afficher les informations sur les routes enregistrees
 * Sprint 3: Acces a la HashMap reelle du FrontServlet via ServletContext
 */
@Controller
public class DebugController {

    @HandlePath("/debug/routes")
    public void showRoutes(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // Sprint 3: Recuperer la HashMap reelle depuis le ServletContext
        @SuppressWarnings("unchecked")
        Map<String, UrlDetails> routeRegistry = (Map<String, UrlDetails>) request.getServletContext()
                .getAttribute("framework.routes");
        
        StringBuilder html = new StringBuilder();
        html.append("<!DOCTYPE html>\n");
        html.append("<html>\n");
        html.append("<head>\n");
        html.append("    <meta charset='UTF-8'>\n");
        html.append("    <title>Routes enregistrees - Framework Debug</title>\n");
        html.append("    <style>\n");
        html.append("        body { font-family: Arial, sans-serif; margin: 20px; background: #f5f5f5; }\n");
        html.append("        h1 { color: #333; }\n");
        html.append("        .info { background: #e3f2fd; padding: 15px; border-radius: 5px; margin-bottom: 20px; }\n");
        html.append("        .success { background: #c8e6c9; padding: 15px; border-radius: 5px; margin-bottom: 20px; }\n");
        html.append("        table { width: 100%; border-collapse: collapse; background: white; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }\n");
        html.append("        th { background: #2196F3; color: white; padding: 12px; text-align: left; }\n");
        html.append("        td { padding: 10px; border-bottom: 1px solid #ddd; }\n");
        html.append("        tr:hover { background: #f5f5f5; }\n");
        html.append("        .url { font-family: monospace; color: #1976D2; font-weight: bold; }\n");
        html.append("        .class { color: #388E3C; }\n");
        html.append("        .method { color: #F57C00; }\n");
        html.append("        .test-link { display: inline-block; margin-top: 5px; padding: 5px 10px; background: #4CAF50; color: white; text-decoration: none; border-radius: 3px; font-size: 12px; }\n");
        html.append("        .test-link:hover { background: #45a049; }\n");
        html.append("    </style>\n");
        html.append("</head>\n");
        html.append("<body>\n");
        html.append("    <h1>[DEBUG] Routes REELLES enregistrees dans le Framework</h1>\n");
        html.append("    <div class='success'>\n");
        html.append("        <strong>Sprint 3 reussi !</strong> Cette page affiche les VRAIES routes scannees au demarrage depuis la HashMap du FrontServlet.\n");
        html.append("    </div>\n");
        
        if (routeRegistry == null || routeRegistry.isEmpty()) {
            html.append("    <div class='info' style='background: #ffebee; color: #c62828;'>\n");
            html.append("        <strong>ERREUR:</strong> Aucune route trouvee ! La HashMap est vide ou non accessible.\n");
            html.append("    </div>\n");
        } else {
            html.append("    <div class='info'>\n");
            html.append("        <strong>Total routes :</strong> ").append(routeRegistry.size()).append("<br>\n");
            html.append("        <strong>Source :</strong> ServletContext.getAttribute(\"framework.routes\")<br>\n");
            html.append("        <strong>Package scanne :</strong> com.test\n");
            html.append("    </div>\n");
            html.append("    <h2>[*] Liste des routes detectees (Sprint 2-bis + 3)</h2>\n");
            html.append("    <table>\n");
            html.append("        <tr>\n");
            html.append("            <th>#</th>\n");
            html.append("            <th>URL</th>\n");
            html.append("            <th>Controleur</th>\n");
            html.append("            <th>HTTP</th>\n");
            html.append("            <th>Methode</th>\n");
            html.append("            <th>Signature complete</th>\n");
            html.append("            <th>Action</th>\n");
            html.append("        </tr>\n");
            
            // Trier les routes par URL pour un affichage plus clair
            Map<String, UrlDetails> sortedRoutes = new TreeMap<>(routeRegistry);
            int index = 1;
            
            for (Map.Entry<String, UrlDetails> entry : sortedRoutes.entrySet()) {
                String url = entry.getKey();
                UrlDetails details = entry.getValue();
                String urlDisplay = url;
                if (details.isDynamic()) {
                    urlDisplay = url + " (dyn: " + String.join(", ", details.getParameterNames()) + ")";
                }

                for (HandlerMethod handler : details.getHandlerMethods()) {
                    Method method = handler.getMethod();
                    String className = method.getDeclaringClass().getSimpleName();
                    String methodName = method.getName();
                    String fullSignature = method.toString();

                    java.util.Set<HttpMethodType> verbs = handler.getHttpMethods();
                    StringBuilder verbsDisplay = new StringBuilder();
                    if (verbs.isEmpty()) {
                        verbsDisplay.append("ANY");
                    } else {
                        for (HttpMethodType verb : verbs) {
                            if (verbsDisplay.length() > 0) {
                                verbsDisplay.append(", ");
                            }
                            verbsDisplay.append(verb.name());
                        }
                    }

                    html.append("        <tr>\n");
                    html.append("            <td>").append(index++).append("</td>\n");
                    html.append("            <td class='url'>").append(urlDisplay).append("</td>\n");
                    html.append("            <td class='class'>").append(className).append("</td>\n");
                    html.append("            <td>").append(verbsDisplay).append("</td>\n");
                    html.append("            <td class='method'>").append(methodName).append("()</td>\n");
                    html.append("            <td style='font-size: 11px; color: #666;'>").append(fullSignature).append("</td>\n");
                    html.append("            <td><a class='test-link' href='").append(url).append("' target='_blank'>Tester</a></td>\n");
                    html.append("        </tr>\n");
                }
            }
            
            html.append("    </table>\n");
        }
        
        html.append("    <hr>\n");
        html.append("    <h3>[?] Verification Sprint 3</h3>\n");
        html.append("    <ol>\n");
        html.append("        <li>Le scanning s'effectue dans <code>FrontServlet.init()</code> au demarrage</li>\n");
        html.append("        <li>La HashMap est remplie automatiquement avec <code>ScanControllers.mapHandlePaths()</code></li>\n");
        html.append("        <li>Les routes sont stockees dans <code>ServletContext</code> pour y acceder depuis n'importe quel controleur</li>\n");
        html.append("        <li>Cette page recupere la HashMap REELLE (pas une simulation)</li>\n");
        html.append("    </ol>\n");
        html.append("    <p><strong>Logs Tomcat :</strong> Cherchez 'Routes enregistrees : [...]' dans catalina.log</p>\n");
        html.append("</body>\n");
        html.append("</html>\n");
        
        response.getWriter().write(html.toString());
    }

    @HandlePath("/debug/info")
    public void showInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/plain;charset=UTF-8");
        
        // Sprint 3: Recuperer la HashMap reelle
        @SuppressWarnings("unchecked")
        Map<String, UrlDetails> routeRegistry = (Map<String, UrlDetails>) request.getServletContext()
                .getAttribute("framework.routes");
        
        int routeCount = (routeRegistry != null) ? routeRegistry.size() : 0;
        int handlerCount = 0;
        if (routeRegistry != null) {
            for (UrlDetails details : routeRegistry.values()) {
                handlerCount += details.getHandlerMethods().size();
            }
        }
        
        response.getWriter().write("=== DEBUG INFO (Sprint 3) ===\n\n"
             + "Routes REELLES enregistrees (templates) : " + routeCount + "\n"
             + "Handlers disponibles : " + handlerCount + "\n"
             + "Source : ServletContext.getAttribute(\"framework.routes\")\n\n"
             + "Pour voir les details :\n"
             + "1. Consultez /debug/routes pour une vue HTML complete\n"
             + "2. Consultez les logs Tomcat : 'Routes enregistrees : [...]'\n\n"
             + "Package scanne : com.test\n");
    }
}
