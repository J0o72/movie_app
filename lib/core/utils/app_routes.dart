import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/presentation/cast_view.dart';
import 'package:movie_app/Features/home_feature/presentation/details_view.dart';
import 'package:movie_app/Features/home_feature/presentation/genre_view.dart';
import 'package:movie_app/Features/home_feature/presentation/home_view.dart';
import 'package:movie_app/Features/home_feature/presentation/movies_collection_view.dart';
import 'package:movie_app/Features/home_feature/presentation/saved_view.dart';
import 'package:movie_app/Features/welcome_feature/presentation/views/welcome_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kGenreView = '/genreView';
  static const kDetailsView = '/detailsView';
  static const kSavedView = '/savedView';
  static const kMovieCollevionView = '/movieCollevionView';
  static const kCastView = '/castView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const WelcomeView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kGenreView,
        builder: (context, state) => const GenreView(),
      ),
      GoRoute(
        path: kDetailsView,
        builder: (context, state) => const DetailsView(),
      ),
      GoRoute(
        path: kSavedView,
        builder: (context, state) => const SavedView(),
      ),
      GoRoute(
        path: kMovieCollevionView,
        builder: (context, state) => const MovieCollecionView(),
      ),
      GoRoute(
        path: kCastView,
        builder: (context, state) => const CastView(),
      ),
    ],
  );
}
