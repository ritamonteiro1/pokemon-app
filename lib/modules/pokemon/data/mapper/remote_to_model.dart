import '../../domain/model/pokemon/pokemon_model.dart';
import '../../domain/model/pokemon_details/pokemon_details_model.dart';
import '../remote/model/pokemon/pokemon_response.dart';
import '../remote/model/pokemon_details/details/pokemon_details_response.dart';

extension PokemonResponseToPokemonModel on PokemonResponse {
  PokemonModel toPokemonModel() => PokemonModel(
        id,
        name ?? ' - ',
        'https://unpkg.com/pokeapi-sprit@2.0.2/'
        'sprit/pokemon/other/dream-world/$id.svg',
      );
}

extension PokemonDetailsResponseToPokemonDetailsModel
    on PokemonDetailsResponse {
  PokemonDetailsModel toPokemonDetailsModel() => PokemonDetailsModel();
}
