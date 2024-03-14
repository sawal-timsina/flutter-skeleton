import 'package:easy_localization/easy_localization.dart' show tr;
import 'package:flutter/material.dart'
    show
        BuildContext,
        Center,
        Column,
        Image,
        MainAxisSize,
        Scaffold,
        SizedBox,
        StatelessWidget,
        Text,
        TextAlign,
        Widget;

import '../../config/themes/text_styles.dart' show AppTextStyles;
import '../../core/icons.dart' show AppIcons;
import '../../core/utils/app_strings.dart'
    show noInternetConn, pleaseCheckInternetConn;

class InternetNotFound extends StatelessWidget {
  static const String routeName = "/no_internet";

  const InternetNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppIcons.noWifi,
              height: 180,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              tr(noInternetConn),
              style: AppTextStyles.errorStyle.copyWith(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              tr(pleaseCheckInternetConn),
              style: AppTextStyles.errorStyle.copyWith(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
