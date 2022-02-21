import '../../domain/model/pokemon/pokemon_model.dart';
import '../../domain/model/pokemon/stat_model.dart';
import '../cache/model/pokemon_cache.dart';

extension PokemonCacheToPokemonModel on PokemonCache {
  PokemonModel toPokemonModel() => PokemonModel(
        abilityList: abilityList,
        height: height,
        id: id,
        name: name,
        statList: statList
            .map((stat) => StatModel(name: stat.name, base: stat.base))
            .toList(),
        typeList: typeList,
        weight: weight,
        image:
            'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/$id.svg',
      );
}
