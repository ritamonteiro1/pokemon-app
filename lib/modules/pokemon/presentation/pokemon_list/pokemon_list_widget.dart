import 'package:flutter/material.dart';
import '../../domain/model/pokemon/pokemon_model.dart';

class PokemonListWidget extends StatelessWidget {
  const PokemonListWidget({
    required this.pokemonList,
    Key? key,
  }) : super(key: key);
  final List<PokemonModel> pokemonList;

  @override
  Widget build(BuildContext context) => Expanded(
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: pokemonList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 4,
            crossAxisCount: 3,
            mainAxisSpacing: 4,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) => Card(
            margin: const EdgeInsets.all(4),
            color: Colors.transparent,
            child: Container(
              height: 112,
              width: 104,
              child: Column(
                children: [
                  Expanded(
                    child: Text(
                      pokemonList[index].name,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
