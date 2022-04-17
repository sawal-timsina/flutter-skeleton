import 'package:flutter/material.dart';

import '../../config/themes/colors.dart';
import '../../core/utils/constants.dart';

enum TagType { primary, secondary, transparent }

class Tag extends StatelessWidget {
  final String title;
  final IconData? icon;
  final TagType? type;
  final TextStyle? textStyle;
  final EdgeInsets? padding;

  final Map<TagType, Color> typeColor = {
    TagType.primary: AppColors.primary.shade500,
    TagType.secondary: Colors.transparent,
    TagType.transparent: Colors.transparent,
  };

  final Map<TagType, Color> textColor = {
    TagType.primary: Colors.white,
    TagType.secondary: AppColors.primary.shade500,
    TagType.transparent: AppColors.black,
  };

  Tag({
    Key? key,
    required this.title,
    this.icon,
    this.type = TagType.primary,
    this.textStyle,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: typeColor[type],
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12)
          .merge(padding),
      child: Row(
        children: [
          Icon(
            icon,
            color: textStyle?.color ?? textColor[type],
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: textColor[type])
                .merge(textStyle),
          ),
        ],
      ),
    );
  }
}
