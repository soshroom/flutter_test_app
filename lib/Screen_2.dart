import 'package:flutter/material.dart';

class Screen_2 extends StatefulWidget {
  const Screen_2({super.key});

  @override
  State<Screen_2> createState() => screenWidget();
}

class screenWidget extends State<Screen_2> {

  static const List<String> pages = [
    "Персонаж 1",
    "Персонаж 2",
  ];

  static const List<String> pagesInfo = [
    "Информация о персонаже 1",
    "Информация о персонаже 2",
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
              child: Text( pagesInfo[openedPage]),
            )),
      );
    }
  }
}
