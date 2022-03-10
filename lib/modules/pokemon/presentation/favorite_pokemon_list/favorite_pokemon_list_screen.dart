import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:focus_detector/focus_detector.dart';

import '../../../../generated/l10n.dart';
import '../../../../pokedex_constants/pokedex_constants_colors.dart';
import '../../../../utils/status_bar_extensions.dart';
import '../../constants/pokemon_constants_colors.dart';
import '../../constants/pokemon_constants_images.dart';
import '../../domain/exception/empty_favorite_pokemon_list_exception.dart';
import '../../domain/exception/unknown_state_type_exception.dart';
import '../common/header_ioasys_widget.dart';
import '../common/loading_widget.dart';
import '../common/pokemon_list_widget.dart';
import 'favorite_pokemon_list_state.dart';
import 'favorite_pokemon_list_store.dart';
import 'text_my_favorite_pokemons_widget.dart';

class FavoritePokemonListScreen extends StatefulWidget {
  const FavoritePokemonListScreen({
    Key? key,
  }) : super(key: key);

  @override
  _FavoritePokemonListScreenState createState() =>
      _FavoritePokemonListScreenState();
}

class _FavoritePokemonListScreenState
    extends ModularState<FavoritePokemonListScreen, FavoritePokemonListStore> {
  final _focusDetectorKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    controller.getFavoritePokemonList();
  }

  @override
  Widget build(BuildContext context) => FocusDetector(
        key: _focusDetectorKey,
        onFocusGained: () {
          PokedexConstantsColors.primaryColor.setStatusBarColor();
          controller.getFavoritePokemonList();
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
                    const SizedBox(
                      height: 60,
                    ),
                    const TextMyFavoritePokemonsWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    Observer(builder: (context) {
                      final favoritePokemonListState =
                          controller.favoritePokemonListState;
                      if (favoritePokemonListState
                          is LoadingFavoritePokemonListState) {
                        return const Expanded(
                          child: LoadingWidget(
                            colorCircularProgressIndicator:
                                PokedexConstantsColors.primaryColor,
                          ),
                        );
                      } else if (favoritePokemonListState
                          is SuccessFavoritePokemonListState) {
                        return PokemonListWidget(
                          scrollController: null,
                          pokemonList:
                              favoritePokemonListState.favoritePokemonList,
                          backgroundColor: controller.isBackgroundDark
                              ? PokemonConstantsColors.darkGray
                              : PokemonConstantsColors.white,
                          downWidget: GestureDetector(
                            onTap: () {
                              Modular.to.pop();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: Column(
                                children: [
                                  const Image(
                                    image: AssetImage(
                                      PokemonConstantsImages.backArrow,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    S
                                        .of(context)
                                        .favoritePokemonListScreenBackText,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else if (favoritePokemonListState
                          is ErrorFavoritePokemonListState) {
                        if (favoritePokemonListState.exception
                            is EmptyFavoritePokemonListException) {
                          return Center(
                              child: Text(
                            S.of(context).favoritePokemonListScreenEmptyList,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: controller.isBackgroundDark
                                    ? Colors.white
                                    : PokemonConstantsColors.darkGray),
                          ));
                        } else {
                          return Center(
                              child: Text(
                            S.of(context).messageGenericStatusCodeError,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: controller.isBackgroundDark
                                    ? Colors.white
                                    : PokemonConstantsColors.darkGray),
                          ));
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
