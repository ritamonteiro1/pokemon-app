import 'package:flutter/material.dart';
import 'package:pokedex_app/modules/pokemon/constants/pokemon_constants_images.dart';
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
              crossAxisSpacing: 4,
              crossAxisCount: 3,
              mainAxisSpacing: 4,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final pokemon = pokemonList[index];
              return Container(
                color: Colors.transparent,
                child: Card(
                  margin: const EdgeInsets.all(4),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.blue, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
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
                      ),
                      Expanded(
                        child: Text(
                          pokemon.name,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      );
}
