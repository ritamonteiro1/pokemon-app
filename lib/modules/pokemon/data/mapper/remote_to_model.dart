import '../../domain/model/pokemon/pokemon_model.dart';
import '../remote/model/pokemon/pokemon_response.dart';

extension PokemonResponseToPokemonModel on PokemonResponse {
  PokemonModel toPokemonModel() => PokemonModel(
        id,
        name ?? ' - ',
        'https://unpkg.com/pokeapi-others@2.0.2/'
            'others/pokemon/other/dream-world/$id.svg',
      );
}
