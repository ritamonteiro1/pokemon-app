import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../../pokedex_constants/pokedex_constants_colors.dart';
import '../../constants/pokemon_constants_colors.dart';

class TextFieldSearchPokemonWidget extends StatelessWidget {
  const TextFieldSearchPokemonWidget({
    required this.onChanged,
    required this.onEditingComplete,
    required this.textEditingController,
    required this.suffixIcon,
    Key? key,
  }) : super(key: key);
  final void Function(String?) onChanged;
  final void Function()? onEditingComplete;
  final TextEditingController textEditingController;
  final Widget suffixIcon;

  @override
  Widget build(BuildContext context) => TextField(
        textInputAction: TextInputAction.search,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        controller: textEditingController,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: S.of(context).pokemonListScreenTextFieldLabelTextSearch,
          hintText: S.of(context).pokemonListScreenTextFieldHintTextSearch,
          hintStyle: const TextStyle(
            color: PokemonConstantsColors.grey,
            fontSize: 14,
          ),
          labelStyle: const TextStyle(
            color: PokedexConstantsColors.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: PokedexConstantsColors.primaryColor,
            ),
          ),
        ),
      );
}
