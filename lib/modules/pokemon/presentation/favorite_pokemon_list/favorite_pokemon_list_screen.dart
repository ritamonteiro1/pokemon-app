import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../generated/l10n.dart';
import '../../../../pokedex_constants/pokedex_constants_colors.dart';
import '../../constants/pokemon_constants_colors.dart';
import '../../constants/pokemon_constants_images.dart';
import '../../domain/exception/empty_favorite_pokemon_list_exception.dart';
import '../../domain/exception/unknown_state_type_exception.dart';
import '../common/favorite_pokemon_list_widget.dart';
import '../common/loading_widget.dart';
import 'favorite_pokemon_list_state.dart';
import 'favorite_pokemon_list_store.dart';

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
  @override
  void initState() {
    super.initState();
    controller.getFavoritePokemonList();
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
                        Image.asset(
                          PokemonConstantsImages.logoIoasys,
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
                    const SizedBox(
                      height: 84,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                            image: AssetImage(
                              PokemonConstantsImages.heart,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            S
                                .of(context)
                                .favoritePokemonListScreenMyFavoritePokemons,
                            style: const TextStyle(
                              color: PokedexConstantsColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 84,
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
                        return FavoritePokemonListWidget(
                          pokemonList:
                              favoritePokemonListState.favoritePokemonList,
                          backgroundColor: controller.isBackgroundDark
                              ? PokemonConstantsColors.darkGray
                              : PokemonConstantsColors.white,
                        );
                      } else if (favoritePokemonListState
                          is ErrorFavoritePokemonListState) {
                        if (favoritePokemonListState
                            is EmptyFavoritePokemonListException) {
                          return Center(
                              child: Text(S
                                  .of(context)
                                  .favoritePokemonListScreenEmptyList));
                        } else {
                          return Center(
                              child: Text(
                                  S.of(context).messageGenericStatusCodeError));
                        }
                      } else {
                        throw UnknownStateTypeException();
                      }
                    }),
                  ],
                ),
              ),
            ),
          ));
}
