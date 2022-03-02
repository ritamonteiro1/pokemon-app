import 'package:flutter/material.dart';

import '../../constants/pokemon_constants_stat_abbreviation.dart';
import '../../domain/model/pokemon/stat_model.dart';

class PokemonStatListWidget extends StatelessWidget {
  const PokemonStatListWidget({
    required this.pokemonStatList,
    required this.pokemonBackgroundColorByFirstType,
    required this.textColor,
    Key? key,
  }) : super(key: key);
  final List<StatModel> pokemonStatList;
  final Color pokemonBackgroundColorByFirstType;
  final Color textColor;
  static const _denominatorDivisionStat = 100;

  @override
  Widget build(BuildContext context) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(),
        shrinkWrap: true,
        itemCount: pokemonStatList.length,
        itemBuilder: (context, index) => Row(children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              child: Text(
                '${_setStatAbbreviation(index)}',
                style: TextStyle(
                  color: pokemonBackgroundColorByFirstType,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                ),
                child: Text(
                  pokemonStatList[index].base.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 10,
            child: Container(
              child: LinearProgressIndicator(
                backgroundColor:
                    pokemonBackgroundColorByFirstType.withAlpha(20),
                color: pokemonBackgroundColorByFirstType,
                value: pokemonStatList[index].base / _denominatorDivisionStat,
              ),
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
