import '../../domain/model/pokemon/pokemon_model.dart';
import '../cache/model/pokemon_cache.dart';
import '../cache/model/stat_cache.dart';

extension PokemonModelToPokemonCachel on PokemonModel {
  PokemonCache toPokemonCache() => PokemonCache(
        abilityList: abilityList,
        height: height,
        id: id,
        name: name,
        statList: statList
            .map(
              (stat) => StatCache(name: stat.name, base: stat.base),
            )
            .toList(),
        typeList: typeList,
        weight: weight,
        image: image,
        color: color,
        description: description,
      );
}
