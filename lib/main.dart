import 'package:flutter/material.dart';
import 'package:Dice/custom_container.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: CustomContainer(
          color1: Color(0xFF1c94bc),
          color2: Color(0xFF9edbe7),
        ),
      ),
    );
  }
}
