import 'package:flutter_modular/flutter_modular.dart';

import '../constants/pokemon_constants_routes.dart';
import '../presentation/favorite_pokemon_list/favorite_pokemon_list_screen.dart';
import '../presentation/pokemon_details/pokemon_details_screen.dart';
import '../presentation/pokemon_list/pokemon_list_screen.dart';

class PokemonModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          PokemonConstantsRoutes.pokemonListScreen,
          child: (context, args) => const PokemonListScreen(),
        ),
        ChildRoute(
          PokemonConstantsRoutes.pokemonDetailsScreen,
          child: (context, args) => const PokemonDetailsScreen(),
        ),
        ChildRoute(
          PokemonConstantsRoutes.favoritePokemonListScreen,
          child: (context, args) => const FavoritePokemonListScreen(),
        ),
      ];
}
