import 'package:app_version_update/app_version_update.dart';
import 'package:app_version_update/data/models/app_version_data.dart';
import 'package:store_redirect/store_redirect.dart';

import 'extensions/other_extenstion.dart';

Future<void> versionUpdater() async {
  try {
    const country = 'np';
    AppVersionData data = await AppVersionUpdate.checkForUpdates(
      country: country,
      appleId: "appleId", // your apple id
      versionChecker: ({required localVersion, required storeVersion}) {
        final int localVersionNum = localVersion.removeDot();
        final int storeVersionNum = storeVersion.removeDot();
        return storeVersionNum > localVersionNum;
      },
    );
    if (data.canUpdate) {
      StoreRedirect.redirect(
        iOSAppId: "appleId", // your apple id
      );
    }
    // ignore: empty_catches
  } catch (e) {}
}
