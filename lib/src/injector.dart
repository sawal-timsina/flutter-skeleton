import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/api/api.dart';

late SharedPreferences prefs;
final formKey = GlobalKey<FormBuilderState>();

Future<void> initializeDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];

  //GitHooks.init(targetPath: "bin/git_hooks.dart");

  // init dio
  InitDio()();

  prefs = await SharedPreferences.getInstance();
}
