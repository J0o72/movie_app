import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/utils/styles.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar().frosted(
        blur: 3,
        frostColor: Colors.black.withOpacity(0),
      ),
      body: currentIndex == 2
          ? pages[currentIndex]
          : IndexedStack(
              index: currentIndex,
              children: pages,
            ),
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
          icon: Icon(
            Icons.home,
          ),
        ),
        BottomNavigationBarItem(
          label: "Search",
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: "Saved",
          icon: Icon(Icons.bookmark_border),
        ),
        BottomNavigationBarItem(
          label: "Me",
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}
