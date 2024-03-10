import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/index.dart';

class PageHeader extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showLeading;
  const PageHeader({
    Key? key,
    this.showLeading = true,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: showLeading
          ? const Icon(
              Icons.apps,
              size: 30,
            )
          : null,
      title: Text(
        tr(title ?? defaultAppTitle),
        style: context.appBarStyle,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
