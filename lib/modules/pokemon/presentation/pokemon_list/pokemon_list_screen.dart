import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../generated/l10n.dart';
import '../../../../pokedex_constants/pokedex_constants_colors.dart';
import '../../constants/pokemon_constants_colors.dart';
import '../../constants/pokemon_constants_images.dart';
import '../../constants/pokemon_constants_routes.dart';
import '../../domain/exception/generic_error_status_code_exception.dart';
import '../../domain/exception/network_error_exception.dart';
import '../../domain/exception/unknown_state_type_exception.dart';
import '../common/error_pokemon_list_widget.dart';
import '../common/loading_widget.dart';
import '../common/pokemon_list_widget.dart';
import 'not_found_pokemon_widget.dart';
import 'pokemon_list_state.dart';
import 'pokemon_list_store.dart';
import 'text_field_search_pokemon_widget.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({Key? key}) : super(key: key);

  @override
  _PokemonListScreenState createState() => _PokemonListScreenState();
}

class _PokemonListScreenState
    extends ModularState<PokemonListScreen, PokemonListStore> {
  late TextEditingController pokemonTypedTextEditingController;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    _setScrollController();
    pokemonTypedTextEditingController = TextEditingController();
    controller.getPokemonList();
  }

  void _setScrollController() {
    scrollController =
        ScrollController(initialScrollOffset: 15, keepScrollOffset: true);
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        controller.getPokemonList();
      }
    });
  }

  @override
  void dispose() {
    pokemonTypedTextEditingController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: controller.isBackgroundDark
              ? PokemonConstantsColors.darkGray
              : PokemonConstantsColors.white,
          body: Padding(
            padding: const EdgeInsets.only(
              top: 70,
              bottom: 16,
              right: 40,
              left: 40,
            ),
            child: Center(
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
                          fontWeight: FontWeight.bold,
                          color: PokedexConstantsColors.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: 82,
                      ),
                      Expanded(
                        child: Switch(
                            value: controller.isBackgroundDark,
                            activeColor: PokedexConstantsColors.primaryColor,
                            onChanged: (_) {
                              controller.toggleBackground();
                            }),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                      bottom: 24,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Observer(builder: (context) {
                            final isEmptyTextField =
                                controller.isEmptyPokemonTextField;
                            return TextFieldSearchPokemonWidget(
                              onChanged: (typedPokemon) {
                                controller.toggleIconTextFieldSearchPokemon(
                                    typedPokemon);
                              },
                              onEditingComplete: () {
                                if (pokemonTypedTextEditingController
                                    .text.isNotEmpty) {
                                  controller.getPokemonTyped(
                                    pokemonTypedTextEditingController.text
                                        .toString(),
                                  );
                                } else {
                                  controller.getPokemonList();
                                }
                              },
                              textEditingController:
                                  pokemonTypedTextEditingController,
                              suffixIcon: isEmptyTextField
                                  ? GestureDetector(
                                      onTap: () {
                                        if (pokemonTypedTextEditingController
                                            .text.isNotEmpty) {
                                          controller.getPokemonTyped(
                                            pokemonTypedTextEditingController
                                                .text
                                                .toString(),
                                          );
                                        } else {
                                          controller.getPokemonList();
                                        }
                                      },
                                      child: const Icon(
                                        Icons.search,
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        pokemonTypedTextEditingController
                                            .clear();
                                        controller
                                            .toggleIconTextFieldSearchPokemon(
                                          pokemonTypedTextEditingController
                                              .text,
                                        );
                                      },
                                      child: const Icon(
                                        Icons.clear,
                                      ),
                                    ),
                            );
                          }),
                        ),
                        const SizedBox(
                          width: 22,
                        ),
                        GestureDetector(
                          onTap: () {
                            Modular.to.pushNamed(
                              PokemonConstantsRoutes.favoritePokemonList,
                            );
                          },
                          child: Image.asset(
                            PokemonConstantsImages.heart,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Observer(builder: (context) {
                    final pokemonListState = controller.pokemonListState;
                    if (pokemonListState is LoadingPokemonListState) {
                      return const Expanded(
                        child: LoadingWidget(
                          colorCircularProgressIndicator:
                              PokedexConstantsColors.primaryColor,
                        ),
                      );
                    } else if (pokemonListState is SuccessPokemonListState) {
                      return PokemonListWidget(
                        pokemonList: pokemonListState.pokemonList,
                        scrollController: scrollController,
                        backgroundColor: controller.isBackgroundDark
                            ? PokemonConstantsColors.darkGray
                            : PokemonConstantsColors.white,
                      );
                    } else if (pokemonListState is ErrorPokemonListState) {
                      if (pokemonListState.exception
                          is GenericErrorStatusCodeException) {
                        return ErrorPokemonListWidget(
                          message: S.of(context).messageGenericStatusCodeError,
                          tryAgain: () => controller.getPokemonList(),
                        );
                      } else if (pokemonListState.exception
                          is NetworkErrorException) {
                        return ErrorPokemonListWidget(
                          message: S.of(context).messageNetworkError,
                          tryAgain: () => controller.getPokemonList(),
                        );
                      } else {
                        return const NotFoundPokemonWidget();
                      }
                    } else {
                      throw UnknownStateTypeException();
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      );
}
