package com.test.controllers;

import com.framework.annotation.Controller;
import com.framework.annotation.HandlePath;

@Controller
public class TestController {

    @HandlePath("/home")
    public String home() {
        return "Page d'accueil";
    }

    @HandlePath("/hello")
    public String hello() {
        return "Hello World!";
    }

    @HandlePath("/about")
    public String about() {
        return "À propos de l'application de test";
    }
}
