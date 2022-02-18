import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../generated/l10n.dart';
import '../../../../pokedex_constants/pokedex_constants_colors.dart';
import '../../constants/pokemon_constants_colors.dart';
import '../../constants/pokemon_constants_images.dart';
import '../../domain/exception/generic_error_status_code_exception.dart';
import '../../domain/exception/unknown_state_type_exception.dart';
import '../common/loading_widget.dart';
import '../common/error_pokemon_list_widget.dart';
import 'pokemon_list_state.dart';
import 'pokemon_list_store.dart';
import '../common/pokemon_list_widget.dart';

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
  Widget build(BuildContext context) => Observer(
      builder: (context) => Scaffold(
            backgroundColor: controller.isBackgroundDark
                ? PokemonConstantsColors.darkGray
                : PokemonConstantsColors.white,
            body: Padding(
              padding: const EdgeInsets.only(
                left: 40,
                top: 52,
                right: 40,
                bottom: 16,
              ),
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
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Switch(
                              value: controller.isBackgroundDark,
                              activeColor: PokedexConstantsColors.primaryColor,
                              onChanged: (_) {
                                controller.toggleBackground();
                              }),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 52,
                      bottom: 42,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
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
                  ),
                  Observer(builder: (context) {
                    final pokemonListState = controller.pokemonListState;
                    if (pokemonListState is LoadingPokemonListState) {
                      return const LoadingWidget();
                    } else if (pokemonListState is SuccessPokemonListState) {
                      return PokemonListWidget(
                          pokemonList: pokemonListState.pokemonList);
                    } else if (pokemonListState is ErrorPokemonListState) {
                      if (pokemonListState.exception
                          is GenericErrorStatusCodeException) {
                        return ErrorPokemonListWidget(
                          message: S.of(context).messageGenericStatusCodeError,
                          tryAgain: () => controller.getPokemonList(),
                        );
                      } else {
                        return ErrorPokemonListWidget(
                          message: S.of(context).messageNetworkError,
                          tryAgain: () => controller.getPokemonList(),
                        );
                      }
                    } else {
                      throw UnknownStateTypeException();
                    }
                  }),
                ],
              ),
            ),
          ));
}
