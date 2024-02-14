import 'dart:math';

import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 1;
  int index = 0;
  int angle = 0;

  List<String> sebhaList = ["سبحان الله", "الحمد لله", "الله اكبر"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height:20 ),
        Stack(
            alignment: Alignment.topCenter,
            children: [
          Container(margin: EdgeInsets.all(52),
            child: GestureDetector(
              onTap: () => onSebhaClicked(),
              child: Transform.rotate(
                angle: pi / 180 * angle,
                child: Center(
                  child: Image.asset("assets/images/body_of_seb7a.png"),
                ),
              ),
            ),
          ),
          Image.asset("assets/images/head_of_seb7a.png")
        ]),
        const SizedBox(height: 10),
        Text(
          "عدد التسبيحات",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xff707070),
          ),
          height: MediaQuery.sizeOf(context).height * 0.08,
          width: MediaQuery.sizeOf(context).width * 0.13,

          child: Center(
            child: Text("$counter",
            style: Theme.of(context).textTheme.titleSmall),
          ),
        ),
        const SizedBox(height: 10),
        TextButton(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
              backgroundColor:
                  MaterialStatePropertyAll(Theme.of(context).primaryColor)),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(sebhaList[index],
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
          ),
        )
      ],
    );
  }

  void onSebhaClicked() {
    setState(() {
      counter++;
      angle += 30;
      if (counter <= 33) {
        index = 0;
      } else if (counter <= 66) {
        index = 1;
      } else if (counter <= 99) {
        index = 2;
      } else {
        counter = 1;
        index = 0;
      }
    });
  }
}
