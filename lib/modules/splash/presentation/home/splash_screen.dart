import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_app/modules/splash/constants/splash_constants_colors.dart';

import '../../../../generated/l10n.dart';
import '../../constants/splash_constants_images.dart';
import 'splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ModularState<SplashScreen, SplashController> {
  @override
  void initState() {
    super.initState();
    controller.loadToPokemonModule();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: SplashConstantsColors.primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(SplashConstantsImages.logoIoasys),
              const SizedBox(
                height: 20,
              ),
              Text(
                S.of(context).homeScreenSplashModuleIoasysPokedex,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      );
}
