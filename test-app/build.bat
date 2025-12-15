@echo off
setlocal

:: Paramétrage projet / Tomcat
set "APP_NAME=test-app"
set "PROJECT_DIR=%~dp0"
set "TOMCAT_DIR=C:\Users\fanir\Documents\utils\tomcat-10.1.28-windows-x64\apache-tomcat-10.1.28\webapps"
set "WAR_FILE=target\%APP_NAME%.war"

echo.
echo ========================================
echo   BUILD ET DEPLOIEMENT %APP_NAME%
echo ========================================
echo.

echo [1/3] Compilation Maven (mvn clean package)
pushd "%PROJECT_DIR%" >nul
if errorlevel 1 goto :push_fail

call mvn clean package
if errorlevel 1 goto :maven_fail

popd >nul

if not exist "%PROJECT_DIR%%WAR_FILE%" goto :missing_war

echo [2/3] Nettoyage des artefacts Tomcat existants
if exist "%TOMCAT_DIR%\%APP_NAME%" rmdir /s /q "%TOMCAT_DIR%\%APP_NAME%"
if exist "%TOMCAT_DIR%\%APP_NAME%.war" del "%TOMCAT_DIR%\%APP_NAME%.war"

echo [3/3] Copie du WAR vers Tomcat
copy "%PROJECT_DIR%%WAR_FILE%" "%TOMCAT_DIR%\" >nul
if errorlevel 1 goto :copy_fail

echo.
echo ========================================
echo   DÉPLOIEMENT TERMINÉ AVEC SUCCÈS !
echo ========================================
echo WAR copié dans: %TOMCAT_DIR%\%APP_NAME%.war
echo Pensez à redémarrer Tomcat avant de tester.
echo.

pause
exit /b 0

:push_fail
echo ÉCHEC: impossible d'accéder au dossier projet (%PROJECT_DIR%).
pause
exit /b 1

:maven_fail
echo ÉCHEC: Maven n'a pas réussi la compilation.
popd >nul
pause
exit /b 1

:missing_war
popd >nul
echo ÉCHEC: WAR introuvable (%PROJECT_DIR%%WAR_FILE%).
pause
exit /b 1

:copy_fail
echo ÉCHEC: impossible de copier le WAR vers Tomcat.
pause
exit /b 1