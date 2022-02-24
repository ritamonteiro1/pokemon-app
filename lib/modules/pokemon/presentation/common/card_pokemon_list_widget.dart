import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../generated/l10n.dart';
import '../../domain/model/pokemon/pokemon_model.dart';
import 'loading_widget.dart';

class CardPokemonListWidget extends StatelessWidget {
  const CardPokemonListWidget({
    required this.pokemon,
    Key? key,
  }) : super(key: key);
  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) => Card(
        color: Colors.transparent,
        elevation: 0,
        margin: const EdgeInsets.all(2),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: pokemon.getPokemonColor(pokemon.colorNameByFirstType),
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
                      color:
                          pokemon.getPokemonColor(pokemon.colorNameByFirstType),
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
                        colorCircularProgressIndicator: pokemon
                            .getPokemonColor(pokemon.colorNameByFirstType),
                      )),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: pokemon.getPokemonColor(pokemon.colorNameByFirstType),
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
