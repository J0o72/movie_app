import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/Features/home_feature/data/repos/movie_repo/movie_repo_impl.dart';
import 'package:movie_app/Features/home_feature/data/repos/tv_shows_repo/tv_shows_repo_impl.dart';
import 'package:movie_app/core/utils/api_service.dart';

final getIt = GetIt.instance;

void setupServerLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<MovieRepoImpl>(
    MovieRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<TVShowsRepoImpl>(
    TVShowsRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
