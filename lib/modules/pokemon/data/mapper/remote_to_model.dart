import '../../domain/model/pokemon/pokemon_model.dart';
import '../../domain/model/pokemon/stat_model.dart';
import '../remote/model/pokemon/details/pokemon_response.dart';

extension PokemonResponseToPokemonModel on PokemonResponse {
  PokemonModel toPokemonModel() => PokemonModel(
        abilityList:
            abilities?.map((item) => item.ability?.name ?? ' - ').toList() ??
                [],
        height: height ?? -1,
        id: id ?? -1,
        name: name ?? ' - ',
        statList: stats
                ?.map((item) => StatModel(
                    name: item.stat?.name ?? ' - ', base: item.baseStat ?? -1))
                .toList() ??
            [],
        typeList: types?.map((item) => item.type?.name ?? ' - ').toList() ?? [],
        weight: weight ?? -1,
        image:
            'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/$id.svg',
      );
}
