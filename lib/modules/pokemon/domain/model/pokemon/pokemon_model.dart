import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../constants/pokemon_colors.dart';
import '../../../constants/pokemon_type.dart';
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
    if (pokemonType.contains(PokemonType.rock)) {
      return PokemonColors.rock;
    }
    if (pokemonType.contains(PokemonType.ghost)) {
      return PokemonColors.ghost;
    }
    if (pokemonType.contains(PokemonType.steel)) {
      return PokemonColors.steel;
    }
    if (pokemonType.contains(PokemonType.water)) {
      return PokemonColors.water;
    }
    if (pokemonType.contains(PokemonType.grass)) {
      return PokemonColors.grass;
    }
    if (pokemonType.contains(PokemonType.psychic)) {
      return PokemonColors.psychic;
    }
    if (pokemonType.contains(PokemonType.ice)) {
      return PokemonColors.ice;
    }
    if (pokemonType.contains(PokemonType.dark)) {
      return PokemonColors.dark;
    }
    if (pokemonType.contains(PokemonType.fairy)) {
      return PokemonColors.fairy;
    }
    if (pokemonType.contains(PokemonType.normal)) {
      return PokemonColors.normal;
    }
    if (pokemonType.contains(PokemonType.fighting)) {
      return PokemonColors.fighting;
    }
    if (pokemonType.contains(PokemonType.flying)) {
      return PokemonColors.flying;
    }
    if (pokemonType.contains(PokemonType.poison)) {
      return PokemonColors.poison;
    }
    if (pokemonType.contains(PokemonType.ground)) {
      return PokemonColors.ground;
    }
    if (pokemonType.contains(PokemonType.bug)) {
      return PokemonColors.bug;
    }
    if (pokemonType.contains(PokemonType.fire)) {
      return PokemonColors.fire;
    }
    if (pokemonType.contains(PokemonType.electric)) {
      return PokemonColors.electric;
    }
    if (pokemonType.contains(PokemonType.dragon)) {
      return PokemonColors.dragon;
    }
    return AppColors.primaryColor;
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
