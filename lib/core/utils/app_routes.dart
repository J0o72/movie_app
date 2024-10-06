import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/presentation/actors_profile_view.dart';
import 'package:movie_app/Features/home_feature/presentation/cast_view.dart';
import 'package:movie_app/Features/home_feature/presentation/details_view.dart';
import 'package:movie_app/Features/home_feature/presentation/genre_view.dart';
import 'package:movie_app/Features/home_feature/presentation/home_view.dart';
import 'package:movie_app/Features/home_feature/presentation/movies_collection_view.dart';
import 'package:movie_app/Features/home_feature/presentation/review_view.dart';
import 'package:movie_app/Features/home_feature/presentation/saved_view.dart';
import 'package:movie_app/Features/welcome_feature/presentation/views/welcome_view.dart';
import 'package:movie_app/core/utils/collection_model.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kGenreView = '/genreView';
  static const kDetailsView = '/detailsView';
  static const kSavedView = '/savedView';
  static const kMovieCollevionView = '/movieCollevionView';
  static const kCastView = '/castView';
  static const kReviewView = '/reviewView';
  static const kActorProfileView = '/actorView';

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
        builder: (context, state) {
          return GenreView(id: state.extra as int);
        },
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
        builder: (context, state) {
          return MovieCollecionView(
            collectionModel: state.extra as CollectionModel,
          );
        },
      ),
      GoRoute(
        path: kCastView,
        builder: (context, state) => const CastView(),
      ),
      GoRoute(
        path: kReviewView,
        builder: (context, state) => const ReviewView(),
      ),
      GoRoute(
        path: kActorProfileView,
        builder: (context, state) => const ActorProfileView(),
      ),
    ],
  );
}
