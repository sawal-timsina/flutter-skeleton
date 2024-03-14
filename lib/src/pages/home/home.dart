import 'package:flutter/material.dart'
    show BuildContext, Center, EdgeInsets, ElevatedButton, Text, Widget;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

import '../../core/utils/app_strings.dart' show logout;
import '../../providers/index.dart' show authProvider;
import '../../widgets/index.dart' show AppDrawer, NetworkScaffold, PageHeader;
import 'home_view_model.dart' show HomeViewModel;

class Home extends ConsumerWidget with HomeViewModel {
  static const String routeName = "/home";

  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NetworkScaffold(
      appBar: const PageHeader(
        showLeading: false,
      ),
      bodyPadding: const EdgeInsets.symmetric(horizontal: 20),
      drawer: AppDrawer(
        user: ref.read(authProvider).dbUser,
      ),
      mainBody: Center(
        child: ElevatedButton(
          onPressed: () => onLogout(ref),
          child: const Text(logout),
        ),
      ),
    );
  }
}
