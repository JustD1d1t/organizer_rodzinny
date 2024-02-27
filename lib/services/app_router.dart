import "package:flutter/material.dart";

import "../screens/screen_exports.dart";

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AuthScreen.id:
        return MaterialPageRoute(
          builder: (ctx) => const AuthScreen(),
        );
      case SplashScreen.id:
        return MaterialPageRoute(
          builder: (ctx) => const SplashScreen(),
        );
      case FinancesScreen.id:
        return MaterialPageRoute(
          builder: (ctx) => const FinancesScreen(),
        );
      case ListsScreen.id:
        return MaterialPageRoute(
          builder: (ctx) => const ListsScreen(),
        );
      case MealsScreen.id:
        return MaterialPageRoute(
          builder: (ctx) => const MealsScreen(),
        );
      case NotesScreen.id:
        return MaterialPageRoute(
          builder: (ctx) => const NotesScreen(),
        );
      case PantryScreen.id:
        return MaterialPageRoute(
          builder: (ctx) => const PantryScreen(),
        );
      case ReceiptsScreen.id:
        return MaterialPageRoute(
          builder: (ctx) => const ReceiptsScreen(),
        );
      case AddRecipeFromUrlScreen.id:
        return MaterialPageRoute(
          builder: (ctx) => const AddRecipeFromUrlScreen(),
        );
      case AddRecipeScreen.id:
        return MaterialPageRoute(
          builder: (ctx) => const AddRecipeScreen(),
        );
      // case RecipeDetails.id:
      //   return MaterialPageRoute(
      //     builder: (ctx) => const RecipeDetails(),
      //   );
      case RecipesScreen.id:
        return MaterialPageRoute(
          builder: (ctx) => const RecipesScreen(),
        );
      // case AddShopingItemScreen.id:
      //   return MaterialPageRoute(
      //     builder: (ctx) => const AddShopingItemScreen(),
      //   );
      // case AddShoppingRecipeScreen.id:
      //   return MaterialPageRoute(
      //     builder: (ctx) => const AddShoppingRecipeScreen(),
      //   );
      case ListOfShoppingListsScreen.id:
        return MaterialPageRoute(
          builder: (ctx) => const ListOfShoppingListsScreen(),
        );
      // case ShoppingListReceipeIngredients.id:
      //   return MaterialPageRoute(
      //     builder: (ctx) => const ShoppingListReceipeIngredients(),
      //   );
      // case ShoppingListScreen.id:
      //   return MaterialPageRoute(
      //     builder: (ctx) => const ShoppingListScreen(),
      //   );
      default:
        return null;
    }
  }
}
