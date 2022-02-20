import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../pokedex_constants/pokedex_constants_colors.dart';
import '../../constants/pokemon_constants_images.dart';
import '../../constants/pokemon_constants_routes.dart';
import '../../domain/model/pokemon/pokemon_model.dart';

class PokemonListWidget extends StatelessWidget {
  const PokemonListWidget({
    required this.pokemonList,
    required this.scrollController,
    Key? key,
  }) : super(key: key);
  final List<PokemonModel> pokemonList;
  final ScrollController scrollController;

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
                        PokemonConstantsRoutes.pokemonDetails,
                        arguments: pokemon,
                      );
                    },
                    child: Card(
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
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  pokemon.id.toString(),
                                  style: const TextStyle(
                                    color: PokedexConstantsColors.primaryColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: SvgPicture.network(
                              pokemon.image,
                              placeholderBuilder: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                bottom: 2,
                              ),
                              child: Text(
                                pokemon.name,
                                style: const TextStyle(
                                  color: PokedexConstantsColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: GestureDetector(
                onTap: () {},
                child: const Image(
                  image: AssetImage(
                    PokemonConstantsImages.down,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
