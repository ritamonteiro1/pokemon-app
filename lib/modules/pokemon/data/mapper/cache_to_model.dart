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
        image: image,
        colorName: colorName,
        description: description,
      );
}

extension PokemonCacheListToPokemonModelList on List<PokemonCache> {
  List<PokemonModel> toPokemonModelList() => map(
        (item) => PokemonModel(
          id: item.id,
          image: item.image,
          height: item.height,
          name: item.name,
          typeList: item.typeList,
          statList: item.statList
              .map((e) => StatModel(name: e.name, base: e.base))
              .toList(),
          weight: item.weight,
          abilityList: item.abilityList,
          colorName: item.colorName,
          description: item.description,
        ),
      ).toList();
}
