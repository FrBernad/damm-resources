import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:itba_damm/beamer/pages/recipe_details_page.dart';
import 'package:itba_damm/beamer/pages/recipes_list_page.dart';

/// Contains all of the app routes configurations
final routerDelegate = BeamerDelegate(
  initialPath: RecipesListPage.route,
  locationBuilder: RoutesLocationBuilder(
    routes: {
      // Return either Widgets or BeamPages if more customization is needed
      RecipesListPage.route: (context, state, data) => const RecipesListPage(),
      RecipeDetailsPage.route: (context, state, data) {
        // Take the path parameter of interest from BeamState
        final recipeId = int.parse(state.pathParameters['recipeId']!);

        // Use BeamPage to define custom behavior
        return BeamPage(
          key: ValueKey('recipe-$recipeId'),
          title: 'Recipe #$recipeId',
          child: RecipeDetailsPage(
            recipeId: recipeId,
          ),
        );
      }
    },
  ).call,
);

final routerDelegate2 = BeamerDelegate(
  initialPath: RecipesListPage.route,
  locationBuilder: BeamerLocationBuilder(
    beamLocations: [
      RecipesLocation(),
    ],
  ).call,
);

final routerDelegate3 = BeamerDelegate(
  initialPath: RecipesListPage.route,
  locationBuilder: (routeInformation, _) {
    if (routeInformation.uri.path.contains('recipes')) {
      return RecipesLocation(routeInformation: routeInformation);
    }
    return RecipesLocation(routeInformation: routeInformation);
  },
);

class RecipesLocation extends BeamLocation<BeamState> {
  RecipesLocation({RouteInformation? routeInformation})
      : super(routeInformation);

  @override
  List<Pattern> get pathPatterns => [
        RecipeDetailsPage.route,
        RecipesListPage.route,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey(RecipesListPage.routeName),
        child: RecipesListPage(),
      ),
    ];
    final String? recipeIdParameter = state.pathParameters['recipeId'];
    if (recipeIdParameter != null) {
      final recipeId = int.parse(recipeIdParameter);
      pages.add(
        BeamPage(
          key: ValueKey('recipe-$recipeIdParameter'),
          title: 'Recipe #$recipeIdParameter',
          child: RecipeDetailsPage(recipeId: recipeId),
        ),
      );
    }
    return pages;
  }
}
