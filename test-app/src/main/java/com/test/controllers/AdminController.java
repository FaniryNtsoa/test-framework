package com.test.controllers;

import com.framework.annotation.Controller;
import com.framework.annotation.HandlePath;

/**
 * Test Sprint 2-bis:
 * - Vérifier que le framework scan TOUS les contrôleurs du package
 * - Erreur 404 si URL non trouvée dans la HashMap
 */
@Controller
public class AdminController {

    @HandlePath("/admin/dashboard")
    public String dashboard() {
        return "Tableau de bord administrateur";
    }

    @HandlePath("/admin/settings")
    public String settings() {
        return "Paramètres administrateur";
    }

    @HandlePath("/admin/users")
    public String manageUsers() {
        return "Gestion des utilisateurs";
    }
    @HandlePath("/admin/caca")
    public String caca() {
        return "Caca endpoint";
    }
}
