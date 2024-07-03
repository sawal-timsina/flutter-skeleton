import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/movies_services.dart';
import '../domain/movie_response.dart';

class MovieListController
    extends AutoDisposeFamilyAsyncNotifier<MovieResponse, int> {
  MovieListController() : super();

  late MoviesService moviesService;

  @override
  FutureOr<MovieResponse> build(int arg) {
    log("debug buid I am called");
    moviesService = ref.watch(moviesServiceProvider);
    final cancelToken = CancelToken();
    final link = ref.keepAlive();
    Timer? timer;
    ref.onDispose(() {
      cancelToken.cancel();
      timer?.cancel();
    });

    ref.onCancel(() {
      timer = Timer(const Duration(seconds: 30), () {
        // Dispose the cached data on timeout
        link.close();
      });
    });

    ref.onResume(() {
      timer?.cancel();
    });

    return moviesService.fetchMovies(
      page: arg,
      cancelToken: cancelToken,
    );
  }
}

final movieController = AsyncNotifierProvider.autoDispose
    .family<MovieListController, MovieResponse, int>(MovieListController.new);
