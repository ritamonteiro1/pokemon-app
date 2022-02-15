import 'package:flutter_modular/flutter_modular.dart';

import '../modules/splash/module/splash_module.dart';
import '../pokemon_constants/pokemon_constants_routes.dart';

class PokemonModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          PokemonConstantsRoutes.splashModule,
          module: SplashModule(),
        ),
      ];
}
