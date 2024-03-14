import 'package:flutter/material.dart'
    show
        BuildContext,
        Color,
        Column,
        CrossAxisAlignment,
        Key,
        SizedBox,
        StatelessWidget,
        Text,
        TextStyle,
        Widget,
        Wrap,
        WrapCrossAlignment;

import '../../config/themes/colors.dart';
import '../../core/extensions/context.dart';

class InputField extends StatelessWidget {
  final Widget child;
  final String? label;
  final bool? required;
  final bool? enabled;
  final TextStyle? labelStyle;
  final Color? requiredColor;

  const InputField({
    Key? key,
    required this.child,
    this.label,
    this.required,
    this.labelStyle,
    this.enabled = true,
    this.requiredColor = AppColors.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          children: [
            if (label != null)
              Text(
                label!,
                style: (labelStyle ?? context.titleMedium)!.copyWith(
                  color: enabled == false ? AppColors.greyDark : null,
                ),
              ),
            if (required == true)
              Text(
                "*",
                style: (labelStyle ?? context.titleMedium)?.copyWith(
                  color: enabled == false ? AppColors.greyDark : requiredColor,
                ),
              ),
          ],
        ),
        if (label != null) const SizedBox(height: 8),
        child,
      ],
    );
  }
}
