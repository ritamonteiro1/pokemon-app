import 'package:flutter_modular/flutter_modular.dart';

import '../constants/splash_constants_routes.dart';
import '../presentation/splash_screen.dart';

class SplashModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(SplashConstantsRoutes.splashScreen,
            child: (context, args) => const SplashScreen()),
      ];
}
