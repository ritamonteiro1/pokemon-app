import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../generated/l10n.dart';
import '../../../../pokedex_constants/pokedex_constants_colors.dart';
import '../../constants/pokemon_constants_images.dart';
import 'favorite_pokemon_list_store.dart';

class FavoritePokemonListScreen extends StatefulWidget {
  const FavoritePokemonListScreen({
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);
  final Color backgroundColor;

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
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: widget.backgroundColor,
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
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
