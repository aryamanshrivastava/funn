import 'package:flutter/material.dart';

import 'login.dart';

void main() => runApp(Hope());

class Hope extends StatelessWidget {
  const Hope({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
