import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../generated/l10n.dart';
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
                    '${S.of(context).hashtag}'
                    '${pokemon.id.toString()}',
                    style: TextStyle(
                      color: backgroundColorPokemon,
                      fontSize: 8,
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
                  placeholderBuilder: (context) => LoadingWidget(
                        colorCircularProgressIndicator: backgroundColorPokemon,
                      )),
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
