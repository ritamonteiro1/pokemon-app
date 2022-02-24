import 'package:flutter/material.dart';

import '../../domain/model/pokemon/pokemon_model.dart';

class PokemonTypeListWidget extends StatelessWidget {
  const PokemonTypeListWidget({
    required this.pokemonModel,
    Key? key,
  }) : super(key: key);
  final PokemonModel pokemonModel;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: pokemonModel.typeList
            .map(
              (type) => Padding(
                padding: const EdgeInsets.all(
                  4,
                ),
                child: FilterChip(
                    backgroundColor: pokemonModel.mapPokemonTypeToColor(type),
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
