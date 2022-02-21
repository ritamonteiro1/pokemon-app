import 'package:flutter/material.dart';

import '../../../../pokedex_constants/pokedex_constants_colors.dart';
import '../../constants/constants_pokemon_stat_abbreviation.dart';
import '../../domain/model/pokemon/stat_model.dart';

class PokemonStatListWidget extends StatelessWidget {
  const PokemonStatListWidget({
    required this.pokemonStatList,
    Key? key,
  }) : super(key: key);
  final List<StatModel> pokemonStatList;
  static const denominatorDivisionStat = 100;

  @override
  Widget build(BuildContext context) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(),
        shrinkWrap: true,
        itemCount: pokemonStatList.length,
        itemBuilder: (context, index) => Row(children: [
          SizedBox(
            width: 80,
            height: 30,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 38,
              ),
              child: Text(
                '${_setStatAbbreviation(index)}',
                style: const TextStyle(
                  color: PokedexConstantsColors.primaryColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 40,
            height: 30,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
              ),
              child: Text(
                pokemonStatList[index].base.toString(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            width: 160,
            child: LinearProgressIndicator(
              backgroundColor:
                  PokedexConstantsColors.primaryColor.withAlpha(20),
              color: PokedexConstantsColors.primaryColor,
              value: pokemonStatList[index].base / denominatorDivisionStat,
            ),
          )
        ]),
      );

  String _setStatAbbreviation(int index) {
    switch (index) {
      case 0:
        return PokemonConstantsStatAbbreviation.hp;
      case 1:
        return PokemonConstantsStatAbbreviation.atk;
      case 2:
        return PokemonConstantsStatAbbreviation.def;
      case 3:
        return PokemonConstantsStatAbbreviation.satk;
      case 4:
        return PokemonConstantsStatAbbreviation.sdef;
      case 5:
        return PokemonConstantsStatAbbreviation.spd;
      default:
        return PokemonConstantsStatAbbreviation.empty;
    }
  }
}
