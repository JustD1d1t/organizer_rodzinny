import "package:flutter/material.dart";
import "package:organizer_rodzinny/models/Ingredient.dart";
import 'package:organizer_rodzinny/models/recipe.dart';
import 'package:organizer_rodzinny/models/tile.dart';

final availableTiles = [
  // Tile(
  //   icon: const Icon(Icons.list),
  //   title: "Listy",
  //   subtitle: "Lista zakupów i planów",
  //   name: 'list',
  // ),
  // Tile(
  //   icon: const Icon(Icons.savings),
  //   title: "Finanse",
  //   subtitle: "Budżet domowy",
  //   name: 'finances',
  // ),
  // Tile(
  //   icon: const Icon(Icons.flatware),
  //   title: "Posiłki",
  //   subtitle: "Zaplanuj posiłki",
  //   name: 'meals',
  // ),
  // Tile(
  //   icon: const Icon(Icons.receipt_long),
  //   title: "Przepisy",
  //   subtitle: "Zaplanuj przepisy",
  //   name: 'recipes',
  // ),
  // Tile(
  //   icon: const Icon(Icons.receipt),
  //   title: "Paragony",
  //   subtitle: "Twoje paragony",
  //   name: 'receipts',
  // ),
  // Tile(
  //   icon: const Icon(Icons.notes),
  //   title: "Notatki",
  //   subtitle: "Twoje notatki",
  //   name: 'notes',
  // ),
  Tile(
    icon: const Icon(Icons.shopping_bag),
    title: "Lista zakupów",
    subtitle: "Zaplanuj zakupy",
    name: 'shopping',
  ),
  // Tile(
  //   icon: const Icon(Icons.inventory),
  //   title: "Spiżarnia",
  //   subtitle: "Twoja spiżarnia",
  //   name: 'pantry',
  // ),
];

final availableCategories = [
  {
    'name': "Napoje",
    'items': [
      {
        'name': 'Ale',
        'category': 'Napoje',
        'checked': false,
        'icon': const Icon(Icons.local_drink_sharp)
      },
      {
        'name': 'Białe wino',
        'category': 'Napoje',
        'checked': false,
        'icon': const Icon(Icons.local_drink_sharp)
      },
      {
        'name': 'Cola',
        'category': 'Napoje',
        'checked': false,
        'icon': const Icon(Icons.local_drink_sharp)
      },
      {
        'name': 'Czerwone wino wytrawne',
        'category': 'Napoje',
        'checked': false,
        'icon': const Icon(Icons.local_drink_sharp)
      },
    ]
  },
  {
    'name': "Owoce i Warzywa",
    'items': [
      {
        'name': 'Pomidor',
        'category': 'Owoce i Warzywa',
        'checked': false,
        'icon': const Icon(Icons.apple)
      },
      {
        'name': 'Ogórek',
        'category': 'Owoce i Warzywa',
        'checked': false,
        'icon': const Icon(Icons.apple)
      },
      {
        'name': 'Marchewka',
        'category': 'Owoce i Warzywa',
        'checked': false,
        'icon': const Icon(Icons.apple)
      },
      {
        'name': 'Jabłko',
        'category': 'Owoce i Warzywa',
        'checked': false,
        'icon': const Icon(Icons.apple)
      },
    ]
  },
  {
    'name': "Chleb i inne wypieki",
    'items': [
      {
        'name': 'Chleb',
        'category': 'Chleb i inne wypieki',
        'checked': false,
        'icon': const Icon(Icons.breakfast_dining)
      },
      {
        'name': 'Bułka',
        'category': 'Chleb i inne wypieki',
        'checked': false,
        'icon': const Icon(Icons.breakfast_dining)
      },
      {
        'name': 'Pączek',
        'category': 'Chleb i inne wypieki',
        'checked': false,
        'icon': const Icon(Icons.breakfast_dining)
      },
    ]
  },
  {
    'name': "Mleko i ser",
    'items': [
      {
        'name': 'Mleko',
        'category': 'Mleko i ser',
        'checked': false,
        'icon': const Icon(Icons.cottage)
      },
      {
        'name': 'Ser',
        'category': 'Mleko i ser',
        'checked': false,
        'icon': const Icon(Icons.cottage)
      }
    ]
  },
  {
    'name': "Mięso i ryba",
    'items': [
      {
        'name': 'Kurczak',
        'category': 'Mięso i ryba',
        'checked': false,
        'icon': const Icon(Icons.fastfood)
      },
      {
        'name': 'Wołowina',
        'category': 'Mięso i ryba',
        'checked': false,
        'icon': const Icon(Icons.fastfood)
      },
      {
        'name': 'Łosoś',
        'category': 'Mięso i ryba',
        'checked': false,
        'icon': const Icon(Icons.fastfood)
      },
    ]
  },
  {
    'name': "Składniki i przyprawy",
    'items': [
      {
        'name': 'Mąka',
        'category': 'Składniki i przyprawy',
        'checked': false,
        'icon': const Icon(Icons.restaurant)
      },
      {
        'name': 'Cukier',
        'category': 'Składniki i przyprawy',
        'checked': false,
        'icon': const Icon(Icons.restaurant)
      },
      {
        'name': 'Sól',
        'category': 'Składniki i przyprawy',
        'checked': false,
        'icon': const Icon(Icons.restaurant)
      },
    ]
  },
  {
    'name': "Mrożonki i garmażeria",
    'items': [
      {
        'name': 'Lody',
        'category': 'Mrożonki i garmażeria',
        'checked': false,
        'icon': const Icon(Icons.icecream)
      },
      {
        'name': 'Frytki',
        'category': 'Mrożonki i garmażeria',
        'checked': false,
        'icon': const Icon(Icons.icecream)
      },
      {
        'name': 'Pizza',
        'category': 'Mrożonki i garmażeria',
        'checked': false,
        'icon': const Icon(Icons.icecream)
      },
    ]
  },
  {
    'name': "Produkty zbożowe",
    'items': [
      {
        'name': 'Makaron',
        'category': 'Produkty zbożowe',
        'checked': false,
        'icon': const Icon(Icons.fastfood)
      },
      {
        'name': 'Ryż',
        'category': 'Produkty zbożowe',
        'checked': false,
        'icon': const Icon(Icons.fastfood)
      },
      {
        'name': 'Kasza',
        'category': 'Produkty zbożowe',
        'checked': false,
        'icon': const Icon(Icons.fastfood)
      },
    ]
  },
  {
    'name': "Przekąski i słodycze",
    'items': [
      {
        'name': 'Czekolada',
        'category': 'Przekąski i słodycze',
        'checked': false,
        'icon': const Icon(Icons.fastfood)
      },
      {
        'name': 'Chipsy',
        'category': 'Przekąski i słodycze',
        'checked': false,
        'icon': const Icon(Icons.fastfood)
      },
      {
        'name': 'Ciastka',
        'category': 'Przekąski i słodycze',
        'checked': false,
        'icon': const Icon(Icons.fastfood)
      },
    ]
  },
  {
    'name': "Gospodarstwo domowe",
    'items': [
      {
        'name': 'Papier toaletowy',
        'category': 'Gospodarstwo domowe',
        'checked': false,
        'icon': const Icon(Icons.fastfood)
      },
      {
        'name': 'Płyn do naczyń',
        'category': 'Gospodarstwo domowe',
        'checked': false,
        'icon': const Icon(Icons.fastfood)
      },
      {
        'name': 'Płyn do prania',
        'category': 'Gospodarstwo domowe',
        'checked': false,
        'icon': const Icon(Icons.fastfood)
      },
    ]
  },
  {
    'name': "Zdrowie",
    'items': [
      {
        'name': 'Leki',
        'category': 'Zdrowie',
        'checked': false,
        'icon': const Icon(Icons.fastfood)
      },
      {
        'name': 'Plastry',
        'category': 'Zdrowie',
        'checked': false,
        'icon': const Icon(Icons.fastfood)
      },
      {
        'name': 'Witaminy',
        'category': 'Zdrowie',
        'checked': false,
        'icon': const Icon(Icons.fastfood)
      },
    ]
  },
  {
    'name': "Artkykuły dla zwierząt",
    'items': [
      {
        'name': 'Karma dla psa',
        'category': 'Artkykuły dla zwierząt',
        'checked': false,
        'icon': const Icon(Icons.fastfood)
      },
      {
        'name': 'Karma dla kota',
        'category': 'Artkykuły dla zwierząt',
        'checked': false,
        'icon': const Icon(Icons.fastfood)
      },
      {
        'name': 'Przysmaki',
        'category': 'Artkykuły dla zwierząt',
        'checked': false,
        'icon': const Icon(Icons.fastfood)
      },
    ]
  },
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
