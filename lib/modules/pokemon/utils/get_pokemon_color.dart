import 'package:flutter/material.dart';

import '../../../pokedex_constants/pokedex_constants_colors.dart';
import '../constants/pokemon_constants_colors.dart';

Color getPokemonColor(String pokemonType) {
  if (pokemonType.contains('rock')) {
    return PokemonConstantsColors.rock;
  }
  if (pokemonType.contains('ghost')) {
    return PokemonConstantsColors.ghost;
  }
  if (pokemonType.contains('steel')) {
    return PokemonConstantsColors.steel;
  }
  if (pokemonType.contains('water')) {
    return PokemonConstantsColors.water;
  }
  if (pokemonType.contains('grass')) {
    return PokemonConstantsColors.grass;
  }
  if (pokemonType.contains('psychic')) {
    return PokemonConstantsColors.psychic;
  }
  if (pokemonType.contains('ice')) {
    return PokemonConstantsColors.ice;
  }
  if (pokemonType.contains('dark')) {
    return PokemonConstantsColors.dark;
  }
  if (pokemonType.contains('fairy')) {
    return PokemonConstantsColors.fairy;
  }
  if (pokemonType.contains('normal')) {
    return PokemonConstantsColors.normal;
  }
  if (pokemonType.contains('fighting')) {
    return PokemonConstantsColors.fighting;
  }
  if (pokemonType.contains('flying')) {
    return PokemonConstantsColors.flying;
  }
  if (pokemonType.contains('poison')) {
    return PokemonConstantsColors.poison;
  }
  if (pokemonType.contains('ground')) {
    return PokemonConstantsColors.ground;
  }
  if (pokemonType.contains('bug')) {
    return PokemonConstantsColors.bug;
  }
  if (pokemonType.contains('fire')) {
    return PokemonConstantsColors.fire;
  }
  if (pokemonType.contains('electric')) {
    return PokemonConstantsColors.electric;
  }
  if (pokemonType.contains('dragon')) {
    return PokemonConstantsColors.dragon;
  }
  return PokedexConstantsColors.primaryColor;
}
