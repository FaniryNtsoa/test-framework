# Répertoire lib pour les dépendances externes

## Instructions

Placez le fichier `framework-web.jar` dans ce répertoire après avoir :

1. Compilé votre projet framework-web
2. Généré le fichier JAR
3. Déployé test-app sur Tomcat

### Étapes détaillées :

1. **Compiler le framework-web :**
   ```bash
   cd /path/to/framework-web
   mvn clean package
   ```

2. **Copier le JAR généré :**
   ```bash
   cp target/framework-web-1.0.0.jar /path/to/tomcat/webapps/test-app/WEB-INF/lib/
   ```

3. **Redémarrer Tomcat pour charger le nouveau JAR**

### Vérification

Le FrontController doit avoir l'annotation `@WebServlet("/*")` pour intercepter toutes les requêtes.

### Structure attendue après déploiement :
```
webapps/test-app/WEB-INF/lib/
└── framework-web.jar
```