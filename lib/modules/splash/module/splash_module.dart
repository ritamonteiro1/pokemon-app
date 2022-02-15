import 'package:flutter_modular/flutter_modular.dart';

import '../../../pokemon_constants/pokemon_constants_routes.dart';
import '../../pokedex/module/pokedex_module.dart';
import '../constants/splash_constants_routes.dart';
import '../presentation/home/home_controller.dart';
import '../presentation/home/home_screen.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => HomeController(),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          SplashConstantsRoutes.homeScreen,
          child: (context, args) => const HomeScreen(),
        ),
        ModuleRoute(
          PokemonConstantsRoutes.pokedexModule,
          module: PokedexModule(),
        )
      ];
}
