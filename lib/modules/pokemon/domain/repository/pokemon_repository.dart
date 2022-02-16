import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';

mixin PokemonRepository {
  Future<List<PokemonModel>> getPokemonList();
}
