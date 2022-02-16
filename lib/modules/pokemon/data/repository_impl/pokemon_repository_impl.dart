import '../../domain/repository/pokemon_repository.dart';
import '../remote/data_source/pokemon_remote_data_source.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl({
    required PokemonRemoteDataSource pokemonRemoteDataSource,
  }) : _pokemonRemoteDataSource = pokemonRemoteDataSource;

  final PokemonRemoteDataSource _pokemonRemoteDataSource;
}
