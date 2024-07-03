import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/movie_repository.dart';
import '../domain/movie_response.dart';

class MoviesService {
  MoviesService({required this.moviesRepository});
  final MoviesRepository moviesRepository;

  Future<MovieResponse> fetchMovies({
    required int page,
    required CancelToken cancelToken,
  }) async {
    return moviesRepository.nowPlayingMovies(
      page: page,
      cancelToken: cancelToken,
    );
  }
}

final moviesServiceProvider = Provider<MoviesService>((ref) {
  return MoviesService(
    moviesRepository: ref.watch(moviesRepositoryProvider),
  );
});
