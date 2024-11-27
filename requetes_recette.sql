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
    COUNT(recipe_ingredients.id_recipe) AS nbIngredients    -- Fonction SQL qui permet de compter ici ma quantité d'ingrédients par recette
FROM                                                        -- On compte combien de fois "id_recipe" apparaît dans la table associative "recipe_ingredients" pour savoir le nombre d'ingrédients par recette
    category
INNER JOIN
    recipe
ON
    recipe.id_category = category.id_category               -- Lien entre la table recipe et category via id_category
INNER JOIN
    recipe_ingredients
ON
    recipe_ingredients.id_recipe = recipe.id_recipe         -- Lien entre la table recipe_ingredients et recipe via id_recipe

GROUP BY 
    recipe.id_recipe,                                       -- ici on veut regrouper les ingrédients par recette (unique)
    Catégorie,                                              -- ensuite on ajoute les colonnes car elles sont dans SELECT mais ne sont pas avec une fonction d'aggrégation (ici COUNT)
    Recette,
    Temps_De_Préparation;


-- 3- Afficher les recettes qui nécessitent au moins 30 min de préparation 

SELECT recipe_name, preparation_time FROM recipe
WHERE preparation_time >=30


-- 4- Afficher  les  recettes  dont  le  nom  contient  le  mot  « Salade »  (peu  importe  où  est  situé  le  mot  en question)

SELECT recipe_name

FROM recipe

WHERE recipe_name LIKE '%Salade%';


-- 5- Insérer une nouvelle recette : « Pâtes à la carbonara » dont la durée de réalisation est de 20 min avec les instructions
--  de votre choix. Pensez à alimenter votre base  de données en conséquence  afin de pouvoir lister les détails de cette recettes (ingrédients) 


-- Ajout ingrédients 
INSERT INTO ingredient (id_ingredient, ingredient_name, unity, price)
 VALUES
 (46, 'Spaghetti', 'g', 0.003),
 (47, 'Lardons fumés', 'g', 0.0133)
 (48, 'Parmesan râpé', 'g', 0.025);

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
 (400, 46, 13),
 (150, 47, 13),
 (100, 48, 13);


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

SELECT 
    ingredient.ingredient_name AS Nom_Ingrédient,
    recipe_ingredients.quantity AS Quantité,
    ingredient.price AS Prix
FROM 
    recipe_ingredients
INNER JOIN 
    ingredient
ON 
    recipe_ingredients.id_ingredient = ingredient.id_ingredient         -- Lien entre la table recipe_ingredients et ingredient via id_ingredient 
WHERE 
    id_recipe = 5;


-- 10- Ajouter un ingrédient en base de données : Poivre, unité : cuillère à café, prix : 2.5 €

INSERT INTO ingredient (ingredient_name, unity, price)
 VALUES
 ('Poivre', 'cuillère à café', 2,5);
 

-- 11- Modifier le prix de l’ingrédient n°12 (prix à votre convenance) 

UPDATE ingredient
SET price = 0,80
WHERE id_ingredient = 12


-- 12- Afficher le nombre de recettes par catégories : X entrées, Y plats, Z desserts 

SELECT 
    category.category_name AS Catégorie,
    COUNT(recipe.id_category) AS nbRecetteParCatégorie      
FROM                                                        
    category
INNER JOIN
    recipe
ON
    recipe.id_category = category.id_category               
GROUP BY 
    recipe.id_category,                                       
    Catégorie;                                             


-- 13- Afficher les recettes qui contiennent l’ingrédient « Oeuf » 

SELECT 
    recipe.recipe_name AS Recette,                          -- recipe (puisqu'on a besoin d'afficher recipe_name)
    ingredient.ingredient_name AS Nom_Ingrédient,           -- ingredient (puisqu'on travaille sur le nom de l'ingrédient)
    recipe_ingredients.quantity AS Quantité                 -- recipe_ingredients qui fait le lien entre les tables recipe et ingredient
                                                            -- donc -> 3 tables = 2 jointures
FROM 
    recipe                              
INNER JOIN                                                  -- Il faut repérer les champs communs entre les tables 
    recipe_ingredients
ON 
    recipe.id_recipe = recipe_ingredients.id_recipe                     -- Entre recipe et recipe_ingredients c'est "id_recipe"          
INNER JOIN 
    ingredient
ON 
    recipe_ingredients.id_ingredient = ingredient.id_ingredient         -- Entre ingredient et recipe_ingredients c'est "id_ingredients"
WHERE 
    ingredient_name LIKE '%Oeuf%';


-- 14- Mettez à jour toutes les recettes en diminuant leur temps de préparation de 5 minutes  

UPDATE recipe
SET preparation_time = preparation_time - 5


-- 15- Afficher les recettes qui ne nécessitent pas d’ingrédients coûtant plus de 2€ par unité de mesure 

SELECT DISTINCT
    recipe.recipe_name AS Recette,                          -- recipe (puisqu'on a besoin d'afficher recipe_name)
    ingredient.ingredient_name AS Nom_Ingrédient,           -- ingredient (puisqu'on travaille sur le nom de l'ingrédient)
    ingredient.unity AS Unité_De_Mesure,                    -- ingredient (unité de mesure)
    ingredient.price AS Prix,                               -- ingredient (prix)
    recipe_ingredients.quantity AS Quantité                 -- recipe_ingredients qui fait le lien entre les tables recipe et ingredient
FROM                                                        -- donc -> 3 tables = 2 jointures
    recipe                              
INNER JOIN                                                              -- Il faut repérer les champs communs entre les tables 
    recipe_ingredients
ON 
    recipe.id_recipe = recipe_ingredients.id_recipe                     -- Entre recipe et recipe_ingredients c'est "id_recipe"          
INNER JOIN 
    ingredient
ON 
    recipe_ingredients.id_ingredient = ingredient.id_ingredient         -- Entre ingredient et recipe_ingredients c'est "id_ingredients"
WHERE 
    ingredient.price <=2
GROUP BY 
    recipe.id_recipe,                                 -- ici on veut regrouper les ingrédients par recette (unique)      
    Nom_Ingrédient,                                             
    Unité_De_Mesure,
    Prix,
    Quantité;   


-- 16- Afficher la / les recette(s) les plus rapides à préparer 

SELECT recipe_name, preparation_time FROM recipe
WHERE preparation_time <=15


-- 17- Trouver les recettes qui ne nécessitent aucun ingrédient (par exemple la recette de la tasse d’eau chaude qui consiste à verser de l’eau chaude dans une tasse) 





-- 18- Trouver les ingrédients qui sont utilisés dans au moins 3 recettes 





-- 19- Ajouter un nouvel ingrédient à une recette spécifique 

-- Ajout ingrédient
INSERT INTO ingredient (id_ingredient, ingredient_name, unity, price)
 VALUES
 (45, 'Emmental rapé', 'g', 0.02)

-- Ajout ingrédient dans recette
INSERT INTO recipe_ingredients (quantity, id_ingredient, id_recipe)
 VALUES
 (10, 45, 4);


-- 20- Bonus : Trouver la recette la plus coûteuse de la base de données (il peut y avoir des ex aequo, il est donc exclu d’utiliser la clause LIMIT) 


 
