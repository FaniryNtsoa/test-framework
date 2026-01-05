package com.test.controllers.dto;

import java.util.ArrayList;
import java.util.List;

/**
 * Sprint 8-bis: Nested object used to validate list-of-objects binding.
 */
public class Participant {

    private String fullName;
    private int experienceYears;
    private List<String> skills = new ArrayList<>();

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getExperienceYears() {
        return experienceYears;
    }

    public void setExperienceYears(int experienceYears) {
        this.experienceYears = experienceYears;
    }

    public List<String> getSkills() {
        return skills;
    }

    public void setSkills(List<String> skills) {
        this.skills = skills == null ? new ArrayList<>() : skills;
    }

    @Override
    public String toString() {
        return "Participant{" +
                "fullName='" + fullName + '\'' +
                ", experienceYears=" + experienceYears +
                ", skills=" + skills +
                '}';
    }
}
