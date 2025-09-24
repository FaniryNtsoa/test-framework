@echo off

:: Définition des variables
set "APP_NAME=test-app"
set "APP_SRC=C:\Users\fanir\Documents\ITU\Faniry\S5\Naina\test-framework\test-app\src\main\java"
set "WEB_DIR=C:\Users\fanir\Documents\ITU\Faniry\S5\Naina\test-framework\test-app\src\main\webapp"
set "BUILD_DIR=build"
set "LIB_DIR=lib"
set "WEB_INF=%BUILD_DIR%\WEB-INF"
set "TOMCAT_DIR=C:\Users\fanir\Documents\utils\tomcat-10.1.28-windows-x64\apache-tomcat-10.1.28\webapps"
set "SERVLET_API_JAR=%LIB_DIR%\servlet-api.jar"

echo.
echo ========================================
echo   BUILD ET DEPLOIEMENT %APP_NAME%
echo ========================================
echo.

:: Création du répertoire lib s'il n'existe pas
if not exist "%LIB_DIR%" (
    mkdir "%LIB_DIR%"
)

:: Vérification de la présence du JAR Servlet API
if not exist "%SERVLET_API_JAR%" (
    echo Téléchargement de Jakarta Servlet API...
    curl -L -o "%SERVLET_API_JAR%" "https://repo1.maven.org/maven2/jakarta/servlet/jakarta.servlet-api/6.0.0/jakarta.servlet-api-6.0.0.jar"
    if errorlevel 1 (
        echo Erreur lors du téléchargement de Jakarta Servlet API.
        pause
        exit /b 1
    )
)

:: Nettoyage et création de l'arborescence temporaire
if exist "%BUILD_DIR%" (
    rmdir /s /q "%BUILD_DIR%"
)
mkdir "%BUILD_DIR%"
mkdir "%WEB_INF%\classes"
mkdir "%WEB_INF%\lib"

:: Vérification de la présence de fichiers Java (optionnel pour test-app)
if exist "%APP_SRC%" (
    :: Création de la liste des fichiers Java
    if exist sources.txt del sources.txt
    for /r "%APP_SRC%" %%f in (*.java) do @echo %%f >> sources.txt

    if exist sources.txt (
        echo Compilation des fichiers Java avec le JAR des Servlets...
        javac -cp "%SERVLET_API_JAR%" -d "%WEB_INF%\classes" @"sources.txt"
        if errorlevel 1 (
            echo Erreur lors de la compilation des fichiers Java.
            pause
            exit /b 1
        )
        del sources.txt
        echo Compilation terminée.
    ) else (
        echo Aucun fichier Java trouvé dans %APP_SRC% - OK pour test-app.
    )
) else (
    echo Répertoire source Java inexistant - OK pour test-app.
)

:: Copier les fichiers web (web.xml, JSP, HTML, etc.)
echo Copie des fichiers web...
xcopy /e /i /q "%WEB_DIR%\*" "%BUILD_DIR%\"
if errorlevel 1 (
    echo Erreur lors de la copie des fichiers web.
    pause
    exit /b 1
)

:: Vérification de la structure WEB-INF
if not exist "%WEB_INF%\web.xml" (
    echo ERREUR: web.xml introuvable dans %WEB_INF%
    pause
    exit /b 1
)

:: Génération du fichier .war dans le dossier build
echo Création du fichier WAR...
cd "%BUILD_DIR%"
jar -cvf "%APP_NAME%.war" *
if errorlevel 1 (
    echo Erreur lors de la création du fichier WAR.
    cd ..
    pause
    exit /b 1
)
cd ..

:: Déploiement du fichier .war vers Tomcat
echo Déploiement vers Tomcat...

:: Suppression de l'ancienne version
if exist "%TOMCAT_DIR%\%APP_NAME%" (
    echo Suppression de l'ancienne version: %TOMCAT_DIR%\%APP_NAME%
    rmdir /s /q "%TOMCAT_DIR%\%APP_NAME%"
)

if exist "%TOMCAT_DIR%\%APP_NAME%.war" (
    echo Suppression de l'ancien WAR: %TOMCAT_DIR%\%APP_NAME%.war
    del "%TOMCAT_DIR%\%APP_NAME%.war"
)

:: Copie du nouveau WAR
copy "%BUILD_DIR%\%APP_NAME%.war" "%TOMCAT_DIR%\"
if errorlevel 1 (
    echo Erreur lors du déploiement vers Tomcat.
    pause
    exit /b 1
)

echo.
echo ========================================
echo   DÉPLOIEMENT TERMINÉ AVEC SUCCÈS !
echo ========================================
echo.
echo Application déployée: %APP_NAME%.war
echo Emplacement: %TOMCAT_DIR%
echo.
echo PROCHAINES ÉTAPES:
echo 1. Placez framework-web.jar dans:
echo    %TOMCAT_DIR%\%APP_NAME%\WEB-INF\lib\
echo 2. Redémarrez Tomcat
echo 3. Testez l'application:
echo.
echo    http://localhost:8080/%APP_NAME%/         (page d'accueil)
echo    http://localhost:8080/%APP_NAME%/hello    (intercepté)
echo    http://localhost:8080/%APP_NAME%/test/sample?id=42  (intercepté)
echo    http://localhost:8080/%APP_NAME%/api/users?action=list  (intercepté)
echo.
echo Le FrontServlet devrait forward vers result.jsp
echo ========================================

pause