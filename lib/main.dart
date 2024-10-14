import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/bloc_observer.dart';
import 'package:movie_app/core/utils/service_locator.dart';
import 'package:movie_app/core/utils/shared_preference.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  setupServerLocator();
  runApp(const MovieApp());
  loadSaveditems();
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
