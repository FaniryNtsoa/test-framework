# test-app

Application de test pour le framework-web avec FrontServlet.

## Description

Cette application de test est conçue pour tester un mini-framework externe (`framework-web`) qui contient un `FrontServlet` interceptant certaines requêtes HTTP et les forwardant vers une JSP de résultat.

## Structure du projet

```
test-app/
├── src/
│   └── main/
│       ├── java/          (vide - pas de code côté test)
│       └── webapp/
│           ├── index.jsp   (page d'accueil avec liens de test)
│           └── WEB-INF/
│               ├── web.xml (configuration minimale)
│               └── lib/    (placez framework-web.jar ici)
├── pom.xml                 (configuration Maven)
├── build.bat              (script de déploiement)
└── README.md
```

## Prérequis

- Java 17
- Maven 3.6+
- Apache Tomcat 10.1.28
- Le fichier `framework-web.jar` compilé

## Installation et déploiement

### 1. Préparation de servlet-api.jar

Exécutez d'abord le script de setup :

```cmd
setup-servlet-api.bat
```

Ou copiez manuellement :
```cmd
copy "C:\path\to\tomcat\lib\servlet-api.jar" lib\
```

### 2. Build et déploiement

Exécutez le script batch :

```cmd
build.bat
```

Ce script :
- Vérifie la présence de servlet-api.jar
- Compile le projet (s'il y a du code Java)
- Crée la structure WAR
- Package en fichier WAR
- Déploie vers Tomcat

### 3. Installation du framework

1. Compilez votre `framework-web` en JAR
2. Copiez `framework-web.jar` dans `webapps/test-app/WEB-INF/lib/`
3. Redémarrez Tomcat

## Tests

Une fois déployé, testez les URLs suivantes :

- **http://localhost:8080/test-app/** - Page d'accueil HTML (non interceptée)
- **http://localhost:8080/test-app/hello** - Intercepté → forward vers result.jsp
- **http://localhost:8080/test-app/test/sample?id=42** - Intercepté avec paramètres
- **http://localhost:8080/test-app/api/users?action=list** - Intercepté API

## Comportement attendu

### Page d'accueil (index.html)
- Affiche les informations du projet
- Fournit des liens de test stylisés
- N'est PAS interceptée par le FrontServlet

### Pages interceptées par le FrontServlet
Le FrontServlet intercepte les URLs configurées dans web.xml :
- `/hello`
- `/test/*`
- `/api/*` 
- `/admin/*`

Pour chaque interception :
1. Le FrontServlet définit les attributs `interceptedURL` et `message`
2. Forward vers `/WEB-INF/views/result.jsp`
3. La JSP affiche :
   - ✅ Message "Framework a intercepté l'URL : ..."
   - Toutes les informations de requête (méthode, URI, paramètres, etc.)
   - Informations client (IP, User-Agent, etc.)
   - Timestamp
   - Interface stylisée et responsive

## Configuration

### pom.xml
- Java 17
- Packaging WAR
- Dépendances Jakarta EE (Servlet API, JSP API)
- Plugin Maven pour Tomcat

### web.xml
- Configuration minimale avec `display-name`
- Page d'accueil : `index.jsp`

## Dépannage

### Le WAR ne se déploie pas
- Vérifiez que Tomcat est démarré
- Vérifiez les logs Tomcat dans `logs/catalina.out`
- Assurez-vous que Java 17 est utilisé

### Le FrontController ne fonctionne pas
- Vérifiez que `framework-web.jar` est dans `WEB-INF/lib/`
- Redémarrez Tomcat après avoir ajouté le JAR
- Vérifiez que le FrontController a l'annotation `@WebServlet("/*")`

### Erreurs de compilation
- Vérifiez que `JAVA_HOME` pointe vers Java 17
- Exécutez `mvn clean` puis `mvn package`

## Auteur

Projet créé pour tester le framework-web avec FrontController.