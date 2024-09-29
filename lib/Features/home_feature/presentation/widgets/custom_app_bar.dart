import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.appBar,
  });

  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      flexibleSpace: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TabBar(
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            labelColor: Colors.red,
            labelStyle: TextStyle(fontSize: 18),
            unselectedLabelColor: Colors.white,
            indicatorColor: kMainColor,
            unselectedLabelStyle: TextStyle(fontSize: 20),
            dividerColor: Colors.transparent,
            tabs: [
              Tab(
                text: "Movies",
              ),
              Tab(
                text: "TV Shows",
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
