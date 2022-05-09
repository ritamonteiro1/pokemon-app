import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../constants/pokemon_routes.dart';
import '../../domain/model/pokemon/pokemon_model.dart';
import 'card_pokemon_list_widget.dart';

class PokemonListWidget extends StatelessWidget {
  const PokemonListWidget({
    required this.scrollController,
    required this.pokemonList,
    required this.backgroundColor,
    required this.downWidget,
    Key? key,
  }) : super(key: key);
  final ScrollController? scrollController;
  final List<PokemonModel> pokemonList;
  final Color backgroundColor;
  final Widget downWidget;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                key: const PageStorageKey(0),
                controller: scrollController,
                itemCount: pokemonList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  final pokemon = pokemonList[index];
                  return GestureDetector(
                    onTap: () {
                      Modular.to.pushNamed(
                        PokemonRoutes.pokemonDetailsScreen,
                        arguments: [
                          pokemon,
                          backgroundColor,
                        ],
                      );
                    },
                    child: CardPokemonListWidget(
                      pokemon: pokemon,
                      backgroundColorPokemon: pokemon
                          .mapPokemonTypeToColor(pokemon.colorNameByFirstType),
                    ),
                  );
                },
              ),
            ),
            downWidget
          ],
        ),
      );
}
