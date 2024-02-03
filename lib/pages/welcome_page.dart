import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_flutter/constants/app_colors.dart';
import 'package:travel_app_flutter/cubit/app_cubits.dart';
import 'package:travel_app_flutter/widgets/app_text.dart';
import 'package:travel_app_flutter/widgets/responsive_button.dart';

import '../widgets/app_large_text.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'welcome_one.jpg',
    'welcome_two.jpg',
    'welcome_three.jpg',
  ];
  List sentences = [
    'Mountain hikes give you an incredible sense of freedom along with endurance test',
    'Embarking on a safari adventure immerses you in the heart of the wild, where the untamed landscapes and majestic creatures ignite a primal sense of wonder and awe',
    'Delving into ancient ruins offers a captivating journey through history, where every crumbling stone tells a story and every step uncovers secrets of civilizations long past'
  ];
  List subjects = [
    'Mountain',
    'Safari',
    'Ancient Ruins',
  ];
  List colours = [
    AppColors.buttonBackground,
    AppColors.bigTextColor,
    AppColors.mainColor
  ];
  int pageNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        onPageChanged: (value) {
          setState(() {
            pageNumber = value;
          });
        },
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/' + images[index],
                    ),
                    fit: BoxFit.cover)),
            child: Container(
              margin: EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: 'Trips'),
                      AppText(
                        text: subjects[index],
                        size: 30,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        child: AppText(
                          text: sentences[index],
                          color: colours[index],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ResponsiveButton(
                        width: 120,
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).getData();
                          print('hellow');
                        },
                      )
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexSlider) {
                      return AnimatedContainer(
                        margin: EdgeInsets.only(bottom: 2),
                        // curve: Curves.easeIn,
                        duration: Duration(milliseconds: 500),
                        width: 8,
                        height: pageNumber == indexSlider ? 25 : 8,
                        decoration: BoxDecoration(
                            color: index == indexSlider
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8)),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
