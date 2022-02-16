import 'package:flutter_modular/flutter_modular.dart';
import '../../../../pokedex_constants/pokedex_constants_routes.dart';

class SplashController {
  Future<void> load() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    Modular.to.navigate(
      PokedexConstantsRoutes.pokemonModule,
    );
  }
}
