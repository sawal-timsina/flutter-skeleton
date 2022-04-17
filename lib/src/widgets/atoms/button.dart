import 'package:flutter/material.dart';

import '../../config/themes/colors.dart';
import '../../core/utils/constants.dart';

enum ButtonType {
  filled,
  outlined,
  transparent,
}

enum ButtonSize {
  small,
  medium,
  large,
}

class Button extends StatelessWidget {
  final String label;
  final Icon? icon;
  final GestureTapCallback onPressed;
  final ButtonType? type;
  final ButtonSize? size;
  final bool? disabled;
  final bool disableBorder;
  final TextStyle? textStyle;
  final EdgeInsets? padding;

  Button({
    Key? key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.type = ButtonType.filled,
    this.size = ButtonSize.large,
    this.disabled = false,
    this.textStyle,
    this.padding,
    this.disableBorder = false,
  }) : super(key: key);

  final Map<ButtonSize, double> sizeValue = {
    ButtonSize.small: 8,
    ButtonSize.medium: 12,
    ButtonSize.large: 16,
  };

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: disabled! ? null : onPressed,
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      disabledElevation: 0,
      highlightElevation: 0,
      constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      padding: EdgeInsets.symmetric(
              vertical: sizeValue[size] ?? 0, horizontal: sizeValue[size] ?? 0)
          .merge(padding),
      textStyle: (size == ButtonSize.large
              ? Theme.of(context).textTheme.button
              : size == ButtonSize.medium
                  ? Theme.of(context).textTheme.subtitle1
                  : Theme.of(context).textTheme.bodyText1)
          ?.merge(textStyle)
          .merge(
            TextStyle(
              color: disabled!
                  ? Colors.white
                  : type == ButtonType.filled
                      ? Colors.white
                      : type == ButtonType.outlined
                          ? Colors.green
                          : Colors.black87,
            ),
          ),
      splashColor: type == ButtonType.filled
          ? Theme.of(context).primaryColorDark
          : type == ButtonType.outlined
              ? Theme.of(context).primaryColorLight
              : null,
      fillColor: disabled!
          ? AppColors.greyDark
          : type == ButtonType.filled
              ? Theme.of(context).primaryColor
              : null,
      shape: RoundedRectangleBorder(
        side: disabled! || type != ButtonType.outlined
            ? BorderSide.none
            : BorderSide(color: Theme.of(context).primaryColor, width: 1),
        borderRadius: BorderRadius.all(
            Radius.circular(disableBorder ? 0 : sizeValue[size] ?? 0)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ...(icon != null ? [icon!, const SizedBox(width: 8)] : []),
          Text(label),
        ],
      ),
    );
  }
}
