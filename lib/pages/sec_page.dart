import 'dart:math';

import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';

class sec_page extends StatefulWidget {
  const sec_page({Key? key}) : super(key: key);

  @override
  State<sec_page> createState() => _sec_pageState();
}

class _sec_pageState extends State<sec_page> {
  AudioPlayer audioPlugin = AudioPlayer();
  Map<String, bool> score = {};
  Map<String, Color> chose = {
    '🙉': Colors.brown,
    '🦍': Colors.grey,
    '🦊': Colors.orange,
    '🦁': Colors.yellow,
    '🐐': Color.fromARGB(255, 203, 144, 122),
    '🐸': Colors.green,
    '🐞': Colors.red,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'مجموعك :',
          textDirection: TextDirection.rtl,
        ),
        titleSpacing: 100,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: chose.keys.map((element) {
              return Expanded(
                  child: Draggable<String>(
                data: element,
                child: (score[element] == true
                    ? Text('✔️', style: TextStyle(fontSize: 40))
                    : Text(element, style: TextStyle(fontSize: 40))),
                feedback: Text(element),
                childWhenDragging: Text('❔', style: TextStyle(fontSize: 40)),
              ));
            }).toList(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: chose.keys.map((element) {
              return buildtarget(element);
            }).toList()
              ..shuffle(Random(1)),
          ),
        ],
      ),
    );
  }

  Widget buildtarget(element) {
    return DragTarget<String>(
      builder: (context, income, reject) {
        if (score[element] == true) {
          return Container(
            color: Colors.white,
            child: Text('صح'),
            alignment: Alignment.center,
            height: 80,
            width: 200,
          );
        } else {
          return Container(
            color: chose[element],
            height: 80,
            width: 200,
          );
        }
      },
      onWillAccept: (data) {
        return data == element;
      },
      onAccept: (data) {
        setState(() {
          score[element] = true;
          audioPlugin.play('assets/Nice Sound Effect.mp3');
        });
      },
    );
  }
}
