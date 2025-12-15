package com.test.controllers;

import com.framework.annotation.Controller;
import com.framework.annotation.HandlePath;
import com.framework.util.ModelView;

import java.util.ArrayList;
import java.util.List;

/**
 * Sprint 5: Contrôleur pour gérer les départements
 * Démonstration de l'envoi de données vers la vue via ModelView.addObject()
 */
@Controller
public class DepartementController {

    @HandlePath("/departement/liste")
    public ModelView listeDepartements() {
        System.out.println("=== SPRINT 5: Liste des départements ===");
        
        // Créer une liste de départements (simulation de données depuis une BD)
        List<String> listeDept = new ArrayList<>();
        listeDept.add("Informatique");
        listeDept.add("Mathématiques");
        listeDept.add("Physique");
        listeDept.add("Chimie");
        listeDept.add("Biologie");
        
        System.out.println("Nombre de départements : " + listeDept.size());
        
        // Créer le ModelView et ajouter les données
        ModelView mv = new ModelView("/WEB-INF/views/departement/liste.jsp");
        mv.addObject("listeDept", listeDept);
        mv.addObject("titre", "Liste des Départements");
        mv.addObject("total", listeDept.size());
        
        System.out.println("ModelView créé : " + mv);
        System.out.println("========================================");
        
        return mv;
    }

    @HandlePath("/departement/details")
    public ModelView detailsDepartement() {
        System.out.println("=== SPRINT 5: Détails du département ===");
        
        // Simuler un département avec plusieurs propriétés
        String nomDept = "Informatique";
        String chef = "Dr. RAKOTO Jean";
        int nombreEtudiants = 250;
        int nombreProfesseurs = 15;
        
        ModelView mv = new ModelView("/WEB-INF/views/departement/details.jsp");
        mv.addObject("nomDept", nomDept);
        mv.addObject("chef", chef);
        mv.addObject("nombreEtudiants", nombreEtudiants);
        mv.addObject("nombreProfesseurs", nombreProfesseurs);
        
        System.out.println("Département : " + nomDept);
        System.out.println("========================================");
        
        return mv;
    }
}
