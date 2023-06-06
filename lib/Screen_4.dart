import 'package:flutter/material.dart';

class Screen_4 extends StatefulWidget {
  const Screen_4({super.key});

  @override
  State<Screen_4> createState() => screenWidget();
}

class screenWidget extends State<Screen_4> {
  int openedPage = -1;

  static const List<String> buttons = [
    "Оповещения",
  ];

  List<bool> buttonsState = [
    false
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(children: <Widget>[
      ...buttons.asMap().entries.map((e) => Container(
          height: 50,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Container(
                child: Text(e.value),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              Checkbox(
                value: buttonsState[e.key],
                onChanged: (bool? value) {
                  setState(() {
                    buttonsState[e.key] = !buttonsState[e.key];
                  });

                },
              ),
            ],
          )))
    ]));
  }
}
