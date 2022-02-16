import '../../../domain/model/pokemon/pokemon_model.dart';
import '../../../domain/model/pokemon_details/pokemon_details_model.dart';

abstract class PokemonRemoteDataSource {
  Future<List<PokemonModel>> getPokemonList();
  Future<PokemonDetailsModel> getPokemonDetails(int pokemonId);
}
