

import 'package:flutter/material.dart';
import 'package:Dice/dice_rollar.dart';

const beginAligment = Alignment.topLeft;
const endAligment = Alignment.bottomRight;

//final date = getdate();
class CustomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: beginAligment,
            end: endAligment,
            colors: [color1, color2]),
      ),
      child: DiceRollar(color1: color1,color2: color2,)
    );
  }

  const CustomContainer(
      {required this.color1,
      required this.color2,
      super.key});
  final Color color1;
  final Color color2;

}


