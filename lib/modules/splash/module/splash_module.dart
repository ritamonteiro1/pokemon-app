import 'package:flutter_modular/flutter_modular.dart';

import '../constants/splash_routes.dart';
import '../presentation/splash/splash_controller.dart';
import '../presentation/splash/splash_screen.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => SplashController(),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          SplashRoutes.splashScreen,
          child: (context, args) => const SplashScreen(),
        ),
      ];
}
