import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_app/modules/pokemon/constants/pokemon_constants_images.dart';
import 'package:pokedex_app/modules/pokemon/presentation/pokemon_details/pokemon_details_store.dart';
import '../../domain/model/pokemon/pokemon_model.dart';

class PokemonDetailsScreen extends StatefulWidget {
  const PokemonDetailsScreen({
    required this.pokemon,
    Key? key,
  }) : super(key: key);
  final PokemonModel pokemon;

  @override
  _PokemonDetailsScreenState createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState
    extends ModularState<PokemonDetailsScreen, PokemonDetailsStore> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 52,
            right: 8,
            left: 8,
            bottom: 8,
          ),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 44,
                      ),
                      const Image(
                        image: AssetImage(
                          PokemonConstantsImages.backArrow,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          widget.pokemon.name,
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        widget.pokemon.id.toString(),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    child: SvgPicture.network(
                      widget.pokemon.image,
                      placeholderBuilder: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Card(),
                ],
              ),
            ),
          ),
        ),
      );
}
