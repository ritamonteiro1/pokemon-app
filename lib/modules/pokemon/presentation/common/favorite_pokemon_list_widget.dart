import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../generated/l10n.dart';
import '../../../../pokedex_constants/pokedex_constants_colors.dart';
import '../../constants/pokemon_constants_images.dart';
import '../../domain/model/pokemon/pokemon_model.dart';
import 'loading_widget.dart';

class FavoritePokemonListWidget extends StatelessWidget {
  const FavoritePokemonListWidget({
    required this.pokemonList,
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);
  final List<PokemonModel> pokemonList;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                key: const PageStorageKey(0),
                itemCount: pokemonList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
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
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${S.of(context).hashtag}'
                                '${pokemon.id.toString()}',
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
                          child: SvgPicture.network(pokemon.image,
                              placeholderBuilder: (context) =>
                                  const LoadingWidget(
                                    colorCircularProgressIndicator:
                                        PokedexConstantsColors.primaryColor,
                                  )),
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: PokedexConstantsColors.primaryColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(
                                pokemon.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
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
                      S.of(context).favoritePokemonListScreenBackText,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
