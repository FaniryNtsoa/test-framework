package com.test.controllers;

import com.framework.annotation.Controller;
import com.framework.annotation.HandlePath;
import com.framework.annotation.RequestParam;
import com.framework.util.ModelView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Sprint 5: Contrôleur pour gérer les étudiants
 * Démonstration avec des objets complexes (Map représentant un étudiant)
 */
@Controller
public class EtudiantController {

    @HandlePath("/etudiant/liste")
    public ModelView listeEtudiants() {
        System.out.println("=== SPRINT 5: Liste des étudiants ===");
        
        // Créer une liste d'étudiants (Map pour simuler des objets)
        List<Map<String, Object>> listeEtudiants = new ArrayList<>();
        
        Map<String, Object> etudiant1 = new HashMap<>();
        etudiant1.put("id", 1);
        etudiant1.put("nom", "RANDRIA");
        etudiant1.put("prenom", "Feno");
        etudiant1.put("age", 20);
        etudiant1.put("departement", "Informatique");
        listeEtudiants.add(etudiant1);
        
        Map<String, Object> etudiant2 = new HashMap<>();
        etudiant2.put("id", 2);
        etudiant2.put("nom", "RAKOTO");
        etudiant2.put("prenom", "Soa");
        etudiant2.put("age", 22);
        etudiant2.put("departement", "Mathématiques");
        listeEtudiants.add(etudiant2);
        
        Map<String, Object> etudiant3 = new HashMap<>();
        etudiant3.put("id", 3);
        etudiant3.put("nom", "RASOLOFO");
        etudiant3.put("prenom", "Lalaina");
        etudiant3.put("age", 21);
        etudiant3.put("departement", "Physique");
        listeEtudiants.add(etudiant3);
        
        System.out.println("Nombre d'étudiants : " + listeEtudiants.size());
        
        // Créer le ModelView avec chaînage fluent
        ModelView mv = new ModelView("/WEB-INF/views/etudiant/liste.jsp");
        mv.addObject("listeEtudiants", listeEtudiants)
          .addObject("titre", "Liste des Étudiants")
          .addObject("total", listeEtudiants.size())
          .addObject("annee", 2025);
        
        System.out.println("========================================");
        return mv;
    }

    @HandlePath("/etudiant/dashboard")
    public ModelView dashboard() {
        System.out.println("=== SPRINT 5: Dashboard étudiant ===");
        
        // Données statistiques
        int totalEtudiants = 1250;
        int nouveauxInscrits = 320;
        int diplomes = 180;
        double tauxReussite = 85.5;
        
        // Données par département
        Map<String, Integer> repartitionDept = new HashMap<>();
        repartitionDept.put("Informatique", 450);
        repartitionDept.put("Mathématiques", 300);
        repartitionDept.put("Physique", 250);
        repartitionDept.put("Chimie", 150);
        repartitionDept.put("Biologie", 100);
        
        ModelView mv = new ModelView("/WEB-INF/views/etudiant/dashboard.jsp");
        mv.addObject("totalEtudiants", totalEtudiants)
          .addObject("nouveauxInscrits", nouveauxInscrits)
          .addObject("diplomes", diplomes)
          .addObject("tauxReussite", tauxReussite)
          .addObject("repartitionDept", repartitionDept);
        
        System.out.println("========================================");
        return mv;
    }

      @HandlePath("/etudiant/form")
      public ModelView afficherFormulaire() {
        System.out.println("=== SPRINT 6: Formulaire étudiant ===");

        ModelView mv = new ModelView("/WEB-INF/views/etudiant/form.jsp");
        mv.addObject("titre", "Formulaire d'inscription étudiant");

        return mv;
      }

      @HandlePath("/etudiant/save")
      public ModelView enregistrerEtudiant(int id, String nom, String prenom) {
        System.out.println("=== SPRINT 6: Enregistrement étudiant ===");
        System.out.println("id = " + id + ", nom = " + nom + ", prenom = " + prenom);

        if (prenom != null && prenom.isBlank()) {
          prenom = null;
        }

        return buildSaveModelView("/WEB-INF/views/etudiant/save.jsp", id, nom, prenom);
      }

      @HandlePath("/etudiant/form-bis")
      public ModelView afficherFormulaireBis() {
        System.out.println("=== SPRINT 6-BIS: Formulaire RequestParam ===");

        ModelView mv = new ModelView("/WEB-INF/views/etudiant/form-bis.jsp");
        mv.addObject("titre", "Formulaire étudiant Sprint 6-Bis");

        return mv;
      }

      @HandlePath("/etudiant/save-bis")
      public ModelView enregistrerEtudiantBis(
          @RequestParam("studentId") int idEtudiant,
          @RequestParam("studentLastName") String nomRecu,
          @RequestParam("studentFirstName") String prenomRecu) {
        System.out.println("=== SPRINT 6-BIS: Enregistrement étudiant ===");
        System.out.println("studentId = " + idEtudiant + ", studentLastName = " + nomRecu + ", studentFirstName = " + prenomRecu);

        if (prenomRecu != null && prenomRecu.isBlank()) {
          prenomRecu = null;
        }

        return buildSaveModelView("/WEB-INF/views/etudiant/save-bis.jsp", idEtudiant, nomRecu, prenomRecu);
      }

      private ModelView buildSaveModelView(String view, int id, String nom, String prenom) {
        ModelView mv = new ModelView(view);
        mv.addObject("id", id)
          .addObject("nom", nom)
          .addObject("prenom", prenom);
        return mv;
      }
}
