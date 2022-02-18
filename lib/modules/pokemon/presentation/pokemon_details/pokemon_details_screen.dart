import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../pokedex_constants/pokedex_constants_colors.dart';
import '../../constants/pokemon_constants_images.dart';
import '../../domain/model/pokemon/pokemon_model.dart';
import 'pokemon_details_store.dart';

class PokemonDetailsScreen extends StatefulWidget {
  const PokemonDetailsScreen({
    required this.pokemon,
    Key? key,
  }) : super(key: key);
  final PokemonModel pokemon;

  @override
  _PokemonDetailsScreenState createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState
    extends ModularState<PokemonDetailsScreen, PokemonDetailsStore> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: PokedexConstantsColors.primaryColor,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 52,
            right: 8,
            left: 8,
            bottom: 8,
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 44,
                    ),
                    GestureDetector(
                      onTap: () {
                        Modular.to.pop();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(
                          10,
                        ),
                        child: Image(
                          image: AssetImage(
                            PokemonConstantsImages.back,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        widget.pokemon.name,
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      widget.pokemon.id.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 24,
                    bottom: 16,
                  ),
                  child: Container(
                    height: 200,
                    width: 200,
                    child: SvgPicture.network(
                      widget.pokemon.image,
                      placeholderBuilder: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage(PokemonConstantsImages.heart),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.pokemon.typeList.length,
                              itemBuilder: (context, index) {
                                final type = widget.pokemon.typeList[index];
                                return Card(
                                  color: PokedexConstantsColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      color:
                                          PokedexConstantsColors.primaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    type,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
