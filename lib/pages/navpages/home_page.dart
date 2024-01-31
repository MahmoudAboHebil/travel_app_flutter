import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_flutter/constants/app_colors.dart';
import 'package:travel_app_flutter/widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
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
                  overlayColor: MaterialStatePropertyAll(Colors.transparent),
                  labelPadding: EdgeInsets.only(left: 20, right: 20),
                  padding: EdgeInsets.all(0),
                  tabAlignment: TabAlignment.start,
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                  indicator:
                      CircleIndicator(width: 4, color: AppColors.mainColor),
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
            height: 300,
            child: TabBarView(controller: _tabController, children: [
              Text('Hi'),
              Text('There'),
              Text('Bye'),
            ]),
          )
        ],
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
