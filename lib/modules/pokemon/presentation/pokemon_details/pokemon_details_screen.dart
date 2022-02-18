import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../pokedex_constants/pokedex_constants_colors.dart';
import '../../constants/pokemon_constants_images.dart';
import '../../domain/model/pokemon/pokemon_model.dart';
import 'pokemon_details_store.dart';

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
        backgroundColor: PokedexConstantsColors.primaryColor,
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                child: Text(
                  widget.pokemon.name,
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                widget.pokemon.id.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
        body: SizedBox.expand(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.only(
              top: 220,
              left: 8,
              right: 8,
              bottom: 200,
            ),
            child: Card(
              color: Colors.white,
              child: Column(
                children: [
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(
                          20,
                        ),
                        child: Image(
                          image: AssetImage(
                            PokemonConstantsImages.heart,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Expanded(
                  //   child: ListView.builder(
                  //       shrinkWrap: true,
                  //       itemCount: widget.pokemon.typeList.length,
                  //       itemBuilder: (context, index) {
                  //         final type = widget.pokemon.typeList[index];
                  //         return Padding(
                  //           padding: const EdgeInsets.all(4),
                  //           child: Text(
                  //             type,
                  //             style: const TextStyle(
                  //               color: PokedexConstantsColors.primaryColor,
                  //             ),
                  //           ),
                  //         );
                  //       }),
                  // ),
                ],
              ),
            ),
          )),
        ),
      );
}
