import 'package:flutter/material.dart';

import '../../constants/pokemon_constants_images.dart';
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
          shrinkWrap: true,
          itemCount: pokemonList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            final pokemon = pokemonList[index];
            return Container(
              color: Colors.transparent,
              child: Card(
                margin: const EdgeInsets.all(4),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: FadeInImage(
                        image: NetworkImage(pokemon.image),
                        placeholder: const AssetImage(
                          PokemonConstantsImages.loading,
                        ),
                        imageErrorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          PokemonConstantsImages.error,
                          fit: BoxFit.fitWidth,
                        ),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
}
