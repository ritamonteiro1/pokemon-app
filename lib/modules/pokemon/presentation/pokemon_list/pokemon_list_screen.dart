import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../generated/l10n.dart';
import '../../../../pokedex_constants/pokedex_constants_colors.dart';
import '../../constants/pokemon_constants_colors.dart';
import '../../constants/pokemon_constants_images.dart';
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
                      child: Image.asset(
                        PokemonConstantsImages.logoIoasys,
                      ),
                    ),
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
              const SizedBox(
                height: 51,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  right: 42,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: S
                              .of(context)
                              .pokemonListScreenTextFieldLabelTextSearch,
                          hintText: S
                              .of(context)
                              .pokemonListScreenTextFieldHintTextSearch,
                          hintStyle: const TextStyle(
                            color: PokemonConstantsColors.grey,
                            fontSize: 14,
                          ),
                          labelStyle: const TextStyle(
                            color: PokedexConstantsColors.primaryColor,
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PokedexConstantsColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 22,
                    ),
                    Image.asset(
                      PokemonConstantsImages.heart,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
