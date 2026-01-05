<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.test.controllers.dto.Participant" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sprint 8-bis - Object Binding Form</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        form {
            max-width: 900px;
            margin: 0 auto;
            display: grid;
            gap: 24px;
        }
        fieldset {
            border: 1px solid #ccc;
            padding: 16px;
            border-radius: 8px;
        }
        legend {
            font-weight: bold;
            padding: 0 8px;
        }
        label {
            display: block;
            margin-bottom: 8px;
        }
        .skills-grid {
            display: grid;
            gap: 8px;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
        }
    </style>
</head>
<body>
    <h1>Sprint 8-bis &ndash; Nested Object Binding Demo</h1>
    <p>
        This form posts parameters such as <code>registration.participants[0].fullName</code>
        to demonstrate automatic retrieval of complex objects and lists.
    </p>

    <form method="post" action="${pageContext.request.contextPath}/sprint8-bis/submit">
        <fieldset>
            <legend>Group Details</legend>
            <label>
                Group Name
                <input type="text" name="registration.groupName" placeholder="Awesome Squad">
            </label>
            <label>
                Contact Email
                <input type="email" name="registration.contactEmail" placeholder="team@example.com">
            </label>
            <label>
                <input type="checkbox" name="registration.remoteFriendly" value="true">
                Remote friendly team
            </label>
        </fieldset>

        <fieldset>
            <legend>Participant #1</legend>
            <label>
                Full Name
                <input type="text" name="registration.participants[0].fullName" placeholder="Jane Doe">
            </label>
            <label>
                Years of experience
                <input type="number" min="0" name="registration.participants[0].experienceYears" value="0">
            </label>
            <div class="skills-grid">
                <label>
                    Skill 1
                    <input type="text" name="registration.participants[0].skills[0]" placeholder="Java">
                </label>
                <label>
                    Skill 2
                    <input type="text" name="registration.participants[0].skills[1]" placeholder="REST">
                </label>
            </div>
        </fieldset>

        <fieldset>
            <legend>Participant #2</legend>
            <label>
                Full Name
                <input type="text" name="registration.participants[1].fullName" placeholder="John Smith">
            </label>
            <label>
                Years of experience
                <input type="number" min="0" name="registration.participants[1].experienceYears" value="0">
            </label>
            <div class="skills-grid">
                <label>
                    Skill 1
                    <input type="text" name="registration.participants[1].skills[0]" placeholder="DevOps">
                </label>
                <label>
                    Skill 2
                    <input type="text" name="registration.participants[1].skills[1]" placeholder="CI/CD">
                </label>
            </div>
        </fieldset>

        <button type="submit">Submit registration</button>
    </form>

    <section>
        <h2>Sample participants (for reference)</h2>
        <ul>
            <%
                List<Participant> examples = (List<Participant>) request.getAttribute("exampleParticipants");
                if (examples != null) {
                    for (Participant participant : examples) {
            %>
                <li><%= participant %></li>
            <%
                    }
                }
            %>
        </ul>
    </section>
</body>
</html>
