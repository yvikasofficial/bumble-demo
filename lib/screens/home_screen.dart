import 'package:draggable/widget/card.dart';
import 'package:draggable/widget/navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:tcard/tcard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  CardController controller;
  int c = 0;
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "bumble",
          style: TextStyle(
            color: Colors.orange,
            fontSize: 30,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          EvaIcons.heart,
          color: Colors.black54,
          size: 30,
        ),
        actions: [
          GestureDetector(
            child: Icon(
              Icons.sort,
              color: Colors.black54,
              size: 30,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: 7,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Container(
                height: 7,
                width: 200 / 5 * c,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ],
          ),
          isDone ? _showEnd() : _showSlider(),
        ],
      ),
    );
  }

  _showSlider() {
    return Container(
      child: Expanded(
        child: new TinderSwapCard(
          orientation: AmassOrientation.LEFT,
          animDuration: 500,
          totalNum: 5,
          swipeEdge: 2.0,
          allowVerticalMovement: false,
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height * 0.8,
          minWidth: MediaQuery.of(context).size.width * 0.8,
          minHeight: MediaQuery.of(context).size.height * 0.7,
          cardBuilder: (context, index) => ProfileCard(index: index),
          cardController: controller = CardController(),
          swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
            setState(() {
              c++;
            });
            if (index == 4) {
              setState(() {
                isDone = true;
              });
            }
          },
        ),
      ),
    );
  }

  _showEnd() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.emoji_emotions,
            size: 80,
            color: Colors.orange.withOpacity(0.5),
          ),
          Text(
            "You Have Caught up  Everything!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.orange.withOpacity(0.5),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
