import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget implements PreferredSizeWidget {
  const PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Icon(
            Icons.apps,
            size: 48,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 8),
          Text(
            tr("Skeleton"),
            style: Theme.of(context).textTheme.headline1,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
