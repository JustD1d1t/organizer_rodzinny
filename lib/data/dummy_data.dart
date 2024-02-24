import "package:flutter/material.dart";
import "package:organizer_rodzinny/models/Ingredient.dart";
import 'package:organizer_rodzinny/models/recipe.dart';
import "package:organizer_rodzinny/models/shopping_list.dart";
import "package:organizer_rodzinny/models/shopping_list_item.dart";
import 'package:organizer_rodzinny/models/tile.dart';

final availableTiles = [
  Tile(
    icon: const Icon(Icons.list),
    title: "Listy",
    subtitle: "Lista zakupów i planów",
    name: 'list',
  ),
  Tile(
    icon: const Icon(Icons.savings),
    title: "Finanse",
    subtitle: "Budżet domowy",
    name: 'finances',
  ),
  Tile(
    icon: const Icon(Icons.flatware),
    title: "Posiłki",
    subtitle: "Zaplanuj posiłki",
    name: 'meals',
  ),
  Tile(
    icon: const Icon(Icons.receipt_long),
    title: "Przepisy",
    subtitle: "Zaplanuj przepisy",
    name: 'recipes',
  ),
  Tile(
    icon: const Icon(Icons.receipt),
    title: "Paragony",
    subtitle: "Twoje paragony",
    name: 'receipts',
  ),
  Tile(
    icon: const Icon(Icons.notes),
    title: "Notatki",
    subtitle: "Twoje notatki",
    name: 'notes',
  ),
  Tile(
    icon: const Icon(Icons.shopping_bag),
    title: "Lista zakupów",
    subtitle: "Zaplanuj zakupy",
    name: 'shopping',
  ),
  Tile(
    icon: const Icon(Icons.inventory),
    title: "Spiżarnia",
    subtitle: "Twoja spiżarnia",
    name: 'pantry',
  ),
];

final availableRecipes = [
  Recipe(
    name: "Kotlety schabowe",
    description: "Kotlety schabowe z ziemniakami i surówką z marchewki",
    ingredients: [
      ShoppingRecipeIngredient(
          name: "Schab", amount: 1, unit: "kg", checked: false),
      ShoppingRecipeIngredient(
          name: "Ziemniaki", amount: 1, unit: "kg", checked: false),
      ShoppingRecipeIngredient(
          name: "Marchewka", amount: 1, unit: "kg", checked: false),
      ShoppingRecipeIngredient(
          name: "Bułka tarta", amount: 1, unit: "kg", checked: false),
      ShoppingRecipeIngredient(
          name: "Jajko", amount: 1, unit: "szt", checked: false),
      ShoppingRecipeIngredient(
          name: "Mąka", amount: 1, unit: "kg", checked: false),
      ShoppingRecipeIngredient(
          name: "Sól", amount: 1, unit: "szczypta", checked: false),
      ShoppingRecipeIngredient(
          name: "Pieprz", amount: 1, unit: "szczypta", checked: false),
      ShoppingRecipeIngredient(
          name: "Olej", amount: 1, unit: "l", checked: false),
    ],
    steps: [
      "Schab umyć, osuszyć, pokroić w plastry, rozbić tłuczkiem do mięsa, posolić, popieprzyć",
      "Bułkę tartą wymieszać z mąką, posolić, popieprzyć",
      "Jajko roztrzepać widelcem",
      "Kotlety obtoczyć w jajku, następnie w bułce tartej",
      "Na patelni rozgrzać olej, smażyć kotlety z obu stron na złoty kolor",
      "Ziemniaki obrać, umyć, pokroić w plastry, ugotować w osolonej wodzie",
      "Marchewkę obrać, umyć, zetrzeć na tarce o grubych oczkach",
      "Ziemniaki odcedzić, podawać z kotletami i surówką z marchewki",
    ],
  ),
  Recipe(
    name: "Kotlety mielone",
    description: "Kotlety mielone z ziemniakami i surówką z marchewki",
    ingredients: [
      ShoppingRecipeIngredient(
          name: "Mięso", amount: 1, unit: "kg", checked: false),
      ShoppingRecipeIngredient(
          name: "Ziemniaki", amount: 1, unit: "kg", checked: false),
      ShoppingRecipeIngredient(
          name: "Marchewka", amount: 1, unit: "kg", checked: false),
      ShoppingRecipeIngredient(
          name: "Bułka tarta", amount: 1, unit: "kg", checked: false),
      ShoppingRecipeIngredient(
          name: "Jajko", amount: 1, unit: "szt", checked: false),
      ShoppingRecipeIngredient(
          name: "Mąka", amount: 1, unit: "kg", checked: false),
      ShoppingRecipeIngredient(
          name: "Sól", amount: 1, unit: "szczypta", checked: false),
      ShoppingRecipeIngredient(
          name: "Pieprz", amount: 1, unit: "szczypta", checked: false),
      ShoppingRecipeIngredient(
          name: "Olej", amount: 1, unit: "l", checked: false),
    ],
    steps: [
      "Mięso mielone wymieszać z jajkiem, posolić, popieprzyć",
      "Bułkę tartą wymieszać z mąką, posolić, popieprzyć",
      "Jajko roztrzepać widelcem",
      "Kotlety obtoczyć w jajku, następnie w bułce tartej",
      "Na patelni rozgrzać olej, smażyć kotlety z obu stron na złoty kolor",
      "Ziemniaki obrać, umyć, pokroić w plastry, ugotować w osolonej wodzie",
      "Marchewkę obrać, umyć, zetrzeć na tarce o grubych oczkach",
      "Ziemniaki odcedzić, podawać z kotletami i surówką z marchewki",
    ],
  ),
];

final exampleShoppingLists = [
  ShoppingList(
    name: "Biedronka",
    list: [
      ShoppingListItem(
        name: "Bułki",
        // quantity: 2,
        // unit: "szt",
        checked: false,
        category: "Pieczywo",
      ),
      ShoppingListItem(
        name: "Mleko",
        // quantity: 1,
        // unit: "l",
        checked: false,
        category: "Nabiał",
      ),
      ShoppingListItem(
        name: "Jogurt",
        // quantity: 2,
        // unit: "",
        checked: false,
        category: "Nabiał",
      ),
      ShoppingListItem(
        name: "Ser",
        // quantity: null,
        // unit: "kg",
        checked: false,
        category: null,
      ),
      ShoppingListItem(
        name: "Szynka",
        // quantity: 0.5,
        // unit: null,
        checked: false,
        category: null,
      ),
      ShoppingListItem(
        name: "Pomidory",
        // quantity: null,
        // unit: null,
        checked: false,
        category: "Warzywa",
      ),
      ShoppingListItem(
        name: "Ogórki",
        // quantity: 1,
        // unit: "kg",
        checked: false,
        category: "Warzywa",
      ),
      ShoppingListItem(
        name: "Papryka",
        // quantity: 1,
        // unit: "kg",
        checked: false,
        category: "Warzywa",
      ),
      ShoppingListItem(
        name: "Cebula",
        // quantity: 1,
        // unit: "kg",
        checked: false,
        category: "Warzywa",
      ),
      ShoppingListItem(
        name: "Marchewka",
        // quantity: 1,
        // unit: "kg",
        checked: false,
        category: "Warzywa",
      ),
      ShoppingListItem(
        name: "Ziemniaki",
        // quantity: 2,
        // unit: "kg",
        checked: false,
        category: "Warzywa",
      ),
      ShoppingListItem(
        name: "Chleb",
        // quantity: 1,
        // unit: "szt",
        checked: false,
        category: "Pieczywo",
      ),
      ShoppingListItem(
        name: "Mąka",
        // quantity: 1,
        // unit: "kg",
        checked: false,
        category: "Produkty sypkie",
      ),
      ShoppingListItem(
        name: "Makaron",
        // quantity: 1,
        // unit: "kg",
        checked: false,
        category: "Produkty sypkie",
      ),
    ],
    recipesList: [
      ShoppingRecipeItem(
        name: "Kotleciki z jajek a la carbonara",
        description: null,
        ingredients: [
          ShoppingRecipeIngredient(
              name: "wędzony szynka", amount: 100.0, unit: "g", checked: false),
          ShoppingRecipeIngredient(
              name: "jajka", amount: 4.0, unit: "szt", checked: false),
          ShoppingRecipeIngredient(
              name: "ser parmezan", amount: 50.0, unit: "g", checked: false),
          ShoppingRecipeIngredient(
              name: "śmietana", amount: 200.0, unit: "ml", checked: false),
          ShoppingRecipeIngredient(
              name: "makaron spaghetti",
              amount: 400.0,
              unit: "g",
              checked: false),
          ShoppingRecipeIngredient(
              name: "masło", amount: 50.0, unit: "g", checked: false),
          ShoppingRecipeIngredient(
              name: "sól", amount: 1.0, unit: "szczypta", checked: false),
          ShoppingRecipeIngredient(
              name: "pieprz", amount: 1.0, unit: "szczypta", checked: false),
        ],
        checked: false,
      )
    ],
  )
];

final availableBudget = {
  "budget": 4000.0,
  "spent": 2000.0,
  "remainingBudget": 2000.0,
  "categories": [
    {
      "name": "Jedzenie",
      "budget": 1000.0,
      "spent": 400.0,
    },
    {
      "name": "Rachunki",
      "budget": 1000.0,
      "spent": 300.0,
    },
    {
      "name": "Rozrywka",
      "budget": 1000.0,
      "spent": 200.0,
    },
    {
      "name": "Inne",
      "budget": 1000.0,
      "spent": 500.0,
    },
  ],
};
