import 'stat_model.dart';

class PokemonDetailsModel {
  PokemonDetailsModel(
    this.abilityList,
    this.height,
    this.id,
    this.name,
    this.statList,
    this.typeList,
    this.weight,
    this.image,
  );

  final List<String> abilityList;
  final int height;
  final int id;
  final String name;
  final List<StatModel> statList;
  final List<String> typeList;
  final int weight;
  final String image;
}
