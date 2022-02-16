import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../pokedex_app/pokemon_app.dart';
import '../pokedex_module/pokedex_module.dart';

void main() {
  runApp(ModularApp(
    module: PokedexModule(),
    child: const PokedexApp(),
  ));
}
