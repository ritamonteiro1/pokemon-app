import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_app/generated/l10n.dart';
import 'package:pokedex_app/modules/pokemon/constants/pokemon_constants_images.dart';
import 'package:pokedex_app/pokedex_constants/pokedex_constants_colors.dart';
import '../../constants/pokemon_constants_colors.dart';
import 'pokemon_list_store.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({Key? key}) : super(key: key);

  @override
  _PokemonListScreenState createState() => _PokemonListScreenState();
}

class _PokemonListScreenState
    extends ModularState<PokemonListScreen, PokemonListStore> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: PokemonConstantsColors.white,
        body: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 48,
                  right: 32,
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Image.asset(PokemonConstantsImages.logoIoasys)),
                    const SizedBox(
                      width: 13,
                    ),
                    Text(
                      S.of(context).appName,
                      style: const TextStyle(
                        fontSize: 24,
                        color: PokedexConstantsColors.primaryColor,
                      ),
                    ),
                    const SizedBox(
                      width: 82,
                    ),
                    Expanded(
                        child: Switch(value: false, onChanged: (value) {})),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
