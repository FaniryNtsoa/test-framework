<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sprint 8 - Submission Result</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <h1>Submission Summary</h1>
    <p>The controller received the following map built from the request parameters:</p>

    <table border="1" cellpadding="8" cellspacing="0">
        <thead>
            <tr>
                <th>Key</th>
                <th>Value</th>
            </tr>
        </thead>
        <tbody>
        <%
            Map<String, Object> formValues = (Map<String, Object>) request.getAttribute("formValues");
            if (formValues != null) {
                for (Map.Entry<String, Object> entry : formValues.entrySet()) {
        %>
            <tr>
                <td><%= entry.getKey() %></td>
                <td><%= entry.getValue() %></td>
            </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>

    <h2>Checkbox Interests</h2>
    <ul>
        <%
            List<String> interests = (List<String>) request.getAttribute("selectedInterests");
            if (interests != null && !interests.isEmpty()) {
                for (String interest : interests) {
        %>
            <li><%= interest %></li>
        <%
                }
            } else {
        %>
            <li>No interests selected</li>
        <%
            }
        %>
    </ul>

    <p>Accept terms: <strong><%= Boolean.TRUE.equals(request.getAttribute("acceptTerms")) ? "Yes" : "No" %></strong></p>
    <p><a href="${pageContext.request.contextPath}/sprint8/form">Back to the form</a></p>
</body>
</html>
