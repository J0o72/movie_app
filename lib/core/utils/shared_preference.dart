import 'package:movie_app/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> loadSaveditems() async {
  print('Saved Items Loaded');
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // Load the saved list from SharedPreferences
  List<String>? moviesStringList = prefs.getStringList('savedMovies');
  List<String>? tvStringList = prefs.getStringList('savedTvShows');

  if (moviesStringList != null) {
    // Convert List<String> to List<int> and assign it to savedMovies
    savedMovies =
        moviesStringList.map((movieId) => int.parse(movieId)).toList();
  }

  if (tvStringList != null) {
    savedTvShows = tvStringList.map((tvId) => int.parse(tvId)).toList();
  }
}

Future<void> saveItems() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // Convert List<int> to List<String>
  List<String> moviesStringList =
      savedMovies.map((movieId) => movieId.toString()).toList();
  List<String> tvStringList =
      savedMovies.map((tvId) => tvId.toString()).toList();

  // Save the list to SharedPreferences
  await prefs.setStringList('savedMovies', moviesStringList);
  await prefs.setStringList('savedTvShows', tvStringList);
}
