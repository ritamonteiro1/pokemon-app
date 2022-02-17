import 'package:flutter/material.dart';
import '../../domain/model/pokemon/pokemon_model.dart';

class PokemonListWidget extends StatelessWidget {
  const PokemonListWidget({
    required this.pokemonList,
    Key? key,
  }) : super(key: key);
  final List<PokemonModel> pokemonList;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          top: 42,
        ),
        child: ListView.builder(
            itemCount: pokemonList.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(pokemonList[index].name),
                )),
      );
}
