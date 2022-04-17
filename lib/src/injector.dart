import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/api/api.dart';

late SharedPreferences sharedPreferences;

Future<void> initializeDependencies() async {
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];

  // await Firebase.initializeApp();

  // init dio
  InitDio()();

  sharedPreferences = await SharedPreferences.getInstance();
}
