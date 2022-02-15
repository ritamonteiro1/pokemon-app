import 'package:flutter_modular/flutter_modular.dart';
import '../../../../pokemon_constants/pokemon_constants_routes.dart';

class HomeController {
  Future<void> load() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    Modular.to.navigate(PokemonConstantsRoutes.pokedexModule);
  }
}
