import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_flutter/constants/app_colors.dart';
import 'package:travel_app_flutter/cubit/app_cubit_states.dart';
import 'package:travel_app_flutter/cubit/app_cubits.dart';
import 'package:travel_app_flutter/widgets/app_large_text.dart';
import 'package:travel_app_flutter/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    'Balloning.jpg': 'Balloning',
    'Hiking.jpg': 'Hiking',
    'Kayaking.jpg': 'Kayaking',
    'Snorkling.jpeg': 'Snorkling',
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 70, left: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.menu,
                          size: 30,
                          color: Colors.black54,
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 20),
                      child: AppLargeText(text: 'Discover')),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                          controller: _tabController,
                          isScrollable: true,
                          overlayColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          labelPadding: EdgeInsets.only(left: 20, right: 20),
                          padding: EdgeInsets.all(0),
                          tabAlignment: TabAlignment.start,
                          unselectedLabelColor: Colors.grey,
                          labelColor: Colors.black,
                          indicator: CircleIndicator(
                              width: 4, color: AppColors.mainColor),
                          dividerHeight: 0,
                          tabs: [
                            Tab(
                              text: 'Places',
                            ),
                            Tab(
                              text: 'Inspiration',
                            ),
                            Tab(
                              text: 'Emotions',
                            ),
                          ]),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(left: 20),
                    height: 300,
                    child: TabBarView(controller: _tabController, children: [
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: info.length,
                        itemBuilder: (_, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 15, top: 10),
                            height: 300,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.withOpacity(0.3),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    "http://mark.bslmeiyu.com/uploads/" +
                                        info[index].img,
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          );
                        },
                      ),
                      Text('There'),
                      Text('Bye'),
                    ]),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: 'Explore more',
                          size: 22,
                        ),
                        AppText(
                          text: 'See all',
                          color: AppColors.textColor1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 120,
                    margin: EdgeInsets.only(left: 20),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.withOpacity(0.3),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/' +
                                              images.keys.elementAt(index),
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              AppText(
                                text: images.values.elementAt(index),
                                color: AppColors.textColor2,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
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

class CircleIndicator extends Decoration {
  final double width;
  final Color color;
  CircleIndicator({required this.width, required this.color});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(width: width, color: color);
  }
}

class _CirclePainter extends BoxPainter {
  final double width;
  final Color color;
  _CirclePainter({required this.width, required this.color});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    Offset _offset = Offset(configuration.size!.width / 2 - width / 2,
        configuration.size!.height - width);
    canvas.drawCircle(offset + _offset, width, _paint);
  }
}
