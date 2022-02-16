import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon_details/pokemon_details_model.dart';

abstract class PokemonRepository {
  Future<List<PokemonModel>> getPokemonList();
  Future<PokemonDetailsModel> getPokemonDetails(int pokemonId);
}
