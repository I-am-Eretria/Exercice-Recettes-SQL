# Exercice SQL Recettes 💻 #
## - Modéliser la base de données et définir des requêtes - ##

<br>


### Objectif : ###
***Modéliser la base de données et définir des requêtes.***

Vous avez la charge de modéliser une base de données permettant de mettre en place des recettes de 
cuisine. Une recette sera caractérisée par un nom, un temps de préparation (en minutes) et des instructions. 
Chaque recette contiendra des ingrédients avec une certaine quantité, une unité de mesure et on pourra 
définir le prix de chaque ingrédient. Chaque recette appartiendra à une catégorie unique : entrée, plat ou 
dessert.

 
→ Pour cela il faudra : 
      <ul>
        <li>Réaliser le modèle conceptuel de données (MCD) de l'application.</li>
        <br>
        <li>Déduire le modèle logique de données (MLD) afin d’y faire apparaître les clés étrangères et les 
            éventuelles tables associatives s’il devait y en avoir.</li>
        <br>
        <li>Mettre en place la base de données sur HeidiSQL et l’alimenter en conséquence avec au moins 10 recettes.</li>
        <br>
        <li>Enfin il faudra définir les 20 requêtes suivantes :</li>
            <ul>
                <br>
                <li>1- Afficher toutes les recettes disponibles (nom de la recette, catégorie et temps de préparation) triées 
                    de façon décroissante sur la durée de réalisation</li>
                <li>2- En modifiant la requête précédente, faites apparaître le nombre d’ingrédients nécessaire par recette.</li>
                <li>3- Afficher les recettes qui nécessitent au moins 30 min de préparation</li>
                <li>4- Afficher les recettes dont le nom contient le mot « Salade » (peu importe où est situé le mot en 
                    question)</li>
                <li>5- Insérer une nouvelle recette : « Pâtes à la carbonara » dont la durée de réalisation est de 20 min avec 
                    les instructions de votre choix. Pensez à alimenter votre base de données en conséquence afin de 
                    pouvoir lister les détails de cette recettes (ingrédients)</li>
                <li>6- Modifier le nom de la recette ayant comme identifiant id_recette = 3 (nom de la recette à votre 
                    convenance)</li>
                <li>7- Supprimer la recette n°2 de la base de données</li>
                <li>8- Afficher le prix total de la recette n°5</li>
                <li>9- Afficher le détail de la recette n°5 (liste des ingrédients, quantités et prix)</li>
                <li>10- Ajouter un ingrédient en base de données : Poivre, unité : cuillère à café, prix : 2.5 €</li>
                <li>11- Modifier le prix de l’ingrédient n°12 (prix à votre convenance)</li>
                <li>12- Afficher le nombre de recettes par catégories : X entrées, Y plats, Z desserts</li>
                <li>13- Afficher les recettes qui contiennent l’ingrédient « Poulet »</li>
                <li>14- Mettez à jour toutes les recettes en diminuant leur temps de préparation de 5 minutes</li>
                <li>15- Afficher les recettes qui ne nécessitent pas d’ingrédients coûtant plus de 2€ par unité de mesure</li>
                <li>16- Afficher la / les recette(s) les plus rapides à préparer</li>
                <li>17- Trouver les recettes qui ne nécessitent aucun ingrédient (par exemple la recette de la tasse d’eau 
                    chaude qui consiste à verser de l’eau chaude dans une tasse)</li>
                <li>18- Trouver les ingrédients qui sont utilisés dans au moins 3 recettes</li>
                <li>19- Ajouter un nouvel ingrédient à une recette spécifique</li>
                <li>20- Bonus : Trouver la recette la plus coûteuse de la base de données (il peut y avoir des ex aequo, il est 
                    donc exclu d’utiliser la clause LIMIT)</li>
            </ul>
        </ul>
<br>

### ⚙️ Langages utilisés ⚙️ ###

<img src="https://skillicons.dev/icons?i=mysql,github"/>

<br>

### Modélisation : ###
<img src="Modélisation/MCD Looping.png"></img>
<img src="Modélisation/MLD Looping.png"></img>

<br>

*Note : exercice fourni par <a href="https://elan-formation.fr/accueil">Elan Formation</a>*