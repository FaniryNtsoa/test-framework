package com.test.controllers;

import com.framework.annotation.Controller;
import com.framework.annotation.HandlePath;
import com.framework.annotation.RequestParam;
import com.framework.util.ModelView;

/**
 * Sprint 6-ter: Demonstrates extraction of dynamic path variables without relying on getParameter.
 * The controller showcases both String and ModelView responses to ensure previous sprints remain functional.
 */
@Controller
public class Sprint6TerController {

    @HandlePath("/sprint6/etudiant/{id}")
    public String showStudentById(int id) {
        return "Sprint 6-ter :: etudiant id=" + id;
    }

    @HandlePath("/sprint6/etudiant/{studentId}/promo/{year}")
    public ModelView showStudentPromo(@RequestParam("mode") String displayMode,
                                      int studentId,
                                      int year,
                                      @RequestParam("semester") int semester) {
        ModelView modelView = new ModelView("/WEB-INF/views/etudiant/sprint6-ter.jsp");
        modelView.addObject("studentId", studentId)
                 .addObject("promoYear", year)
                 .addObject("semester", semester)
                 .addObject("displayMode", displayMode);
        return modelView;
    }
}
