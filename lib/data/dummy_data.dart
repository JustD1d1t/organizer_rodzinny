import "package:flutter/material.dart";
import "package:organizer_rodzinny/models/meal.dart";
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

final availableMeals = [
  Meal(
    name: "Kotlety schabowe",
    description: "Kotlety schabowe z ziemniakami i surówką z marchewki",
    ingredients: [
      "Schab",
      "Ziemniaki",
      "Marchewka",
      "Bułka tarta",
      "Jajko",
      "Mąka",
      "Sól",
      "Pieprz",
      "Olej",
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
  Meal(
    name: "Kotlety mielone",
    description: "Kotlety mielone z ziemniakami i surówką z marchewki",
    ingredients: [
      "Mięso mielone",
      "Ziemniaki",
      "Marchewka",
      "Bułka tarta",
      "Jajko",
      "Mąka",
      "Sól",
      "Pieprz",
      "Olej",
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
  Meal(
    name: "Kotlety drobiowe",
    description: "Kotlety drobiowe z ziemniakami i surówką z marchewki",
    ingredients: [
      "Filet z kurczaka",
      "Ziemniaki",
      "Marchewka",
      "Bułka tarta",
      "Jajko",
      "Mąka",
      "Sól",
      "Pieprz",
      "Olej",
    ],
    steps: [
      "Filet z kurczaka umyć, osuszyć, pokroić w plastry, rozbić tłuczkiem do mięsa, posolić, popieprzyć",
      "Bułkę tartą wymieszać z mąką, posolić, popieprzyć",
      "Jajko roztrzepać widelcem",
      "Kotlety obtoczyć w jajku, następnie w bułce tartej",
      "Na patelni rozgrzać olej, smażyć kotlety z obu stron na złoty kolor",
      "Ziemniaki obrać, umyć, pokroić w plastry, ugotować w osolonej wodzie",
      "Marchewkę obrać, umyć, zetrzeć na tarce o grubych oczkach",
      "Ziemniaki odcedzić, podawać z kotletami i surówką z marchewki",
    ],
  ),
  Meal(
    name: "Kotlety wołowe",
    description: "Kotlety wołowe z ziemniakami i surówką z marchewki",
    ingredients: [
      "Wołowina",
      "Ziemniaki",
      "Marchewka",
      "Bułka tarta",
      "Jajko",
      "Mąka",
      "Sól",
      "Pieprz",
      "Olej",
    ],
    steps: [
      "Wołowinę umyć, osuszyć, pokroić w plastry, rozbić tłuczkiem do mięsa, posolić, popieprzyć",
      "Bułkę tartą wymieszać z mąką, posolić, popieprzyć",
      "Jajko roztrzepać widelcem",
      "Kotlety obtoczyć w jajku, następnie w bułce tartej",
      "Na patelni rozgrzać olej, smażyć kotlety z obu stron na złoty kolor",
      "Ziemniaki obrać, umyć, pokroić w plastry, ugotować w osolonej wodzie",
      "Marchewkę obrać, umyć, zetrzeć na tarce o grubych oczkach",
      "Ziemniaki odcedzić, podawać z kotletami i surówką z marchewki",
    ],
  ),
  Meal(
    name: "Kotlety jagnięce",
    description: "Kotlety jagnięce z ziemniakami i surówką z marchewki",
    ingredients: [
      "Jagnięcina",
      "Ziemniaki",
      "Marchewka",
      "Bułka tarta",
      "Jajko",
      "Mąka",
      "Sól",
      "Pieprz",
      "Olej",
    ],
    steps: [
      "Jagnięcinę umyć, osuszyć, pokroić w plastry, rozbić tłuczkiem do mięsa, posolić, popieprzyć",
      "Bułkę tartą wymieszać z mąką, posolić, popieprzyć",
      "Jajko roztrzepać widelcem",
      "Kotlety obtoczyć w jajku, następnie w bułce tartej",
      "Na patelni rozgrzać olej, smażyć kotlety z obu stron na złoty kolor",
      "Ziemniaki obrać, umyć, pokroić w plastry, ugotować w osolonej wodzie",
      "Marchewkę obrać, umyć, zetrzeć na tarce o grubych oczkach",
      "Ziemniaki odcedzić, podawać z kotletami i surówką z marchewki",
    ],
  ),
  Meal(
    name: "Kotlety wieprzowe",
    description: "Kotlety wieprzowe z ziemniakami i surówką z marchewki",
    ingredients: [
      "Wieprzowina",
      "Ziemniaki",
      "Marchewka",
      "Bułka tarta",
      "Jajko",
      "Mąka",
      "Sól",
      "Pieprz",
      "Olej",
    ],
    steps: [
      "Wieprzowinę umyć, osuszyć, pokroić w plastry, rozbić tłuczkiem do mięsa, posolić, popieprzyć",
      "Bułkę tartą wymieszać z mąką, posolić, popieprzyć",
      "Jajko roztrzepać widelcem",
      "Kotlety obtoczyć w jajku, następnie w bułce tartej",
      "Na patelni rozgrzać olej, smażyć kotlety z obu stron na złoty kolor",
      "Ziemniaki obrać, umyć, pokroić w plastry, ugotować w osolonej wodzie",
      "Marchewkę obrać, umyć, zetrzeć na tarce o grubych oczkach",
      "Ziemniaki odcedzić, podawać z kotletami i surówką z marchewki",
    ],
  ),
  Meal(
    name: "Kotlety z indyka",
    description: "Kotlety z indyka z ziemniakami i surówką z marchewki",
    ingredients: [
      "Filet z indyka",
      "Ziemniaki",
      "Marchewka",
      "Bułka tarta",
      "Jajko",
      "Mąka",
      "Sól",
      "Pieprz",
      "Olej",
    ],
    steps: [
      "Filet z indyka umyć, osuszyć, pokroić w plastry, rozbić tłuczkiem do mięsa, posolić, popieprzyć",
      "Bułkę tartą wymieszać z mąką, posolić, popieprzyć",
      "Jajko roztrzepać widelcem",
      "Kotlety obtoczyć w jajku, następnie w bułce tartej",
      "Na patelni rozgrzać olej, smażyć kotlety z obu stron na złoty kolor",
      "Ziemniaki obrać, umyć, pokroić w plastry, ugotować w osolonej wodzie",
      "Marchewkę obrać, umyć, zetrzeć na tarce o grubych oczkach",
      "Ziemniaki odcedzić, podawać z kotletami i surówką z marchewki",
    ],
  ),
  Meal(
    name: "Pomidorowa",
    description: "Zupa pomidorowa z makaronem",
    ingredients: [
      "Pomidory",
      "Cebula",
      "Marchewka",
      "Seler",
      "Makaron",
      "Rosół",
      "Sól",
      "Pieprz",
      "Natka pietruszki",
    ],
    steps: [
      "Cebulę, marchewkę i seler pokroić w kostkę",
      "Pomidory sparzyć, obrać ze skórki i pokroić w kostkę",
      "Na patelni rozgrzać olej, dodać cebulę i smażyć aż będzie miękka",
      "Dodać marchewkę i seler, smażyć przez kilka minut",
      "Dodać pomidory i dusić przez około 10 minut",
      "Dodać rosół i gotować przez około 20 minut",
      "Makaron ugotować w osolonej wodzie",
      "Zupę doprawić solą i pieprzem, posypać natką pietruszki",
      "Podawać z ugotowanym makaronem",
    ],
  ),
  Meal(
    name: "Barszcz",
    description: "Barszcz czerwony z uszkami",
    ingredients: [
      "Buraki",
      "Cebula",
      "Marchewka",
      "Seler",
      "Kwas chlebowy",
      "Sól",
      "Pieprz",
      "Koper",
      "Uszka",
    ],
    steps: [
      "Buraki umyć, obrać, pokroić w kostkę",
      "Cebulę, marchewkę i seler pokroić w kostkę",
      "Na patelni rozgrzać olej, dodać cebulę i smażyć aż będzie miękka",
      "Dodać marchewkę i seler, smażyć przez kilka minut",
      "Dodać buraki i dusić przez około 10 minut",
      "Dodać kwas chlebowy i gotować przez około 30 minut",
      "Zupę doprawić solą, pieprzem i koprem",
      "Uszka ugotować w osolonej wodzie",
      "Podawać z uszkami",
    ],
  ),
  Meal(
    name: "Rosół",
    description: "Rosół z kurczakiem i makaronem",
    ingredients: [
      "Kurczak",
      "Cebula",
      "Marchewka",
      "Seler",
      "Natka pietruszki",
      "Makaron",
      "Sól",
      "Pieprz",
      "Liść laurowy",
    ],
    steps: [
      "Kurczaka umyć, pokroić na części",
      "Cebulę, marchewkę i seler pokroić w kostkę",
      "Na dużym garnku rozgrzać olej, dodać cebulę i smażyć aż będzie miękka",
      "Dodać kurczaka i smażyć przez kilka minut",
      "Dodać marchewkę, seler, natkę pietruszki i liść laurowy",
      "Zalać wodą i gotować na małym ogniu przez około 2 godziny",
      "Makaron ugotować w osolonej wodzie",
      "Zupę doprawić solą i pieprzem",
      "Podawać z ugotowanym makaronem",
    ],
  ),
  Meal(
    name: "Zupa ogórkowa",
    description: "Zupa ogórkowa z ziemniakami",
    ingredients: [
      "Ogórki kiszone",
      "Cebula",
      "Ziemniaki",
      "Śmietana",
      "Koper",
      "Sól",
      "Pieprz",
      "Liść laurowy",
    ],
    steps: [
      "Ogórki kiszone pokroić w kostkę",
      "Cebulę pokroić w kostkę",
      "Ziemniaki obrać, pokroić w kostkę",
      "Na dużym garnku rozgrzać olej, dodać cebulę i smażyć aż będzie miękka",
      "Dodać ogórki i smażyć przez kilka minut",
      "Dodać ziemniaki, liść laurowy i zalać wodą",
      "Gotować na małym ogniu przez około 30 minut",
      "Zupę doprawić solą, pieprzem i koprem",
      "Podawać z dodatkiem śmietany",
    ],
  ),
  Meal(
    name: "Krem z dyni",
    description: "Krem z dyni z prażonymi pestkami dyni",
    ingredients: [
      "Dynia",
      "Cebula",
      "Marchewka",
      "Seler",
      "Śmietana",
      "Sól",
      "Pieprz",
      "Masło",
      "Pestki dyni",
    ],
    steps: [
      "Dynię obrać, pokroić w kostkę",
      "Cebulę, marchewkę i seler pokroić w kostkę",
      "Na dużym garnku rozgrzać masło, dodać cebulę i smażyć aż będzie miękka",
      "Dodać marchewkę i seler, smażyć przez kilka minut",
      "Dodać dynię i dusić przez około 10 minut",
      "Zalać wodą i gotować na małym ogniu przez około 30 minut",
      "Zupę zmiksować na gładki krem",
      "Doprawić solą i pieprzem",
      "Podawać z dodatkiem śmietany i prażonymi pestkami dyni",
    ],
  ),
];

final exampleShoppingList = [
  ShoppingListItem(
    name: "Bułki",
    quantity: 2,
    unit: "szt.",
    checked: false,
    category: "Pieczywo",
  ),
  ShoppingListItem(
    name: "Mleko",
    quantity: 1,
    unit: "l",
    checked: false,
    category: "Nabiał",
  ),
  ShoppingListItem(
    name: "Jogurt",
    quantity: 2,
    unit: "szt.",
    checked: false,
    category: "Nabiał",
  ),
  ShoppingListItem(
    name: "Ser",
    quantity: 1,
    unit: "kg",
    checked: false,
    category: "Nabiał",
  ),
  ShoppingListItem(
    name: "Szynka",
    quantity: 0.5,
    unit: "kg",
    checked: false,
    category: "Wędliny",
  ),
  ShoppingListItem(
    name: "Pomidory",
    quantity: 1,
    unit: "kg",
    checked: false,
    category: "Warzywa",
  ),
  ShoppingListItem(
    name: "Ogórki",
    quantity: 1,
    unit: "kg",
    checked: false,
    category: "Warzywa",
  ),
  ShoppingListItem(
    name: "Papryka",
    quantity: 1,
    unit: "kg",
    checked: false,
    category: "Warzywa",
  ),
  ShoppingListItem(
    name: "Cebula",
    quantity: 1,
    unit: "kg",
    checked: false,
    category: "Warzywa",
  ),
  ShoppingListItem(
    name: "Marchewka",
    quantity: 1,
    unit: "kg",
    checked: false,
    category: "Warzywa",
  ),
  ShoppingListItem(
    name: "Ziemniaki",
    quantity: 2,
    unit: "kg",
    checked: false,
    category: "Warzywa",
  ),
  ShoppingListItem(
    name: "Chleb",
    quantity: 1,
    unit: "szt.",
    checked: false,
    category: "Pieczywo",
  ),
  ShoppingListItem(
    name: "Mąka",
    quantity: 1,
    unit: "kg",
    checked: false,
    category: "Produkty sypkie",
  ),
  ShoppingListItem(
    name: "Makaron",
    quantity: 1,
    unit: "kg",
    checked: false,
    category: "Produkty sypkie",
  ),
];

final categoryList = [
  "Pieczywo",
  "Nabiał",
  "Wędliny",
  "Warzywa",
  "Produkty sypkie",
  "Przyprawy",
  "Słodycze",
  "Napoje",
  "Alkohol",
  "Art. higieniczne",
  "Art. czystości",
  "Art. dla dzieci",
  "Art. dla zwierząt",
  "Inne",
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
