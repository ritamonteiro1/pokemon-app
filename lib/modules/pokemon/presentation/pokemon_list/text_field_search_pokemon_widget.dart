import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../common/constants/app_colors.dart';
import '../../constants/pokemon_colors.dart';

class TextFieldSearchPokemonWidget extends StatelessWidget {
  const TextFieldSearchPokemonWidget({
    required this.onChanged,
    required this.onEditingComplete,
    required this.textEditingController,
    required this.suffixIcon,
    required this.textColor,
    Key? key,
  }) : super(key: key);
  final void Function(String?) onChanged;
  final void Function()? onEditingComplete;
  final TextEditingController textEditingController;
  final Widget suffixIcon;
  final Color textColor;

  @override
  Widget build(BuildContext context) => TextField(
        style: TextStyle(
          color: textColor,
        ),
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
            color: PokemonColors.grey,
            fontSize: 14,
          ),
          labelStyle: const TextStyle(
            color: AppColors.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      );
}
