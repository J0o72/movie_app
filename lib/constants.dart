import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/saved_view.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/page_with_tab_bar.dart';
import 'package:movie_app/Features/search_feature/presentation/views/search_view.dart';

const kMainColor = Color(0xff1e88e5);

const List<String> innerStyleImages = [
  'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/clothing-store-banner-design-template-e7332aaf6402c88cb4623bf8eb6f97e2_screen.jpg?ts=1620867237',
  'https://cdn.venngage.com/template/thumbnail/small/01b644bd-e75b-4e70-b476-3a786261f066.webp',
  'https://elements-cover-images-0.imgix.net/f67401c2-06cb-4344-979b-f3234d681768?auto=compress%2Cformat&w=900&fit=max&s=75495e228f330d5446b90794cd1319ca',
  'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/online-fashion-sale-banner-template-design-cc34c2027d0bb5ccc2ff90231abaa242_screen.jpg?ts=1613395464',
  'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fashion-store-facebook-ad-banner-design-template-754121190affdca4b258b77da2984528_screen.jpg?ts=1655421066',
  'https://elements-cover-images-0.imgix.net/4d1f9fd2-66a1-440c-9eaf-74bc09e949ce?auto=compress%2Cformat&w=900&fit=max&s=9cfa626fde5f76a7fdb6682aca7f9b68',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTVu6fS_l1hSojzUagIa-lwFCSSeVND1mdz-KmGh0swNZU7hIiFVJXXfzpv1YKUhlxcrc&usqp=CAU',
  'https://image.tmdb.org/t/p/original/ztkUQFLlC19CCMYHW9o1zWhJRNq.jpg',
];

const List<Color> genreColor = [
  Color(0xff2C3E50),
  Color(0xff3B3B98),
  Color(0xff8E44AD),
  Color(0xffC0392B),
  Color(0xff2980B9),
  Color(0xff27AE60),
  Color(0xffE74C3C),
  Color(0xffD35400),
  Color(0xff2C3E50),
  Color(0xff34495E),
  Color(0xff4A235A),
  Color(0xff641E16),
  Color(0xff1ABC9C),
  Color(0xff9B59B6),
  Color(0xff283747),
  Color(0xff2874A6),
  Color(0xff1F1B24),
  Colors.blue,
  Colors.teal,
  Colors.blueGrey,
];

List<Widget> pages = [
  const PageWithTabBarView(),
  const SearchView(),
  const SavedView(),
  const Center(child: Text('Page 4')),
];

List<int> savedMovies = [];
List<int> savedTvShows = [];

Map<String, String> genresForSaved = {
  "28": "Action",
  "12": "Adventure",
  "16": "Animation",
  "35": "Comedy",
  "80": "Crime",
  "99": "Documentary",
  "18": "Drama",
  "10751": "Family",
  "10762": "Kids",
  "10763": "News",
  "10764": "Reality",
  "10765": "Sci-Fi&Fantasy",
  "10766": "Soap",
  "10767": "Talk",
  "10768": "War&Politics",
  "10759": "Action&Adventure",
  "14": "Fantasy",
  "36": "History",
  "27": "Horror",
  "10402": "Music",
  "9648": "Mystery",
  "10749": "Romance",
  "878": "Science Fiction",
  "10770": "TV Movie",
  "53": "Thriller",
  "10752": "War",
  "37": "Western"
};
