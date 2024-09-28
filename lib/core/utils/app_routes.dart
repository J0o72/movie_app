import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/presentation/home_view.dart';
import 'package:movie_app/Features/welcome_feature/presentation/views/welcome_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const WelcomeView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      )
    ],
  );
}
