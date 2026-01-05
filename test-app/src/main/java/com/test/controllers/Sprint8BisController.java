package com.test.controllers;

import com.framework.annotation.Controller;
import com.framework.annotation.GetMapping;
import com.framework.annotation.PostMapping;
import com.framework.util.ModelView;
import com.test.controllers.dto.GroupRegistration;
import com.test.controllers.dto.Participant;

import java.util.ArrayList;
import java.util.List;

/**
 * Sprint 8-bis: Demonstrates automatic binding of nested objects and lists.
 */
@Controller
public class Sprint8BisController {

    @GetMapping("/sprint8-bis/form")
    public ModelView showForm() {
        ModelView modelView = new ModelView("/WEB-INF/views/sprint8bis/form.jsp");
        modelView.addObject("exampleParticipants", buildExampleParticipants());
        return modelView;
    }

    @PostMapping("/sprint8-bis/submit")
    public ModelView handleSubmission(GroupRegistration registration) {
        ModelView modelView = new ModelView("/WEB-INF/views/sprint8bis/result.jsp");
        modelView.addObject("registration", registration);
        modelView.addObject("participants", sanitizeParticipants(registration.getParticipants()));
        return modelView;
    }

    private List<Participant> buildExampleParticipants() {
        List<Participant> samples = new ArrayList<>();
        Participant first = new Participant();
        first.setFullName("Jane Doe");
        first.setExperienceYears(3);
        first.getSkills().add("Java");
        first.getSkills().add("REST");
        samples.add(first);

        Participant second = new Participant();
        second.setFullName("John Smith");
        second.setExperienceYears(5);
        second.getSkills().add("DevOps");
        samples.add(second);

        return samples;
    }

    private List<Participant> sanitizeParticipants(List<Participant> participants) {
        List<Participant> filtered = new ArrayList<>();
        if (participants == null) {
            return filtered;
        }
        for (Participant participant : participants) {
            if (participant == null) {
                continue;
            }
            boolean hasContent = (participant.getFullName() != null && !participant.getFullName().isBlank())
                    || participant.getExperienceYears() > 0
                    || (participant.getSkills() != null && participant.getSkills().stream()
                        .anyMatch(value -> value != null && !value.isBlank()));
            if (hasContent) {
                filtered.add(participant);
            }
        }
        return filtered;
    }
}
