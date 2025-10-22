# TP : Gestion des données d'un aéroport en XML, DTD et XSD

## Description

Ce dépôt contient l'ensemble des fichiers relatifs au TP de gestion des données d'un aéroport. L'objectif est de structurer les informations sur les compagnies, avions, employés, pistes et vols en XML, de les valider avec DTD et XSD, et de pratiquer des requêtes XPath et XQuery pour extraire et analyser les données.

Le projet est accompagné d'un compte rendu détaillé expliquant la méthodologie et les résultats obtenus.

## Contenu du dépôt

* `aeroport.xml` : fichier XML principal contenant toutes les données de l'aéroport.
* `aeroport.dtd` : DTD pour valider la structure de base du XML.
* `aeroport.xsd` : XML Schema pour une validation stricte et précise.
* `validate_dtd.php` : script PHP pour valider le XML avec la DTD.
* `validate_xsd.php` : script PHP pour valider le XML avec le XSD.
* `aeroport_queries.xq` : fichier contenant les requêtes XQuery du TP.
* `requetes_aeroport.xq` : fichier contenant les requêtes XQuery supplémentaires ou alternatives.
* `README.md` : ce fichier.
* `Compte_Rendu_TP.docx` : document Word contenant le compte rendu complet et humanisé du TP.

## Structure des données XML

* **Compagnies aériennes** : `<compagnie>` avec nom, pays, code IATA et identifiant unique.
* **Pistes** : `<piste>` avec numéro, longueur, localisation et identifiant.
* **Avions** : `<avion>` avec modèle, capacité, immatriculation et identifiant.
* **Employés** : `<employe>` avec nom, prénom, âge, rôle et identifiant.
* **Vols** : `<vol>` avec numéro, date, destination, et références vers compagnie, avion, piste et employés.

## Instructions pour exécuter le TP

1. **Cloner le dépôt** :

```bash
git clone <URL_DU_DEPOT>
```

2. **Ouvrir le fichier XML** dans BaseX ou tout autre éditeur XML.

3. **Valider le XML** :

   * Avec DTD (via PHP) :

   ```bash
   php validate_dtd.php
   ```

   * Avec XSD (via PHP) :

   ```bash
   php validate_xsd.php
   ```

4. **Exécuter les requêtes XPath et XQuery** pour tester l'extraction des données.

   * XQuery depuis `aeroport_queries.xq` ou `requetes_aeroport.xq`.

## Exemples de requêtes

* XPath pour récupérer toutes les dates de vols :

```xpath
/aeroport/vols/vol/date
```

* XQuery pour lister les vols Air France après le 1er janvier 2023 :

```xquery
let $root := doc("aeroport.xml")/aeroport
let $afId := $root/compagnies/compagnie[nom="Air France"]/@id/string()
for $v in $root/vols/vol
where $v/compagnieRef = $afId
  and xs:date($v/date) > xs:date("2023-01-01")
return $v
```

## Auteur

* Mehdi Laktati, Master 2 en MIASHS option WA.

## Licence

Ce projet est fourni à des fins pédagogiques. Toute utilisation ou reproduction doit ci

