import 'package:flutter_modular/flutter_modular.dart';

import '../modules/pokedex/module/pokedex_module.dart';
import '../modules/splash/module/splash_module.dart';
import '../pokemon_constants/pokemon_constants_routes.dart';

class PokemonModule extends Module {
  @override
  List<ModuleRoute> get routes => [
        ModuleRoute(PokemonConstantsRoutes.splashModule,
            module: SplashModule()),
        ModuleRoute(PokemonConstantsRoutes.pokedexModule,
            module: PokedexModule()),
      ];
}
