import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_app/modules/pokemon/presentation/common/loading_widget.dart';
import 'package:pokedex_app/pokedex_constants/pokedex_constants_colors.dart';

import '../../domain/model/pokemon/pokemon_model.dart';

class PokemonListWidget extends StatelessWidget {
  const PokemonListWidget({
    required this.pokemonList,
    Key? key,
  }) : super(key: key);
  final List<PokemonModel> pokemonList;

  @override
  Widget build(BuildContext context) => Expanded(
        child: GridView.builder(
          itemCount: pokemonList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            final pokemon = pokemonList[index];
            return Card(
              color: Colors.transparent,
              elevation: 0,
              margin: const EdgeInsets.all(2),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: PokedexConstantsColors.primaryColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: SvgPicture.network(
                pokemon.image,
                placeholderBuilder: (context) => const LoadingWidget(),
              )),
            );
          },
        ),
      );
}
