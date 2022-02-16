import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';

mixin PokemonRemoteDataSource {
  Future<List<PokemonModel>> getPokemonList();
}
