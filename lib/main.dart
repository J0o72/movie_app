import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Features/home_feature/data/repos/details_repo/details_repo_impl.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/cubit/details_cubit.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/bloc_observer.dart';
import 'package:movie_app/core/utils/service_locator.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  setupServerLocator();
  runApp(BlocProvider(
    create: (context) => DetailsCubit(getIt.get<DetailsRepoImpl>()),
    child: const MovieApp(),
  ));
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
        textTheme: GoogleFonts.josefinSansTextTheme(ThemeData.dark().textTheme),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
