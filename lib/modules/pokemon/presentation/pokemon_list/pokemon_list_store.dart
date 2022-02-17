import 'package:mobx/mobx.dart';

import '../../domain/use_case/get_pokemon_list_use_case.dart';
import 'pokemon_list_state.dart';

part 'pokemon_list_store.g.dart';

class PokemonListStore = _PokemonListStore with _$PokemonListStore;

abstract class _PokemonListStore with Store {
  _PokemonListStore({
    required GetPokemonListUseCase getPokemonListUseCase,
  }) : _getPokemonListUseCase = getPokemonListUseCase;

  final GetPokemonListUseCase _getPokemonListUseCase;

  @observable
  PokemonListState pokemonListState = LoadingPokemonListState();

  @action
  Future<void> getPokemonList() async {
    pokemonListState = LoadingPokemonListState();
    try {
      final pokemonList = await _getPokemonListUseCase.call();
      pokemonListState = SuccessPokemonListState(pokemonList);
    } on Exception catch (e) {
      pokemonListState = ErrorPokemonListState(e);
    }
  }
}
