import 'package:easy_localization/easy_localization.dart' show tr;
import 'package:flutter/material.dart'
    show AppBar, BuildContext, Center, Scaffold, StatelessWidget, Text, Widget;

import '../../core/utils/app_strings.dart' show pageNotFound;

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr(pageNotFound)),
      ),
      body: Center(
        child: Text(tr(pageNotFound)),
      ),
    );
  }
}
