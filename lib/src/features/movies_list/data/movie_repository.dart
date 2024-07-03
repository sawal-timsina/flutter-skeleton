import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config.dart';
import '../../../config/api/api.dart';
import '../domain/movie_response.dart';

class MoviesRepository {
  Future<MovieResponse> nowPlayingMovies({
    required int page,
    required CancelToken cancelToken,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: '3/movie/now_playing',
      queryParameters: {
        'api_key': Config.apiKey,
        'include_adult': 'false',
        'page': '$page',
      },
    );
    final response = await dio.getUri(uri, cancelToken: cancelToken);
    return MovieResponse.fromJson(response.data);
  }
}

final moviesRepositoryProvider = Provider<MoviesRepository>((ref) {
  return MoviesRepository();
});
