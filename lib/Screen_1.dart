import 'package:flutter/material.dart';

class Screen_1 extends StatefulWidget {
  const Screen_1({super.key});

  @override
  State<Screen_1> createState() => screenWidget();
}

class screenWidget extends State<Screen_1> {

  static const List<String> pages = [
    "Локация1",
    "Локация2",
    "Локация3",
    "Локация4",
    "Локация5",
    "Локация6",
    "Локация7",
    "Локация8",
    "Локация9",
    "Локация10",
    "Локация11",
    "Локация12",
    "Локация13",
    "Локация14",
    "Локация15",
    "Локация16",
    "Локация17",
    "Локация18",
    "Локация19",
  ];

  static const List<String> pagesInfo = [
    "map1.jpg",
    "map1.jpg",
    "map1.jpg",
    "map1.jpg",
    "map1.jpg",
    "map1.jpg",
    "map1.jpg",
    "map1.jpg",
    "map1.jpg",
    "map1.jpg",
    "map1.jpg",
    "map1.jpg",
    "map1.jpg",
    "map1.jpg",
    "map1.jpg",
    "map1.jpg",
    "map1.jpg",
    "map1.jpg",
    "map1.jpg",
    "map1.jpg",
  ];

  int openedPage = -1;

  @override
  Widget build(BuildContext context) {
    if (openedPage == -1) {
      return Container(
          child: ListView(children: <Widget>[
        ...pages.asMap().entries.map((e) => Container(
              height: 50,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    openedPage = e.key;
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                ),
                child: Center(child: Text(e.value)),
              ),
            ))
      ]));
    } else {
      return Container(
        child: Container(
            child: Center(
          child: Image.asset("lib/assets/" + pagesInfo[openedPage]),
        )),
      );
    }
  }
}
