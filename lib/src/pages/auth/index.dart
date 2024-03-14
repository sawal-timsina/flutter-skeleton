import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/app_strings.dart';
import '../../widgets/molecules/index.dart';
import '../../widgets/organisms/network_scaffold.dart';
import '../index.dart';

class Auth extends ConsumerWidget {
  static const String routeName = "/auth";

  const Auth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NetworkScaffold(
      appBar: const PageHeader(
        title: "Flutter App Skeleton",
      ),
      mainBody: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(
              size: 80.0,
            ),
            const SizedBox(
              height: 50,
            ),
            OutlinedButton(
              onPressed: () {
                context.push(Login.routeName);
              },
              child: const Text(login),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                context.push(Register.routeName);
              },
              child: Text(tr(register)),
            ),
          ],
        ),
      ),
    );
  }
}
