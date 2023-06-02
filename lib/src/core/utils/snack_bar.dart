import 'package:flutter/material.dart'
    show
        Color,
        Colors,
        CrossAxisAlignment,
        Flexible,
        Icon,
        IconData,
        Icons,
        Row,
        ScaffoldMessenger,
        SingleChildScrollView,
        SizedBox,
        SnackBar,
        Text;

import '../../app.dart';

showError({required String message}) {
  _snackBar(icon: Icons.info_outline, message: message, color: Colors.red);
}

showSuccess({required String message}) {
  _snackBar(icon: Icons.info_outline, message: message, color: Colors.green);
}

showWarning({required String message}) {
  _snackBar(icon: Icons.info_outline, message: message, color: Colors.yellow);
}

showInfo({required String message}) {
  _snackBar(
      icon: Icons.info_outline, message: message, color: Colors.lightBlue);
}

_snackBar(
    {required IconData icon, required String message, required Color color}) {
  ScaffoldMessenger.of(mainNavigator.currentState!.context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
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
    ));
}
