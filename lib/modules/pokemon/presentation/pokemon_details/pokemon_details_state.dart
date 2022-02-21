import 'package:equatable/equatable.dart';

abstract class PokemonDetailsState {}

class LoadingPokemonDetailsState extends Equatable
    implements PokemonDetailsState {
  @override
  List<Object?> get props => [];
}

class InitialPokemonDetailsState extends Equatable
    implements PokemonDetailsState {
  @override
  List<Object?> get props => [];
}

class SuccessPokemonDetailsState implements PokemonDetailsState {}
