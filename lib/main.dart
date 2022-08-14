import 'package:flutter/material.dart';
import 'package:simple_game/pages/Start_page.dart';

main() {
  runApp(game());
}

class game extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Start_page(),
    );
  }
}
