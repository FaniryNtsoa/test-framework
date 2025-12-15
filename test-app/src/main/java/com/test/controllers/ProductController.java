package com.test.controllers;

import com.framework.annotation.Controller;
import com.framework.annotation.HandlePath;

/**
 * Test Sprint 2-bis, 3:
 * - HashMap des URLs doit contenir toutes ces routes
 * - Vérification du scanning automatique au démarrage
 */
@Controller
public class ProductController {

    @HandlePath("/product/all")
    public String allProducts() {
        return "Tous les produits";
    }

    @HandlePath("/product/details")
    public String productDetails() {
        return "Détails du produit";
    }

    @HandlePath("/product/search")
    public String searchProduct() {
        return "Rechercher un produit";
    }

    @HandlePath("/product/{id}")
    public String productById(int id) {
        return "Product #" + id;
    }
}
