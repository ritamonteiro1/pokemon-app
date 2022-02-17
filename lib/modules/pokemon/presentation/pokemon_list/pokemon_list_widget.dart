import 'package:flutter/material.dart';

import '../../domain/model/pokemon/pokemon_model.dart';

class PokemonListWidget extends StatelessWidget {
  const PokemonListWidget({
    required this.pokemonList,
    Key? key,
  }) : super(key: key);
  final List<PokemonModel> pokemonList;

  @override
  Widget build(BuildContext context) => GridView.builder(
        itemCount: pokemonList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          final pokemon = pokemonList[index];
          return Container(
            color: Colors.transparent,
            child: Card(
                elevation: 6,
                margin: const EdgeInsets.all(2),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    pokemon.name,
                  ),
                )),
          );
        },
      );
}
