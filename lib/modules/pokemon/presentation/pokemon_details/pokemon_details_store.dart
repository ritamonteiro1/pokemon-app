import 'package:mobx/mobx.dart';
import 'pokemon_details_state.dart';

part 'pokemon_details_store.g.dart';

class PokemonDetailsStore = _PokemonDetailsStore with _$PokemonDetailsStore;

abstract class _PokemonDetailsStore with Store {
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
}
