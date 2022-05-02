import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../common/constants/pokedex_constants_colors.dart';
import '../../../constants/pokemon_constants_colors.dart';
import '../../../constants/pokemon_constants_type.dart';
import 'stat_model.dart';

class PokemonModel extends Equatable {
  PokemonModel({
    required this.abilityList,
    required this.height,
    required this.id,
    required this.name,
    required this.statList,
    required this.typeList,
    required this.weight,
    required this.image,
    required this.colorNameByFirstType,
    required this.description,
    this.isFavorite = false,
  });

  final List<String> abilityList;
  final int height;
  final int id;
  final String name;
  final List<StatModel> statList;
  final List<String> typeList;
  final int weight;
  final String image;
  final String colorNameByFirstType;
  final String description;
  bool isFavorite;

  @override
  List<Object?> get props => [
        abilityList,
        height,
        id,
        name,
        statList,
        typeList,
        weight,
        image,
        colorNameByFirstType,
        description,
      ];

  Color mapPokemonTypeToColor(String pokemonType) {
    if (pokemonType.contains(PokemonConstantsType.rock)) {
      return PokemonConstantsColors.rock;
    }
    if (pokemonType.contains(PokemonConstantsType.ghost)) {
      return PokemonConstantsColors.ghost;
    }
    if (pokemonType.contains(PokemonConstantsType.steel)) {
      return PokemonConstantsColors.steel;
    }
    if (pokemonType.contains(PokemonConstantsType.water)) {
      return PokemonConstantsColors.water;
    }
    if (pokemonType.contains(PokemonConstantsType.grass)) {
      return PokemonConstantsColors.grass;
    }
    if (pokemonType.contains(PokemonConstantsType.psychic)) {
      return PokemonConstantsColors.psychic;
    }
    if (pokemonType.contains(PokemonConstantsType.ice)) {
      return PokemonConstantsColors.ice;
    }
    if (pokemonType.contains(PokemonConstantsType.dark)) {
      return PokemonConstantsColors.dark;
    }
    if (pokemonType.contains(PokemonConstantsType.fairy)) {
      return PokemonConstantsColors.fairy;
    }
    if (pokemonType.contains(PokemonConstantsType.normal)) {
      return PokemonConstantsColors.normal;
    }
    if (pokemonType.contains(PokemonConstantsType.fighting)) {
      return PokemonConstantsColors.fighting;
    }
    if (pokemonType.contains(PokemonConstantsType.flying)) {
      return PokemonConstantsColors.flying;
    }
    if (pokemonType.contains(PokemonConstantsType.poison)) {
      return PokemonConstantsColors.poison;
    }
    if (pokemonType.contains(PokemonConstantsType.ground)) {
      return PokemonConstantsColors.ground;
    }
    if (pokemonType.contains(PokemonConstantsType.bug)) {
      return PokemonConstantsColors.bug;
    }
    if (pokemonType.contains(PokemonConstantsType.fire)) {
      return PokemonConstantsColors.fire;
    }
    if (pokemonType.contains(PokemonConstantsType.electric)) {
      return PokemonConstantsColors.electric;
    }
    if (pokemonType.contains(PokemonConstantsType.dragon)) {
      return PokemonConstantsColors.dragon;
    }
    return PokedexConstantsColors.primaryColor;
  }

  String setPokemonId(int pokemonId) {
    const prefixForPokemonIdEqualsToOne = '#00';
    const prefixForPokemonIdEqualToTwo = '#0';
    const prefixForPokemonIdGreaterThanTwo = '#';

    if (pokemonId.toString().length == 1) {
      return '$prefixForPokemonIdEqualsToOne$pokemonId';
    }
    if (pokemonId.toString().length == 2) {
      return '$prefixForPokemonIdEqualToTwo$pokemonId';
    }
    return '$prefixForPokemonIdGreaterThanTwo$pokemonId';
  }
}
