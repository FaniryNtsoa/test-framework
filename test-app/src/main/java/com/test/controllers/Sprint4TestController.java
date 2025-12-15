package com.test.controllers;

import com.framework.annotation.Controller;
import com.framework.annotation.HandlePath;

/**
 * Sprint 4: Test de l'invocation par reflexion et affichage du resultat
 */
@Controller
public class Sprint4TestController {

    @HandlePath("/sprint4/test1")
    public String test1() {
        // Sprint 4: System.out pour verifier l'invocation dans les logs Tomcat
        System.out.println("=== SPRINT 4 TEST 1 ===");
        System.out.println("Methode test1() a ete invoquee par reflexion !");
        System.out.println("Classe: " + this.getClass().getName());
        System.out.println("=======================");
        
        // Sprint 4: Retourner un String qui sera affiche avec PrintWriter
        return "Sprint 4 Test 1 : La methode a ete invoquee par reflexion et ce texte est affiche avec PrintWriter !";
    }   

    @HandlePath("/sprint4/test2")
    public String test2() {
        System.out.println("=== SPRINT 4 TEST 2 ===");
        System.out.println("Invocation reussie de test2() !");
        System.out.println("Instance du controleur : " + this.toString());
        System.out.println("=======================");
        
        return "Sprint 4 Test 2 : Invocation par reflexion OK - Affichage du String OK";
    }

    @HandlePath("/sprint4/hello")
    public String hello() {
        System.out.println("[Sprint 4] hello() invoque a " + System.currentTimeMillis());
        return "Hello from Sprint 4 !";
    }

    @HandlePath("/sprint4/info")
    public String info() {
        System.out.println("[Sprint 4] Demonstration de l'invocation par reflexion");
        
        StringBuilder sb = new StringBuilder();
        sb.append("=== SPRINT 4 - INVOCATION PAR REFLEXION ===\n\n");
        sb.append("1. Le FrontServlet a trouve la methode associee a cette URL\n");
        sb.append("2. Il a instancie le controleur : " + this.getClass().getName() + "\n");
        sb.append("3. Il a invoque la methode via reflection : handler.invoke(...)\n");
        sb.append("4. Il affiche le String retourne avec PrintWriter\n\n");
        sb.append("Verifiez les logs Tomcat pour voir les System.out.println() !\n");
        
        return sb.toString();
    }

    @HandlePath("/sprint4/void-test")
    public void voidTest() {
        System.out.println("=== SPRINT 4 VOID TEST ===");
        System.out.println("Cette methode ne retourne rien (void)");
        System.out.println("Donc aucun texte ne sera affiche dans la page");
        System.out.println("==========================");
        // Pas de return -> pas d'affichage dans la page
    }
}
