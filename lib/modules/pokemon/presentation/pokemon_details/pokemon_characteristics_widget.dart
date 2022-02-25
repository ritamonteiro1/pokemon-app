import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../constants/pokemon_constants_colors.dart';
import '../../constants/pokemon_constants_images.dart';

class PokemonCharacteristicsWidget extends StatelessWidget {
  const PokemonCharacteristicsWidget({
    required this.pokemonHeight,
    required this.pokemonWeight,
    required this.pokemonAbilityList,
    required this.backgroundColorCard,
    required this.textColor,
    Key? key,
  }) : super(key: key);
  final int pokemonHeight;
  final int pokemonWeight;
  final List<String> pokemonAbilityList;
  final Color textColor;
  final Color backgroundColorCard;
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
                  Image(
                    image: AssetImage(
                      backgroundColorCard == PokemonConstantsColors.darkGray
                          ? PokemonConstantsImages.weightScalesWhite
                          : PokemonConstantsImages.weightScalesBlack,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '${(pokemonWeight / _denominatorDivisionWeightToKg).toStringAsPrecision(2)}'
                    '${S.of(context).kgAbbreviation}',
                    style: TextStyle(fontSize: 14, color: textColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                S.of(context).pokemonDetailsScreenWeightText,
                style: TextStyle(fontSize: 12, color: textColor),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image(
                    image: AssetImage(
                      backgroundColorCard == PokemonConstantsColors.darkGray
                          ? PokemonConstantsImages.rulerHeightWhite
                          : PokemonConstantsImages.rulerHeightBlack,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '${(pokemonHeight / _denominatorDivisionHeightToMeter).toStringAsPrecision(1)}'
                    '${S.of(context).meterAbbreviation}',
                    style: TextStyle(fontSize: 14, color: textColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                S.of(context).pokemonDetailsScreenHeightText,
                style: TextStyle(fontSize: 12, color: textColor),
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
                style: TextStyle(fontSize: 14, color: textColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                S.of(context).pokemonDetailsScreenMovesText,
                style: TextStyle(fontSize: 12, color: textColor),
              ),
            ],
          ),
        ],
      );
}
