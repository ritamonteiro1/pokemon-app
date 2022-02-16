import 'package:pokedex_app/modules/pokemon/data/remote/model/pokemon/details/pokemon_response.dart';

import '../../domain/model/pokemon/pokemon_model.dart';

extension PokemonResponseToPokemonModel on PokemonResponse {
  PokemonModel toPokemonModel() => PokemonModel();
}
