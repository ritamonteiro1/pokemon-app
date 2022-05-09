import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:focus_detector/focus_detector.dart';

import '../../../../generated/l10n.dart';
import '../../../common/constants/app_colors.dart';
import '../../../common/utils/status_bar_extensions.dart';
import '../../constants/splash_images.dart';
import 'splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ModularState<SplashScreen, SplashController> {
  final _focusDetectorKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    controller.loadToPokemonModule();
  }

  @override
  Widget build(BuildContext context) => FocusDetector(
        key: _focusDetectorKey,
        onFocusGained: () {
          AppColors.primaryColor.setStatusBarColor();
        },
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(SplashImages.logoIoasys),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  S.of(context).appName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
