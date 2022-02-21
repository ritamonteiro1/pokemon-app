import 'package:mobx/mobx.dart';

import '../../domain/model/pokemon/pokemon_model.dart';
import '../../domain/use_case/add_favorite_pokemon_use_case.dart';
import '../../domain/use_case/remove_favorite_pokemon_use_case.dart';
import 'pokemon_details_state.dart';

part 'pokemon_details_store.g.dart';

class PokemonDetailsStore = _PokemonDetailsStore with _$PokemonDetailsStore;

abstract class _PokemonDetailsStore with Store {
  _PokemonDetailsStore({
    required AddFavoritePokemonUseCase addFavoritePokemonUseCase,
    required RemoveFavoritePokemonUseCase removeFavoritePokemonUseCase,
  })  : _addFavoritePokemonUseCase = addFavoritePokemonUseCase,
        _removeFavoritePokemonUseCase = removeFavoritePokemonUseCase;

  final AddFavoritePokemonUseCase _addFavoritePokemonUseCase;
  final RemoveFavoritePokemonUseCase _removeFavoritePokemonUseCase;

  @observable
  PokemonDetailsState pokemonDetailsState = LoadingPokemonDetailsState();

  @action
  Future<void> startPokemonDetailsScreen() async {
    pokemonDetailsState = LoadingPokemonDetailsState();
    await Future.delayed(
      const Duration(seconds: 2),
    );
    pokemonDetailsState = InitialPokemonDetailsState();
  }

  @observable
  bool? toggleFavoritePokemonSuccess;

  @action
  Future<void> togglePokemonFavorite(PokemonModel pokemonModel) async {}
}
