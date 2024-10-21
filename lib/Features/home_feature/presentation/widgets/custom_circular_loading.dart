import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomCircularLoading extends StatelessWidget {
  const CustomCircularLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        enabled: true,
        child: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: SizedBox(
            width: 177,
            child: GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: AspectRatio(
                            aspectRatio: 2.8 / 3.5,
                            child: Image.asset(
                                'assets/images/movie_welcome_screen_bg.jpg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    "Youssef abdallah ibrahim",
                    style: Styles.styleText18,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Icon(
                                Icons.star_rate_rounded,
                                size: 24,
                                color: Colors.yellow,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '9.9',
                              textAlign: TextAlign.end,
                              style: Styles.styleText20,
                            ),
                            Text(
                              "/10",
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              '(2024)',
                              style: Styles.styleText16,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
