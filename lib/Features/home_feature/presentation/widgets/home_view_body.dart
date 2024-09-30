import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_app_bar.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/page_with_tab_bar.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/section_home_view_body.dart';
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
    Center(child: Text('Page 2')),
    Center(child: Text('Page 3')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(),
      body: pages[currentIndex],
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
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
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
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
