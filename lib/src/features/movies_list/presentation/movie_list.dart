// ignore_for_file: lines_longer_than_80_chars

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/movie_response.dart';
import 'movie_list_controller.dart';

class MoviesListView extends ConsumerWidget {
  const MoviesListView({super.key});
  static const String routeName = "/movie-list";

  static const pageSize = 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responseAsync = ref.watch(movieController(1));
    final totalResults = responseAsync.valueOrNull?.totalResults;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies List"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(movieController);
          // keep showing the progress indicator until the first page is fetched
          try {
            await ref.read(
              movieController(1).future,
            );
          } catch (e) {
            // fail silently as the provider error state is handled inside the ListView
          }
        },
        child: ListView.builder(
          itemCount: totalResults,
          itemBuilder: (context, index) {
            final page = index ~/ pageSize + 1;
            final indexInPage = index % pageSize;
            log("page $page indexINpage $indexInPage ");
            // use the fact that this is an infinite list to fetch a new page
            // as soon as the index exceeds the page size
            // Note that ref.watch is called for up to pageSize items
            // with the same page and query arguments (but this is ok since data is cached)
            final AsyncValue<MovieResponse> responseAsync =
                ref.watch(movieController(page));
            return responseAsync.when(
              error: (err, stack) => indexInPage == 0
                  ? Text(err.toString())
                  : const SizedBox.shrink(),
              loading: () => const Text("loading"),
              data: (response) {
                log("length lent ${response.results.length}");
                // This condition only happens if a null itemCount is given
                if (indexInPage >= response.results.length) {
                  return null;
                }
                final movie = response.results[indexInPage];
                return ListTile(
                  title: Text(movie.title ?? "Null"),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
