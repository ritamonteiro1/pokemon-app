import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../constants/pokemon_constants_images.dart';

class PokemonCharacteristicsWidget extends StatelessWidget {
  const PokemonCharacteristicsWidget({
    required this.pokemonHeight,
    required this.pokemonWeight,
    required this.pokemonAbilityList,
    Key? key,
  }) : super(key: key);
  final int pokemonHeight;
  final int pokemonWeight;
  final List<String> pokemonAbilityList;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Image(
                    image: AssetImage(
                      PokemonConstantsImages.weightScales,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '${pokemonHeight.toString()}${S.of(context).kgAbbreviation}',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                S.of(context).pokemonDetailsScreenWeightText,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Image(
                    image: AssetImage(
                      PokemonConstantsImages.rulerHeight,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '${pokemonWeight.toString()}${S.of(context).meterAbbreviation}',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                S.of(context).pokemonDetailsScreenHeightText,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${pokemonAbilityList.first}'
                '${S.of(context).slash}'
                '${pokemonAbilityList.last}',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                S.of(context).pokemonDetailsScreenMovesText,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      );
}
