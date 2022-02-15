import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../pokemon_app/pokemon_app.dart';
import '../pokemon_module/pokemon_module.dart';

void main() {
  runApp(ModularApp(
    module: PokemonModule(),
    child: const PokemonApp(),
  ));
}
