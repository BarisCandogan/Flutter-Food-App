import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learning/widgets/bigtext.dart';
import 'package:learning/widgets/icon-text-widgets.dart';
import 'package:learning/widgets/smalltext.dart';
import 'package:learning/widgets/icon-text-widgets.dart';

class foodPageBody extends StatefulWidget {
  const foodPageBody({Key? key}) : super(key: key);

  @override
  State<foodPageBody> createState() => _foodPageBodyState();
}

class _foodPageBodyState extends State<foodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currentPageValue = 0.0;
  double scaleFactor = 0.8;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        height: 320,
        child: PageView.builder(
            itemCount: 5,
            controller: pageController,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            }));
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == currentPageValue.floor()) {
      var currentScale = 1 - (currentPageValue - index) * (1 - scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
    } else if (index == currentPageValue.floor() + 1) {
      var currentScale =
          scaleFactor + (currentPageValue - index + 1) * (1 - scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/image/food.jpeg"))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(top: 10),
              height: 120,
              margin: EdgeInsets.only(left: 40, right: 40, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0, 5),
                    )
                  ]),
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 10, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Bigtext(text: "Chinese Side"),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 26, 230, 189),
                                    size: 15,
                                  )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        smallText(
                          text: "4.5",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        smallText(
                          text: "1287",
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        smallText(
                          text: "comments",
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        IconTextWidget(
                            icon: Icons.circle_sharp,
                            text: "normal",
                            iconColor: Colors.orange),
                        IconTextWidget(
                            icon: Icons.location_on,
                            text: "normal",
                            iconColor: Color(0xFF69c5df)),
                        IconTextWidget(
                            icon: Icons.access_time_rounded,
                            text: "normal",
                            iconColor: Color.fromARGB(255, 225, 127, 127)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
