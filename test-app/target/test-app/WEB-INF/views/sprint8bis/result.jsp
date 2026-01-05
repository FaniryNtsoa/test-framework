<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%@ page import="com.test.controllers.dto.GroupRegistration" %>
<%@ page import="com.test.controllers.dto.Participant" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sprint 8-bis - Submission Result</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <h1>Sprint 8-bis &ndash; Registration Summary</h1>
    <%
        GroupRegistration registration = (GroupRegistration) request.getAttribute("registration");
        List<Participant> participants = (List<Participant>) request.getAttribute("participants");
        if (participants == null) {
            participants = registration != null && registration.getParticipants() != null
                    ? registration.getParticipants() : Collections.emptyList();
        }
    %>

    <section>
        <h2>Group information</h2>
        <p><strong>Name:</strong> <%= registration != null ? registration.getGroupName() : "(unknown)" %></p>
        <p><strong>Contact email:</strong> <%= registration != null ? registration.getContactEmail() : "(unknown)" %></p>
        <p><strong>Remote friendly:</strong> <%= registration != null && registration.isRemoteFriendly() ? "Yes" : "No" %></p>
    </section>

    <section>
        <h2>Participants</h2>
        <%
            if (participants != null && !participants.isEmpty()) {
        %>
        <ol>
        <%
                for (Participant participant : participants) {
                    if (participant == null) {
                        continue;
                    }
        %>
            <li>
                <p><strong>Name:</strong> <%= participant.getFullName() %></p>
                <p><strong>Experience:</strong> <%= participant.getExperienceYears() %> years</p>
                <p><strong>Skills:</strong>
                    <%
                        List<String> skills = participant.getSkills();
                        boolean hasSkills = false;
                        if (skills != null && !skills.isEmpty()) {
                            for (String skill : skills) {
                                if (skill != null && !skill.isBlank()) {
                                    if (!hasSkills) {
                    %>
                        <ul>
                    <%
                                        hasSkills = true;
                                    }
                    %>
                            <li><%= skill %></li>
                    <%
                                }
                            }
                        }
                        if (hasSkills) {
                    %>
                        </ul>
                    <%
                        } else {
                    %>
                        <em>No skills submitted</em>
                    <%
                        }
                    %>
                </p>
            </li>
        <%
                }
        %>
        </ol>
        <%
            } else {
        %>
        <p>No participant data submitted.</p>
        <%
            }
        %>
    </section>

    <p><a href="${pageContext.request.contextPath}/sprint8-bis/form">Back to the form</a></p>
</body>
</html>
