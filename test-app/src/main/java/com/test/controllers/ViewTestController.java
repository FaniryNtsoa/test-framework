package com.test.controllers;

import com.framework.annotation.Controller;
import com.framework.annotation.HandlePath;
import com.framework.util.ModelView;

/**
 * Sprint 4-bis: Test de ModelView
 * Contrôleur de test pour vérifier que le dispatch vers les JSP fonctionne
 */
@Controller
public class ViewTestController {

    @HandlePath("/view/test1")
    public ModelView test1() {
        System.out.println("=== SPRINT 4-BIS TEST 1 ===");
        System.out.println("Creation d'un ModelView vers page.jsp");
        System.out.println("===========================");
        
        // Sprint 4-bis: Créer un ModelView et spécifier la vue
        ModelView mv = new ModelView();
        mv.setVue("/page.jsp");
        return mv;
    }

    @HandlePath("/view/test2")
    public ModelView test2() {
        System.out.println("=== SPRINT 4-BIS TEST 2 ===");
        System.out.println("Creation d'un ModelView vers welcome.jsp");
        System.out.println("===========================");
        
        // Utiliser le constructeur avec paramètre
        return new ModelView("/welcome.jsp");
    }

    @HandlePath("/view/home")
    public ModelView home() {
        System.out.println("[Sprint 4-bis] Dispatch vers views/home.jsp");
        return new ModelView("/WEB-INF/views/home.jsp");
    }

    @HandlePath("/view/about")
    public ModelView about() {
        System.out.println("[Sprint 4-bis] Dispatch vers views/about.jsp");
        return new ModelView("/WEB-INF/views/about.jsp");
    }

    @HandlePath("/view/demo")
    public ModelView demo() {
        System.out.println("=== SPRINT 4-BIS DEMO ===");
        System.out.println("Demonstration du dispatch vers une vue JSP");
        
        ModelView mv = new ModelView();
        mv.setVue("/demo.jsp");
        
        System.out.println("ModelView cree : " + mv);
        System.out.println("Vue : " + mv.getVue());
        System.out.println("========================");
        
        return mv;
    }
}
