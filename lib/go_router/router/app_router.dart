import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:itba_damm/go_router/pages/recipe_details_page.dart';

import '../pages/recipes_list_page.dart';

/// Contains all of the app routes configurations
final router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  initialLocation: RecipesListPage.route,
  routes: [
    GoRoute(
      path: RecipesListPage.route,
      builder: (context, state) => const RecipesListPage(),
      routes: [
        GoRoute(
          path: RecipeDetailsPage.route,
          builder: (context, state) {
            return RecipeDetailsPage(
              recipeId: int.parse(state.pathParameters['recipeId']!),
            );
          },
        ),
      ],
    ),
  ],
);
