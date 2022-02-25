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
  static const _denominatorDivisionWeightToKg = 10;
  static const _denominatorDivisionHeightToMeter = 10;

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
                      PokemonConstantsImages.weightScalesBlack,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '${(pokemonWeight / _denominatorDivisionWeightToKg).toStringAsPrecision(2)}'
                    '${S.of(context).kgAbbreviation}',
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
                      PokemonConstantsImages.rulerHeightBlack,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '${(pokemonHeight / _denominatorDivisionHeightToMeter).toStringAsPrecision(1)}'
                    '${S.of(context).meterAbbreviation}',
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
