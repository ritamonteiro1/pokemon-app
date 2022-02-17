import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../generated/l10n.dart';
import '../../../../pokedex_constants/pokedex_constants_colors.dart';
import '../../constants/pokemon_constants_colors.dart';
import '../../constants/pokemon_constants_images.dart';
import '../../domain/exception/unknown_state_type_exception.dart';
import 'pokemon_list_state.dart';
import 'pokemon_list_store.dart';
import 'pokemon_list_widget.dart';

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
    controller.getPokemonList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: PokemonConstantsColors.white,
        body: Padding(
          padding: const EdgeInsets.only(
            left: 40,
            top: 52,
            right: 40,
            bottom: 16,
          ),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        PokemonConstantsImages.logoIoasys,
                      ),
                    ),
                    const SizedBox(
                      width: 14,
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
                const SizedBox(
                  height: 52,
                ),
                Row(
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
                const SizedBox(
                  height: 42,
                ),
                Container(
                  child: Observer(builder: (context) {
                    final pokemonListState = controller.pokemonListState;
                    if (pokemonListState is LoadingPokemonListState) {
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: PokedexConstantsColors.primaryColor,
                          ),
                        ),
                      );
                    } else if (pokemonListState is SuccessPokemonListState) {
                      return PokemonListWidget(
                          pokemonList: pokemonListState.pokemonList);
                    } else if (pokemonListState is ErrorPokemonListState) {
                      return const Padding(
                        padding: EdgeInsets.only(
                          top: 42,
                        ),
                        child: Text('error'),
                      );
                    } else {
                      throw UnknownStateTypeException();
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      );
}
