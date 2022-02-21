import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_app/modules/pokemon/domain/repository/pokemon_repository.dart';

import 'get_pokemon_typed_use_case_impl_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late MockPokemonRepository mockPokemonRepository;
  late
  setUpAll(() {
    mockPokemonRepository = MockPokemonRepository();
  });
  setUp(() {
    reset(mockPokemonRepository);
  });
}
