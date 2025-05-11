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
        Text,
        TextButton,
        Widget;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/auth_provider.dart';

class Header extends ConsumerWidget implements PreferredSizeWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      actions: <Widget>[
        Consumer(
          builder: (_, ref, __) {
            final authState = ref.watch(authProvider);
            if (!authState.loggedIn) {
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
