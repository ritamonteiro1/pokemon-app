import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'di/pokedex_module.dart';
import 'generated/l10n.dart';
import 'modules/common/constants/pokedex_constants_colors.dart';
import 'modules/common/constants/pokedex_constants_fonts.dart';
import 'modules/pokemon/data/cache/model/pokemon_cache.dart';
import 'modules/pokemon/data/cache/model/stat_cache.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive
    ..init((await getApplicationDocumentsDirectory()).path)
    ..registerAdapter<PokemonCache>(PokemonCacheAdapter())
    ..registerAdapter<StatCache>(StatCacheAdapter());

  runApp(
    ModularApp(
      module: PokedexModule(),
      child: const PokedexApp(),
    ),
  );
}

class PokedexApp extends StatelessWidget {
  const PokedexApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: PokedexConstantsFonts.poppins,
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: PokedexConstantsColors.primaryColor,
          ),
        ),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      );
}
