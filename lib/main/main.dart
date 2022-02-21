import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../modules/pokemon/data/cache/model/pokemon_cache.dart';
import '../modules/pokemon/data/cache/model/stat_cache.dart';
import '../pokedex_app/pokemon_app.dart';
import '../pokedex_module/pokedex_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive
    ..init((await getApplicationDocumentsDirectory()).path)
    ..registerAdapter<PokemonCache>(PokemonCacheAdapter())
    ..registerAdapter<StatCache>(StatCacheAdapter());

  runApp(ModularApp(
    module: PokedexModule(),
    child: const PokedexApp(),
  ));
}
