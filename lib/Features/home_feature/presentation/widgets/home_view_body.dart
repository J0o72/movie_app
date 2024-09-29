import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_app_bar.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/section_home_view_body.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          appBar: AppBar(),
        ),
        body: const TabBarView(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SectionHomeViewBody(),
                ),
              ],
            ),
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SectionHomeViewBody(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
