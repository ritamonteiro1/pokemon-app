import 'package:mobx/mobx.dart';

import '../../domain/model/pokemon/pokemon_model.dart';
import '../../domain/use_case/add_favorite_pokemon_use_case.dart';
import '../../domain/use_case/remove_favorite_pokemon_use_case.dart';
import '../../domain/use_case/verify_if_pokemon_is_favorite_use_case.dart';
import 'pokemon_details_state.dart';

part 'pokemon_details_store.g.dart';

class PokemonDetailsStore = _PokemonDetailsStore with _$PokemonDetailsStore;

abstract class _PokemonDetailsStore with Store {
  _PokemonDetailsStore({
    required AddFavoritePokemonUseCase addFavoritePokemonUseCase,
    required RemoveFavoritePokemonUseCase removeFavoritePokemonUseCase,
    required VerifyIfPokemonIsFavoriteUseCase verifyIfPokemonIsFavorite,
  })  : _addFavoritePokemonUseCase = addFavoritePokemonUseCase,
        _removeFavoritePokemonUseCase = removeFavoritePokemonUseCase,
        _verifyIfPokemonIsFavorite = verifyIfPokemonIsFavorite;

  final AddFavoritePokemonUseCase _addFavoritePokemonUseCase;
  final RemoveFavoritePokemonUseCase _removeFavoritePokemonUseCase;
  final VerifyIfPokemonIsFavoriteUseCase _verifyIfPokemonIsFavorite;
  @observable
  PokemonDetailsState pokemonDetailsState = LoadingPokemonDetailsState();

  @observable
  bool? addFavoritePokemonSuccessfully;

  @observable
  bool? removeFavoritePokemonSuccessfully;

  @observable
  bool? isPokemonFavorite;

  @action
  Future<void> startPokemonDetailsScreen() async {
    pokemonDetailsState = LoadingPokemonDetailsState();
    await Future.delayed(
      const Duration(seconds: 2),
    );
    pokemonDetailsState = InitialPokemonDetailsState();
  }

  @action
  Future<void> togglePokemonFavorite(PokemonModel pokemonModel) async {
    try {
      if (!pokemonModel.isFavorite) {
        await _addFavoritePokemonUseCase.call(pokemonModel);
        addFavoritePokemonSuccessfully = true;
        isPokemonFavorite = true;
      } else {
        await _removeFavoritePokemonUseCase.call(pokemonModel);
        removeFavoritePokemonSuccessfully = true;
        isPokemonFavorite = false;
      }
      pokemonModel.isFavorite = !pokemonModel.isFavorite;
      pokemonDetailsState = SuccessPokemonDetailsState(pokemonModel);
    } catch (e) {
      removeFavoritePokemonSuccessfully = false;
      addFavoritePokemonSuccessfully = false;
    }
  }
}
