package com.test.controllers;

import com.framework.annotation.Controller;
import com.framework.annotation.HandlePath;

/**
 * Test Sprint 1, 2, 3:
 * - FrontServlet intercepte TOUTES les requêtes
 * - Ces URLs API doivent aussi être reconnues
 */
@Controller
public class ApiController {

    @HandlePath("/api/status")
    public String apiStatus() {
        return "API Status: OK";
    }

    @HandlePath("/api/version")
    public String apiVersion() {
        return "API Version: 1.0.0";
    }

    @HandlePath("/api/test")
    public String apiTest() {
        return "API Test endpoint";
    }
}
