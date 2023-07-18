import 'package:easy_localization/easy_localization.dart';

import 'config/api/api.dart';

Future<void> initializeDependencies() async {
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];

  // init dio
  InitDio()();
}
