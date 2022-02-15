import 'package:flutter_modular/flutter_modular.dart';

import '../constants/pokedex_constants_routes.dart';
import '../presentation/favorite_pokemon_list/favorite_pokemon_list_screen.dart';
import '../presentation/pokemon_details/pokemon_details_screen.dart';

class PokedexModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          PokedexConstantsRoutes.pokemonListScreen,
          child: (context, args) => const PokemonDetailsScreen(),
        ),
        ChildRoute(
          PokedexConstantsRoutes.pokemonDetailsScreen,
          child: (context, args) => const PokemonDetailsScreen(),
        ),
        ChildRoute(
          PokedexConstantsRoutes.favoritePokemonListScreen,
          child: (context, args) => const FavoritePokemonListScreen(),
        ),
      ];
}
