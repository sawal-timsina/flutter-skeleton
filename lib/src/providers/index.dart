import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'connectivity_provider.dart';

final connectivityStatusProvider = StateNotifierProvider((ref) {
  return ConnectivityStatusNotifier();
});
