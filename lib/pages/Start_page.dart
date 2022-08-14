import 'package:flutter/material.dart';
import 'package:simple_game/pages/sec_page.dart';

class Start_page extends StatelessWidget {
  const Start_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اهلا بك"),
        backgroundColor: (Colors.green),
        titleTextStyle: TextStyle(fontSize: 40),
        titleSpacing: 140,
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
              color: Colors.green,
              child: Text(
                "اضغط هنا للبدء",
              ),
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return sec_page();
                }));
              }),
        ),
      ),
    );
  }
}
