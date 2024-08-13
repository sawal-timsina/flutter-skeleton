import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../firebase_options.dart';
import 'config/api/api.dart';

late SharedPreferences sharedPreferences;
final FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics.instance;

Future<void> initializeDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    firebaseAnalytics.setAnalyticsCollectionEnabled(true);
  } catch (e) {
    log("Failed to initailized Firbase:$e");
  }

  //GitHooks.init(targetPath: "bin/git_hooks.dart");

  // init dio
  InitDio()();
  sharedPreferences = await SharedPreferences.getInstance();
}
