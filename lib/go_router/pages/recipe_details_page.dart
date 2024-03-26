import 'package:ITBA_DAMM/go_router/models/recipe.dart';
import 'package:flutter/material.dart';

/// A page that displays the details of a recipe with the given [recipe].
class RecipeDetailsPage extends StatelessWidget {
  static const route = "/recipes/:recipeId";

  static String routeFromId(int recipeId) => '/recipes/$recipeId';
  static const routeName = 'recipeDetails';

  final int recipeId;

  const RecipeDetailsPage({
    super.key,
    required this.recipeId,
  });

  @override
  Widget build(BuildContext context) {
    final recipe = Recipe.recipes.firstWhere((r) => r.id == recipeId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          recipe.name,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Added ${recipe.name} to favorite',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              recipe.imageUrl,
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.error,
                size: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                recipe.details,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
