import 'package:flutter/material.dart'
    show
        BoxDecoration,
        BuildContext,
        CircleAvatar,
        Column,
        Drawer,
        EdgeInsets,
        FlutterLogo,
        StatelessWidget,
        Text,
        UserAccountsDrawerHeader,
        Widget;

import '../../config/themes/colors.dart' show AppColors;
import '../../core/utils/app_strings.dart' show defaultAppTitle;
import '../../models/user/user.dart';
import '../molecules/dark_mode_switch.dart' show DarkModeSwitch;

class AppDrawer extends StatelessWidget {
  final User? user;

  const AppDrawer({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: AppColors.secondary),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: AppColors.white,
              child: FlutterLogo(
                size: 40,
              ),
            ),
            accountName: Text(user?.fullName ?? defaultAppTitle),
            accountEmail: Text(user?.email ?? ''),
          ),
          const DarkModeSwitch(
            padding: EdgeInsets.symmetric(horizontal: 10),
          ),
        ],
      ),
    );
  }
}
