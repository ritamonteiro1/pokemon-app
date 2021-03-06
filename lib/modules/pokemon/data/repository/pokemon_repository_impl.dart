import '../../domain/model/pokemon/pokemon_model.dart';
import '../../domain/repository/pokemon_repository.dart';
import '../cache/data_source/pokemon_cache_data_source.dart';
import '../remote/data_source/pokemon_remote_data_source.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl({
    required PokemonRemoteDataSource pokemonRemoteDataSource,
    required PokemonCacheDataSource pokemonCacheDataSource,
  })  : _pokemonRemoteDataSource = pokemonRemoteDataSource,
        _pokemonCacheDataSource = pokemonCacheDataSource;

  final PokemonRemoteDataSource _pokemonRemoteDataSource;
  final PokemonCacheDataSource _pokemonCacheDataSource;

  @override
  Future<List<PokemonModel>> getPokemonList() async {
    final pokemonList = await _pokemonRemoteDataSource.getPokemonList();
    final favoritePokemons =
        await _pokemonCacheDataSource.getFavoritePokemonList();
    if (favoritePokemons.isNotEmpty) {
      for (final pokemon in pokemonList) {
        for (final favPokemon in favoritePokemons) {
          if (pokemon.id == favPokemon.id) {
            pokemon.isFavorite = true;
          }
        }
      }
    }
    return pokemonList;
  }

  @override
  Future<PokemonModel> getPokemonTyped(String typedPokemon) async =>
      _pokemonRemoteDataSource.getPokemonTyped(typedPokemon);

  @override
  Future<void> addFavoritePokemon(PokemonModel pokemonModel) async =>
      _pokemonCacheDataSource.addFavoritePokemon(pokemonModel);

  @override
  Future<List<PokemonModel>> getFavoritePokemonList() async =>
      _pokemonCacheDataSource.getFavoritePokemonList();

  @override
  Future<void> removeFavoritePokemon(PokemonModel pokemonModel) async =>
      _pokemonCacheDataSource.removeFavoritePokemon(pokemonModel);

  @override
  Future<bool> verifyIfPokemonIsFavorite(PokemonModel pokemonModel) async {
    final favoritePokemons =
        await _pokemonCacheDataSource.getFavoritePokemonList();
    if (favoritePokemons.isNotEmpty) {
      for (final favoritePokemon in favoritePokemons) {
        if (favoritePokemon.id == pokemonModel.id) {
          return true;
        }
      }
    }
    return false;
  }
}
