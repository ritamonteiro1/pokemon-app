import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_app/pokedex_constants/pokedex_constants_routes.dart';
import '../../constants/splash_constants_routes.dart';

class HomeController {
  Future<void> load() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    Modular.to.navigate(
      PokedexConstantsRoutes.pokemonModule,
    );
  }
}
