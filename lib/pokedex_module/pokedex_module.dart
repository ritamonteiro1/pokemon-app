import 'package:flutter_modular/flutter_modular.dart';
import '../modules/pokemon/module/pokemon_module.dart';

import '../modules/splash/module/splash_module.dart';
import '../pokedex_constants/pokedex_constants_routes.dart';

class PokedexModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          PokedexConstantsRoutes.splashModule,
          module: SplashModule(),
        ),
        ModuleRoute(
          PokedexConstantsRoutes.pokemonModule,
          module: PokemonModule(),
        ),
      ];
}
