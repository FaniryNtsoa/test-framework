package com.test.controllers;

import com.framework.annotation.Controller;
import com.framework.annotation.HandlePath;

/**
 * Test Sprint 1, 2, 2-bis, 3:
 * - Controller annoté avec @Controller
 * - Méthodes annotées avec @HandlePath
 */
@Controller
public class HomeController {

    @HandlePath("/")
    public String index() {
        return "Bienvenue sur la page d'accueil";
    }

    @HandlePath("/welcome")
    public String welcome() {
        return "Welcome to the test application";
    }
}
