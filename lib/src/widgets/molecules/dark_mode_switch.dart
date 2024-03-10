import 'package:flutter/material.dart'
    show
        BuildContext,
        EdgeInsets,
        MainAxisAlignment,
        Padding,
        Row,
        StatelessWidget,
        Switch,
        Text,
        Widget;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/themes/colors.dart';
import '../../core/utils/app_strings.dart';
import '../../providers/provider_instance.dart';

class DarkModeSwitch extends StatelessWidget {
  final EdgeInsets padding;
  const DarkModeSwitch({super.key, this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            darkMode,
          ),
          Consumer(
            builder: (context, ref, child) {
              final isDarkMode = ref.watch(darkModeProvider);
              return Switch(
                activeColor: AppColors.secondary,
                value: isDarkMode,
                onChanged: (_) => ref.read(darkModeProvider.notifier).toggle(),
              );
            },
          ),
        ],
      ),
    );
  }
}
