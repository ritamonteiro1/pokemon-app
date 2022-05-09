import 'package:flutter_modular/flutter_modular.dart';

import '../modules/common/constants/app_routes.dart';
import '../modules/pokemon/module/pokemon_module.dart';
import '../modules/splash/module/splash_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          AppRoutes.splashModule,
          module: SplashModule(),
        ),
        ModuleRoute(
          AppRoutes.pokemonModule,
          module: PokemonModule(),
        ),
      ];
}
