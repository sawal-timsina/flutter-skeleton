import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../atoms/button.dart';

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
            return Button(
              type: ButtonType.transparent,
              icon: const Icon(Icons.directions_bus, size: 24),
              label: tr("Logout"),
              textStyle: Theme.of(context).textTheme.subtitle1,
              disableBorder: true,
              onPressed: () {},
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
