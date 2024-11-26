-- 1- Afficher toutes les recettes disponibles (nom de la recette, catégorie et temps de préparation) triées de façon décroissante 
-- sur la durée de réalisation 

SELECT                                                       -- Spécifie les colonnes à extraire:
    category.category_name AS Catégorie,                     -- catégorie
    recipe.recipe_name AS Recette,                           -- nom de la recette
    recipe.preparation_time AS Temps_De_Préparation          -- temps de préparation

FROM                                                         -- Indique la table où chercher les données:
    category                                                 -- catégorie

INNER JOIN                                                  -- A partir du moment où tu fais une requête qui va rechercher des infos dans plusieurs
    recipe                                                  -- tables, il te faut des jointures (INNER JOIN dans notre cas)

ON                                                          
    recipe.id_category = category.id_category               -- Lien entre la table recipe et category via id_category

ORDER BY preparation_time DESC                              -- trie décroissant sur durée de réalisation



-- 2- En modifiant la requête précédente, faites apparaître le nombre d’ingrédients nécessaire par recette. 

SELECT 
    category.category_name AS Catégorie,
    recipe.recipe_name AS Recette,
    recipe.preparation_time AS Temps_De_Préparation,
    COUNT(recipe_ingredients.quantity) AS Quantité          -- Fonction SQL qui permet de compter ici ma quantité d'ingrédients par recette
FROM 
    category
INNER JOIN
    recipe
ON
    recipe.id_category = category.id_category               -- Lien entre la table recipe et category via id_category
INNER JOIN
    recipe_ingredients
ON
    recipe_ingredients.id_recipe = recipe.id_recipe         -- Lien entre la table recipe_ingredients et recipe via id_recipe

GROUP BY  id_recipe





SELECT 
    category.category_name AS Catégorie,
    recipe.recipe_name AS Recette,
    recipe.preparation_time AS Temps_De_Préparation,
    COUNT(recipe_ingredients.quantity) AS Quantité          
FROM 
    category
INNER JOIN
    recipe
ON
    recipe.id_category = category.id_category               
INNER JOIN
    recipe_ingredients
ON
    recipe_ingredients.id_recipe = recipe.id_recipe         

GROUP BY  id_recipe   -- HELP ici + est ce que le inner join est bon? j'ai un peude mal à trouver la logique epour l'instant



COUNT()
GROUP BY


-- 3- Afficher les recettes qui nécessitent au moins 30 min de préparation 

SELECT recipe_name, preparation_time FROM recipe
WHERE preparation_time >=30


-- 4- Afficher  les  recettes  dont  le  nom  contient  le  mot  « Salade »  (peu  importe  où  est  situé  le  mot  en question)

SELECT recipe_name, ingredient_name FROM ingredient

INNER JOIN
    recipe
ON
     = 

WHERE recipe_name LIKE '%Salade%';


-- HELP ici pareil j'ai du mal avec la logique du inner join 


-- 5- Insérer une nouvelle recette : « Pâtes à la carbonara » dont la durée de réalisation est de 20 min avec les instructions
--  de votre choix. Pensez à alimenter votre base  de données en conséquence  afin de pouvoir lister les détails de cette recettes (ingrédients) 


-- Ajout ingrédients 
INSERT INTO ingredient (ingredient_name, unity, price)
 VALUES
 ('Spaghetti', 'g', 0,003),
 ('Lardons fumés', 'g', 0,0133)
 ('Parmesan râpé', 'g', 0,025);

-- Ajout recette
INSERT INTO recipe (recipe_name, preparation_time, instructions, id_category)
 VALUES
 ('Pâtes à la carbonara', '20', 
'Faites cuire les spaghetti dans une grande casserole d’eau bouillante salée selon les instructions du paquet (environ 10 minutes).
Pendant ce temps, faites revenir les lardons fumés dans une poêle sans ajouter de matière grasse, jusqu’à ce qu’ils soient dorés.
Dans un bol, battez les œufs avec le parmesan râpé. Ajoutez une pincée de poivre.
Égouttez les pâtes en réservant un peu d’eau de cuisson.
Mélangez immédiatement les pâtes chaudes avec les lardons et le mélange œuf-parmesan. La chaleur des pâtes cuira légèrement les œufs, créant une sauce onctueuse. Si nécessaire, ajoutez un peu d’eau de cuisson pour ajuster la consistance.
Servez immédiatement avec du parmesan supplémentaire et du poivre au goût.', 2);

-- Ajout ingrédients dans recette
INSERT INTO recipe_ingredients (quantity, id_ingredient, id_recipe)
 VALUES
 (3, 19, 13),
 (400, 45, 13),
 (150, 46, 13),
 (100, 47, 13);


-- Question : si je ne précise pas le numéro pour l'id dans la partie "ajout ingrédients" et "ajout recette", est-ce que cela va mettre automatiquement le numéro suivant 
-- (par exemple le dernier est 10, il va mettre 11, 12 et 13 pour mes ingrédients?)
-- je ne l'ai pas testé pour ne pas faire n'importe quoi dans ma bdd



-- 6- Modifier  le  nom  de  la  recette  ayant  comme  identifiant  id_recette  =  3  (nom  de  la  recette  à  votre convenance) 

UPDATE recipe
SET recipe_name = 'Poulet au Citron et Herbes à la Provençale'
WHERE id_recipe = 3


-- 7- Supprimer la recette n°2 de la base de données 

DELETE FROM recipe
WHERE id_recipe = 2


-- 8- Afficher le prix total de la recette n°5 

SELECT SUM(price) FROM ingredient, recipe
WHERE id_recipe = 5


-- 9- Afficher le détail de la recette n°5 (liste des ingrédients, quantités et prix) 

SELECT id_ingredient, quantity, price FROM recipe_ingredients, ingredient 
WHERE id_recipe = 5

FINIR


-- 10- Ajouter un ingrédient en base de données : Poivre, unité : cuillère à café, prix : 2.5 €

INSERT INTO ingredient (ingredient_name, unity, price)
 VALUES
 ('Poivre', 'cuillère à café', 2,5);
 

-- 11- Modifier le prix de l’ingrédient n°12 (prix à votre convenance) 

UPDATE ingredient
SET price = 0,80
WHERE id_ingredient = 12


-- 12- Afficher le nombre de recettes par catégories : X entrées, Y plats, Z desserts 



-- 13- Afficher les recettes qui contiennent l’ingrédient « Poulet » 



-- 14- Mettez à jour toutes les recettes en diminuant leur temps de préparation de 5 minutes  



-- 15- Afficher les recettes qui ne nécessitent pas d’ingrédients coûtant plus de 2€ par unité de mesure 



-- 16- Afficher la / les recette(s) les plus rapides à préparer 



-- 17- Trouver les recettes qui ne nécessitent aucun ingrédient (par exemple la recette de la tasse d’eau chaude qui consiste à verser de l’eau chaude dans une tasse) 


-- 18- Trouver les ingrédients qui sont utilisés dans au moins 3 recettes 


-- 19- Ajouter un nouvel ingrédient à une recette spécifique 


-- 20- Bonus : Trouver la recette la plus coûteuse de la base de données (il peut y avoir des ex aequo, il est donc exclu d’utiliser la clause LIMIT) 


 
