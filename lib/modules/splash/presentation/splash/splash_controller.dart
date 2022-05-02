import 'package:flutter_modular/flutter_modular.dart';

import '../../../common/constants/pokedex_constants_routes.dart';

class SplashController {
  Future<void> loadToPokemonModule() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    Modular.to.navigate(
      PokedexConstantsRoutes.pokemonModule,
    );
  }
}
