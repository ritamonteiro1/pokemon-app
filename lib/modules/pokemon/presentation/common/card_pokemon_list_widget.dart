import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/model/pokemon/pokemon_model.dart';
import 'loading_widget.dart';

class CardPokemonListWidget extends StatelessWidget {
  const CardPokemonListWidget({
    required this.pokemon,
    required this.backgroundColorPokemon,
    Key? key,
  }) : super(key: key);
  final PokemonModel pokemon;
  final Color backgroundColorPokemon;

  @override
  Widget build(BuildContext context) => Card(
        color: Colors.transparent,
        elevation: 0,
        margin: const EdgeInsets.all(2),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: backgroundColorPokemon,
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
                    pokemon.setPokemonId(pokemon.id),
                    style: TextStyle(
                      color: backgroundColorPokemon,
                      fontSize: 10,
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
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: SvgPicture.network(pokemon.image,
                    placeholderBuilder: (context) => LoadingWidget(
                          colorCircularProgressIndicator:
                              backgroundColorPokemon,
                        )),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: backgroundColorPokemon,
                  borderRadius: const BorderRadius.only(
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
}
