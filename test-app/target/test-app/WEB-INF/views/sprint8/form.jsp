<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sprint 8 - Map Injection Form</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <h1>Sprint 8 &ndash; Map Injection Demo</h1>
    <p>Submit the form to verify that request parameters populate a map argument in the controller.</p>

    <form method="post" action="${pageContext.request.contextPath}/sprint8/submit">
        <div>
            <label for="fullName">Full name</label>
            <input type="text" id="fullName" name="fullName" placeholder="Jane Doe">
        </div>

        <fieldset>
            <legend>Choose your interests</legend>
            <label>
                <input type="checkbox" name="interests" value="java">
                Java
            </label>
            <label>
                <input type="checkbox" name="interests" value="web">
                Web
            </label>
            <label>
                <input type="checkbox" name="interests" value="cloud">
                Cloud
            </label>
        </fieldset>

        <div>
            <label>
                <input type="checkbox" name="acceptTerms" value="true">
                I agree to receive updates.
            </label>
        </div>

        <button type="submit">Send</button>
    </form>
</body>
</html>
