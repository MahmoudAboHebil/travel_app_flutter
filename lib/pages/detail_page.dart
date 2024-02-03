import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_flutter/constants/app_colors.dart';
import 'package:travel_app_flutter/cubit/app_cubit_states.dart';
import 'package:travel_app_flutter/cubit/app_cubits.dart';
import 'package:travel_app_flutter/model/data_model.dart';
import 'package:travel_app_flutter/widgets/app_button.dart';
import 'package:travel_app_flutter/widgets/app_large_text.dart';
import 'package:travel_app_flutter/widgets/app_text.dart';
import 'package:travel_app_flutter/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int goldenStars = 4;

  int selectedIndex = -1;

  Color getStarColor(int index, int goldenStars) {
    return (index < goldenStars) ? AppColors.startColor : AppColors.textColor2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is DetailState) {
            DataModel info = state.place;
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 350,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        image: DecorationImage(
                            image: NetworkImage(
                              "http://mark.bslmeiyu.com/uploads/" + info.img,
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 50,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<AppCubits>(context).goHome();
                            },
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 30,
                            )),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 320,
                    child: Container(
                      padding: EdgeInsets.only(top: 30, right: 20, left: 20),
                      height: MediaQuery.of(context).size.height - 320,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          )),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppLargeText(
                                  text: info.name,
                                  color: Colors.black.withOpacity(0.8),
                                ),
                                AppLargeText(
                                  text: '\$ ${info.price}',
                                  color: AppColors.mainColor,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColors.mainColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                AppText(
                                  text: info.location,
                                  color: AppColors.textColor1,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Wrap(
                                  children: List.generate(
                                    5,
                                    (index) {
                                      return Icon(
                                        Icons.star,
                                        color: getStarColor(index, info.stars),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                AppText(
                                  text: '(5.0)',
                                  color: AppColors.textColor2,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            AppLargeText(
                              text: 'People',
                              color: Colors.black.withOpacity(0.8),
                              size: 20,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            AppText(
                              text: 'Number of people in your group',
                              color: AppColors.mainTextColor,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Wrap(
                              children: List.generate(5, (index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: AppButton(
                                      backgroundColor: selectedIndex == index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                      borderColor: selectedIndex == index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                      color: selectedIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                      text: (index + 1).toString(),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            AppLargeText(
                              text: 'Description',
                              color: Colors.black.withOpacity(0.8),
                              size: 20,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                AppText(
                                  text: info.description,
                                  color: AppColors.mainTextColor,
                                ),
                                Container(
                                  height: 50,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          AppButton(
                            size: 60,
                            backgroundColor: Colors.white,
                            borderColor: AppColors.textColor1,
                            color: AppColors.textColor1,
                            isIcon: true,
                            icon: Icons.favorite_border,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          ResponsiveButton(
                            isResponsive: true,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
