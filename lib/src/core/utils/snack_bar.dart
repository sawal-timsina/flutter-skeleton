import 'package:flutter/material.dart'
    show
        BuildContext,
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

showError(BuildContext context, {required String message}) {
  _snackBar(
    context,
    icon: Icons.info_outline,
    message: message,
    color: Colors.red,
  );
}

showSuccess(BuildContext context, {required String message}) {
  _snackBar(
    context,
    icon: Icons.info_outline,
    message: message,
    color: Colors.green,
  );
}

showWarning(BuildContext context, {required String message}) {
  _snackBar(
    context,
    icon: Icons.info_outline,
    message: message,
    color: Colors.yellow,
  );
}

showInfo(BuildContext context, {required String message}) {
  _snackBar(
    context,
    icon: Icons.info_outline,
    message: message,
    color: Colors.lightBlue,
  );
}

_snackBar(BuildContext context,
    {required IconData icon, required String message, required Color color}) {
  ScaffoldMessenger.of(context)
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
