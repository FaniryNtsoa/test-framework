# Répertoire lib pour servlet-api.jar

## Instructions pour obtenir servlet-api.jar

### Option 1 : Copier depuis Tomcat
```cmd
copy "C:\Users\fanir\Documents\utils\tomcat-10.1.28-windows-x64\apache-tomcat-10.1.28\lib\servlet-api.jar" lib\
```

### Option 2 : Télécharger depuis Maven Central
Téléchargez `jakarta.servlet-api-6.0.0.jar` depuis :
https://repo1.maven.org/maven2/jakarta/servlet/jakarta.servlet-api/6.0.0/

Renommez-le en `servlet-api.jar` et placez-le dans ce dossier.

### Option 3 : Utiliser Maven pour télécharger
```cmd
mvn dependency:copy-dependencies -DoutputDirectory=lib
```

## Structure attendue
```
lib/
└── servlet-api.jar
```

## Vérification
Le script build.bat vérifiera automatiquement la présence de ce fichier avant la compilation.