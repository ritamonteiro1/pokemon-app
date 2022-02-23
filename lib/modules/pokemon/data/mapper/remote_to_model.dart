import '../../domain/model/pokemon/pokemon_model.dart';
import '../../domain/model/pokemon/stat_model.dart';
import '../remote/model/pokemon/details/pokemon_response.dart';
import '../remote/model/pokemon/specie/specie_response.dart';

PokemonModel convertToPokemonModelList(
        PokemonResponse pokemonResponse, SpecieResponse specieResponse) =>
    PokemonModel(
      abilityList: pokemonResponse.abilities
          .map((ability) => ability.ability?.name ?? ' - ')
          .toList(),
      height: pokemonResponse.height ?? -1,
      id: pokemonResponse.id,
      name: pokemonResponse.name ?? ' - ',
      statList: pokemonResponse.stats
          .map((stat) => StatModel(
              name: stat.stat?.name ?? ' - ', base: stat.baseStat ?? -1))
          .toList(),
      typeList: pokemonResponse.types
          .map((type) => type.type?.name ?? ' - ')
          .toList(),
      weight: pokemonResponse.weight ?? -1,
      image:
          'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/${pokemonResponse.id}.svg',
      colorName: specieResponse.color?.name ?? ' - ',
      description: specieResponse.descriptionList?[9].description ?? ' - ',
    );
