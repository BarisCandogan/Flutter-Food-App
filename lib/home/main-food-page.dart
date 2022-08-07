import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learning/widgets/bigtext.dart';
import 'package:learning/widgets/smalltext.dart';
import 'food-page-body.dart';

class mainFoodPage extends StatefulWidget {
  const mainFoodPage({Key? key}) : super(key: key);

  @override
  State<mainFoodPage> createState() => _mainFoodPageState();
}

class _mainFoodPageState extends State<mainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          child: Container(
            margin: EdgeInsets.only(
              top: 45,
            ),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Bigtext(
                        text: "Izmir",
                        color: Color.fromARGB(255, 57, 223, 220),
                        size: 30,
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10)),
                          smallText(
                            text: "Karşıyaka",
                          ),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ],
                  ),
                  Center(
                      child: Container(
                    width: 45,
                    height: 45,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 57, 223, 220),
                    ),
                  ))
                ]),
          ),
        ),
        foodPageBody()
      ]),
    );
  }
}
