import 'package:flutter/material.dart';

import '../../../../pokedex_constants/pokedex_constants_colors.dart';

class PokemonTypeListWidget extends StatelessWidget {
  const PokemonTypeListWidget({
    required this.pokemonTypeList,
    Key? key,
  }) : super(key: key);
  final List<String> pokemonTypeList;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: pokemonTypeList
            .map(
              (type) => Padding(
                padding: const EdgeInsets.all(
                  4,
                ),
                child: FilterChip(
                    backgroundColor: PokedexConstantsColors.primaryColor,
                    label: Text(
                      type,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onSelected: (type) {}),
              ),
            )
            .toList(),
      );
}
