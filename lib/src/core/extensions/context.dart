import 'package:flutter/material.dart'
    show
        BuildContext,
        Color,
        Colors,
        CrossAxisAlignment,
        Flexible,
        FontWeight,
        Icon,
        IconData,
        MediaQuery,
        Row,
        ScaffoldMessenger,
        ScaffoldMessengerState,
        SingleChildScrollView,
        Size,
        SizedBox,
        SnackBar,
        Text,
        TextStyle,
        Theme,
        ThemeData,
        Widget,
        Wrap,
        showModalBottomSheet;
import 'package:go_router/go_router.dart';

extension BuildContextExtension<T> on BuildContext {
  /*------------------ go router --------------*/
  GoRouter get router => GoRouter.of(this);

  GoRouterState get routerState => GoRouterState.of(this);

  /*------------------ size --------------*/

  Size get size => MediaQuery.of(this).size;

  double get width => size.width;

  double get height => size.height;

  /*------------------ theme --------------*/
  ThemeData get theme => Theme.of(this);

  /*------------------ text styles --------------*/

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;

  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get appBarStyle => Theme.of(this).appBarTheme.titleTextStyle;

  /*------------------ Theme colors --------------*/

  Color get primaryColor => Theme.of(this).primaryColor;

  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  Color get primary => Theme.of(this).colorScheme.primary;

  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;

  Color get secondary => Theme.of(this).colorScheme.secondary;

  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;

  Color get cardColor => Theme.of(this).cardColor;

  Color get errorColor => Theme.of(this).colorScheme.error;

  Color get background => Theme.of(this).colorScheme.background;

/*------------------ custom text style  --------------*/
  TextStyle? get languageButtonStyle => this
      .bodySmall
      ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold);

  /*------------------ bottom sheet and snackbar  --------------*/

  Future<T?> showBottomSheet(
    Widget child, {
    bool isScrollControlled = true,
    Color? backgroundColor,
    Color? barrierColor,
  }) {
    return showModalBottomSheet(
      context: this,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      builder: (context) => Wrap(children: [child]),
    );
  }

  ScaffoldMessengerState snackBar({
    required IconData icon,
    required String message,
    required Color color,
  }) {
    return ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: SingleChildScrollView(
                  child: Text(
                    message,
                    softWrap: true,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: color,
        ),
      );
  }
}
