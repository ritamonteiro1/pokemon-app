import 'package:mobx/mobx.dart';

import '../../domain/model/pokemon/pokemon_model.dart';
import '../../domain/use_case/get_pokemon_list_use_case.dart';
import '../../domain/use_case/get_pokemon_typed_use_case.dart';
import 'pokemon_list_state.dart';

part 'pokemon_list_store.g.dart';

class PokemonListStore = _PokemonListStore with _$PokemonListStore;

abstract class _PokemonListStore with Store {
  _PokemonListStore({
    required GetPokemonListUseCase getPokemonListUseCase,
    required GetPokemonTypedUseCase getPokemonTypedUseCase,
  })  : _getPokemonListUseCase = getPokemonListUseCase,
        _getPokemonTypedUseCase = getPokemonTypedUseCase;

  final GetPokemonListUseCase _getPokemonListUseCase;
  final GetPokemonTypedUseCase _getPokemonTypedUseCase;

  @observable
  PokemonListState pokemonListState = LoadingPokemonListState();

  @observable
  bool isBackgroundDark = false;

  @observable
  bool isEmptyPokemonTextField = true;
  bool isFetchData = false;
  List<PokemonModel> pokemons = [];

  @action
  Future<void> getPokemonList() async {
    if (isFetchData) {
      return;
    }
    isFetchData = true;

    pokemonListState = LoadingPokemonListState();
    try {
      final pokemonList = await _getPokemonListUseCase.call();
      pokemons.addAll(pokemonList);
      isFetchData = false;
      pokemonListState = SuccessPokemonListState(pokemons);
    } on Exception catch (e) {
      isFetchData = false;
      pokemonListState = ErrorPokemonListState(e);
    }
  }

  @action
  Future<void> getPokemonTyped(String pokemonTyped) async {
    pokemonListState = LoadingPokemonListState();
    try {
      final pokemon = await _getPokemonTypedUseCase.call(pokemonTyped);
      final pokemonList = <PokemonModel>[pokemon];
      pokemonListState = SuccessPokemonListState(pokemonList);
    } on Exception catch (e) {
      pokemonListState = ErrorPokemonListState(e);
    }
  }

  @action
  void toggleIconTextFieldSearchPokemon(String? typed) {
    if (typed?.isEmpty ?? true) {
      isEmptyPokemonTextField = true;
    } else {
      isEmptyPokemonTextField = false;
    }
  }

  @action
  void toggleBackground() {
    isBackgroundDark = !isBackgroundDark;
  }
}
