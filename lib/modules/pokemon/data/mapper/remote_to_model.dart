import '../../domain/model/pokemon/pokemon_model.dart';
import '../../domain/model/pokemon/stat_model.dart';
import '../../utils/capitalize_string_extensions.dart';
import '../remote/model/pokemon/details/pokemon_response.dart';
import '../remote/model/pokemon/specie/specie_response.dart';

PokemonModel convertToPokemonModelList(
    PokemonResponse pokemonResponse, SpecieResponse specieResponse) {
  const nullIntResponse = -1;
  const nullStringResponse = ' - ';

  return PokemonModel(
    abilityList: pokemonResponse.abilities
            ?.map(
              (ability) => ability.ability?.name == null
                  ? nullStringResponse
                  : ability.ability!.name!.capitalize(),
            )
            .toList() ??
        [],
    height: pokemonResponse.height ?? nullIntResponse,
    id: pokemonResponse.id,
    name: pokemonResponse.name == null
        ? nullStringResponse
        : pokemonResponse.name!.capitalize(),
    statList: pokemonResponse.stats
            ?.map(
              (stat) => StatModel(
                  name: stat.stat?.name ?? nullStringResponse,
                  base: stat.baseStat ?? nullIntResponse),
            )
            .toList() ??
        [],
    typeList: pokemonResponse.types
            ?.map(
              (type) => type.type?.name == null
                  ? nullStringResponse
                  : type.type!.name!.capitalize(),
            )
            .toList() ??
        [],
    weight: pokemonResponse.weight ?? nullIntResponse,
    image:
        'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/${pokemonResponse.id}.svg',
    colorNameByFirstType: pokemonResponse.types?[0].type?.name == null
        ? nullStringResponse
        : pokemonResponse.types![0].type!.name!.capitalize(),
    description: (specieResponse.descriptionList != null &&
            specieResponse.descriptionList!.length >= 10)
        ? (specieResponse.descriptionList?[9].description ?? nullStringResponse)
        : (specieResponse.descriptionList?[0].description ??
            nullStringResponse),
  );
}
