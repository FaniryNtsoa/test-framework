package com.test.controllers.dto;

import java.util.ArrayList;
import java.util.List;

/**
 * Sprint 8-bis: DTO representing a team registration with nested participants.
 */
public class GroupRegistration {

    private String groupName;
    private String contactEmail;
    private boolean remoteFriendly;
    private List<Participant> participants = new ArrayList<>();

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    public boolean isRemoteFriendly() {
        return remoteFriendly;
    }

    public void setRemoteFriendly(boolean remoteFriendly) {
        this.remoteFriendly = remoteFriendly;
    }

    public List<Participant> getParticipants() {
        return participants;
    }

    public void setParticipants(List<Participant> participants) {
        this.participants = participants == null ? new ArrayList<>() : participants;
    }

    /**
     * Helper used in the JSP to display a readable state in toString.
     */
    @Override
    public String toString() {
        return "GroupRegistration{" +
                "groupName='" + groupName + '\'' +
                ", contactEmail='" + contactEmail + '\'' +
                ", remoteFriendly=" + remoteFriendly +
                ", participants=" + participants +
                '}';
    }
}
