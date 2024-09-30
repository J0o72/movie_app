import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/page_with_tab_bar.dart';
import 'package:movie_app/Features/search_feature/presentation/views/search_view.dart';
import 'package:movie_app/Features/search_feature/presentation/views/widgets/search_view_body.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/utils/styles.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    PageWithTabBarView(),
    SearchView(),
    Center(child: Text('Page 3')),
    Center(child: Text('Page 4')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar().frosted(
        blur: 3,
        frostColor: Colors.black.withOpacity(0),
      ),
      body: pages[currentIndex],
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.black.withOpacity(0),
      elevation: 0,
      enableFeedback: false,
      onTap: (value) {
        setState(() {
          currentIndex = value;
        });
      },
      currentIndex: currentIndex,
      selectedItemColor: kMainColor,
      selectedLabelStyle:
          Styles.styleText16.copyWith(fontWeight: FontWeight.bold),
      showUnselectedLabels: false,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Search",
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: "Save",
          icon: Icon(Icons.bookmark),
        ),
        BottomNavigationBarItem(
          label: "Me",
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}
