package com.test.controllers;

import com.framework.annotation.Controller;
import com.framework.annotation.HandlePath;

/**
 * Test Sprint 2, 2-bis, 3:
 * - Plusieurs méthodes avec différentes URLs
 * - URLs avec segments multiples
 */
@Controller
public class UserController {

    @HandlePath("/user/list")
    public String listUsers() {
        return "Liste des utilisateurs";
    }

    @HandlePath("/user/profile")
    public String userProfile() {
        return "Profil utilisateur";
    }

    @HandlePath("/user/create")
    public String createUser() {
        return "Créer un nouvel utilisateur";
    }

    @HandlePath("/user/delete")
    public String deleteUser() {
        return "Supprimer un utilisateur";
    }
}
