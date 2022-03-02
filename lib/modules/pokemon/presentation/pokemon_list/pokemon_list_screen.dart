import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:focus_detector/focus_detector.dart';

import '../../../../generated/l10n.dart';
import '../../../../pokedex_constants/pokedex_constants_colors.dart';
import '../../../../utils/status_bar_extensions.dart';
import '../../constants/pokemon_constants_colors.dart';
import '../../constants/pokemon_constants_images.dart';
import '../../constants/pokemon_constants_key_widgets.dart';
import '../../constants/pokemon_constants_routes.dart';
import '../../domain/exception/generic_error_status_code_exception.dart';
import '../../domain/exception/network_error_exception.dart';
import '../../domain/exception/unknown_state_type_exception.dart';
import '../common/error_pokemon_widget.dart';
import '../common/header_ioasys_widget.dart';
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
  late TextEditingController _pokemonTypedTextEditingController;
  late ScrollController _scrollController;
  final _focusDetectorKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    _setScrollController();
    _pokemonTypedTextEditingController = TextEditingController();
    controller.getPokemonList();
  }

  void _setScrollController() {
    _scrollController =
        ScrollController(initialScrollOffset: 15, keepScrollOffset: true);
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        controller.getPokemonList();
      }
    });
  }

  @override
  void dispose() {
    _pokemonTypedTextEditingController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FocusDetector(
        key: _focusDetectorKey,
        onFocusGained: () {
          PokedexConstantsColors.primaryColor.setStatusBarColor();
        },
        child: Observer(
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
                    HeaderIoasysWidget(
                        valueSwitch: controller.isBackgroundDark,
                        onChangedSwitch: (_) {
                          controller.toggleBackground();
                        }),
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
                                textColor: controller.isBackgroundDark
                                    ? Colors.white
                                    : PokemonConstantsColors.darkGray,
                                onChanged: (typedPokemon) {
                                  controller.toggleIconTextFieldSearchPokemon(
                                      typedPokemon);
                                },
                                onEditingComplete: () {
                                  if (_pokemonTypedTextEditingController
                                      .text.isNotEmpty) {
                                    controller.getPokemonTyped(
                                      _pokemonTypedTextEditingController.text
                                          .toString(),
                                    );
                                  } else {
                                    controller.getPokemonList();
                                  }
                                },
                                textEditingController:
                                    _pokemonTypedTextEditingController,
                                suffixIcon: isEmptyTextField
                                    ? GestureDetector(
                                        onTap: () {
                                          if (_pokemonTypedTextEditingController
                                              .text.isNotEmpty) {
                                            controller.getPokemonTyped(
                                              _pokemonTypedTextEditingController
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
                                          _pokemonTypedTextEditingController
                                              .clear();
                                          controller
                                              .toggleIconTextFieldSearchPokemon(
                                            _pokemonTypedTextEditingController
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
                                PokemonConstantsRoutes
                                    .favoritePokemonListScreen,
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Image.asset(
                                PokemonConstantsImages.heart,
                              ),
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
                            key: ValueKey(
                                PokemonConstantsKeyWidget.loadingWidgetKey),
                            colorCircularProgressIndicator:
                                PokedexConstantsColors.primaryColor,
                          ),
                        );
                      } else if (pokemonListState is SuccessPokemonListState) {
                        return PokemonListWidget(
                          key: const ValueKey(
                              PokemonConstantsKeyWidget.pokemonListWidgetKey),
                          scrollController: _scrollController,
                          pokemonList: pokemonListState.pokemonList,
                          backgroundColor: controller.isBackgroundDark
                              ? PokemonConstantsColors.darkGray
                              : PokemonConstantsColors.white,
                          downWidget: const Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                            ),
                            child: Image(
                              image: AssetImage(
                                PokemonConstantsImages.down,
                              ),
                            ),
                          ),
                        );
                      } else if (pokemonListState is ErrorPokemonListState) {
                        if (pokemonListState.exception
                            is GenericErrorStatusCodeException) {
                          return Expanded(
                            child: ErrorPokemonWidget(
                              message:
                                  S.of(context).messageGenericStatusCodeError,
                              tryAgain: () => controller.getPokemonList(),
                            ),
                          );
                        } else if (pokemonListState.exception
                            is NetworkErrorException) {
                          return Expanded(
                            child: ErrorPokemonWidget(
                              message: S.of(context).messageNetworkError,
                              tryAgain: () => controller.getPokemonList(),
                            ),
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
        ),
      );
}
