import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../common/constants/app_colors.dart';
import '../../constants/pokemon_images.dart';

class HeaderIoasysWidget extends StatelessWidget {
  const HeaderIoasysWidget({
    required this.valueSwitch,
    required this.onChangedSwitch,
    Key? key,
  }) : super(key: key);
  final bool valueSwitch;
  final void Function(bool?) onChangedSwitch;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Image.asset(
              PokemonImages.logoIoasys,
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          Text(
            S.of(context).appName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(
            width: 82,
          ),
          Expanded(
            child: Switch(
              value: valueSwitch,
              activeColor: AppColors.primaryColor,
              onChanged: onChangedSwitch,
            ),
          ),
        ],
      );
}
