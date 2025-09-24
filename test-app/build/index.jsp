<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test App - Framework Web</title>
</head>
<body>
    <%= request.getAttribute("interceptedURL") %>
    <%= request.getAttribute("message") %>

</body>
</html>