import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

//watch the search query `searchProvider`
final searchProvider =
    NotifierProvider.autoDispose<SearchNotifier, String>(SearchNotifier.new);

//AutoDispose the state on page disposed
class SearchNotifier extends AutoDisposeNotifier<String> {
  Timer? _debounceTimer;

  @override
  String build() {
    // initial search value;
    return "";
  }

  setSearchQuery({required String query}) {
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      state = query;
    });
  }

  resetSearch() {
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      state = "";
    });
  }
}
