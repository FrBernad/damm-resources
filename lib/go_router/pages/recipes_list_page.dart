import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../beamer/pages/recipe_details_page.dart';
import '../models/recipe.dart';

class RecipesListPage extends StatelessWidget {
  static const route = '/recipes';
  static const routeName = 'recipesList';

  const RecipesListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: ListView.builder(
        itemCount: Recipe.recipes.length,
        itemBuilder: (context, index) {
          final recipe = Recipe.recipes[index];
          return ListTile(
            title: Text(
              recipe.name,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
            onTap: () => onRecipePressed(context, recipe),
          );
        },
      ),
    );
  }

  void onRecipePressed(BuildContext context, Recipe recipe) {
    context.go(RecipeDetailsPage.routeFromId(recipe.id));
  }
}
