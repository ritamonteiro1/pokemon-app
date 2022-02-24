import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../generated/l10n.dart';
import '../../../../pokedex_constants/pokedex_constants_colors.dart';
import '../../constants/pokemon_constants_images.dart';
import '../../domain/exception/unknown_state_type_exception.dart';
import '../../domain/model/pokemon/pokemon_model.dart';
import '../common/loading_widget.dart';
import 'pokemon_characteristics_widget.dart';
import 'pokemon_details_state.dart';
import 'pokemon_details_store.dart';
import 'pokemon_stat_list_widget.dart';
import 'pokemon_type_list_widget.dart';

class PokemonDetailsScreen extends StatefulWidget {
  const PokemonDetailsScreen({
    required this.pokemon,
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);
  final PokemonModel pokemon;
  final Color backgroundColor;

  @override
  _PokemonDetailsScreenState createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState
    extends ModularState<PokemonDetailsScreen, PokemonDetailsStore> {
  @override
  void initState() {
    super.initState();
    controller.startPokemonDetailsScreen();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: widget.pokemon.color,
        appBar: AppBar(
          elevation: 0,
          title: Row(
            children: [
              Expanded(
                child: Text(
                  widget.pokemon.name,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                '${S.of(context).hashtag}'
                '${widget.pokemon.id.toString()}',
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
        body: Observer(
          builder: (context) {
            final pokemonDetailsState = controller.pokemonDetailsState;
            if (pokemonDetailsState is LoadingPokemonDetailsState) {
              return const LoadingWidget(
                colorCircularProgressIndicator: Colors.white,
              );
            } else if (pokemonDetailsState is InitialPokemonDetailsState ||
                pokemonDetailsState is SuccessPokemonDetailsState) {
              return SizedBox.expand(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 8,
                      right: 8,
                      bottom: 20,
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Image.asset(
                                PokemonConstantsImages.pokeball,
                                height: 120,
                                width: 120,
                                color: Colors.grey.withOpacity(1),
                                colorBlendMode: BlendMode.modulate,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 70,
                              ),
                              child: SizedBox(
                                width: 200,
                                height: 200,
                                child: SvgPicture.network(
                                  widget.pokemon.image,
                                  placeholderBuilder: (context) =>
                                      const LoadingWidget(
                                          colorCircularProgressIndicator:
                                              PokedexConstantsColors
                                                  .primaryColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Card(
                          elevation: 4,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.togglePokemonFavorite(
                                          widget.pokemon);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                        20,
                                      ),
                                      child: Observer(builder: (context) {
                                        final isFavoritePokemon =
                                            controller.isPokemonFavorite;
                                        if ((isFavoritePokemon == true &&
                                                isFavoritePokemon != null) ||
                                            widget.pokemon.isFavorite) {
                                          return const Image(
                                            height: 40,
                                            width: 40,
                                            image: AssetImage(
                                              PokemonConstantsImages.heart,
                                            ),
                                          );
                                        } else {
                                          return const Image(
                                            height: 40,
                                            width: 40,
                                            image: AssetImage(
                                              PokemonConstantsImages.emptyHeart,
                                            ),
                                          );
                                        }
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 32,
                                  left: 32,
                                ),
                                child: PokemonTypeListWidget(
                                  pokemonTypeList: widget.pokemon.typeList,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 32,
                                  left: 32,
                                ),
                                child: PokemonCharacteristicsWidget(
                                  pokemonHeight: widget.pokemon.height,
                                  pokemonWeight: widget.pokemon.weight,
                                  pokemonAbilityList:
                                      widget.pokemon.abilityList,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 32, left: 32),
                                child: Text(
                                  widget.pokemon.description,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 32,
                                  left: 32,
                                ),
                                child: Text(
                                  S
                                      .of(context)
                                      .pokemonDetailsScreenBaseStatsText,
                                  style: const TextStyle(
                                    color: PokedexConstantsColors.primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              PokemonStatListWidget(
                                  pokemonStatList: widget.pokemon.statList),
                              const SizedBox(
                                height: 52,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              throw UnknownStateTypeException();
            }
          },
        ),
      );
}
