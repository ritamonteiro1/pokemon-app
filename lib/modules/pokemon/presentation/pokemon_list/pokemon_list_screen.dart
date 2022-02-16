import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/modules/pokemon/data/remote/data_source/pokemon_remote_data_source.dart';
import 'package:pokedex_app/modules/pokemon/data/remote/data_source/pokemon_remote_data_source_impl.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({Key? key}) : super(key: key);

  @override
  _PokemonListScreenState createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  PokemonRemoteDataSource r = PokemonRemoteDataSourceImpl(dio: Dio());

  @override
  void initState() {
    super.initState();
    r.getPokemonList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(),
        body: Center(),
      );
}
