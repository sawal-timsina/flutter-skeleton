import 'package:easy_localization/easy_localization.dart' show tr;
import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Icon,
        Icons,
        Key,
        PreferredSizeWidget,
        Size,
        SizedBox,
        StatelessWidget,
        Text,
        TextButton,
        Widget;
import 'package:provider/provider.dart' show Consumer;

import '../../providers/auth_provider.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        Consumer<AuthProvider>(
          builder: (_, value, __) {
            if (!value.loggedIn) {
              return const SizedBox.shrink();
            }
            return TextButton.icon(
              icon: const Icon(Icons.directions_bus, size: 24),
              onPressed: () {},
              label: Text(tr("Logout")),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
