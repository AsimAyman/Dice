import 'dart:developer' as dev;
import 'dart:math';
import 'package:flutter/material.dart';

enum ActiveButtom { player1, player2 }

class DiceRollar extends StatefulWidget {
  const DiceRollar({required this.color1, required this.color2, super.key});
  final Color color1;
  final Color color2;
  @override
  State<DiceRollar> createState() => _DiceRollarState();
}

class _DiceRollarState extends State<DiceRollar> {
  String activeButtom = "Player 1";
  int numOfDice = 1;
  final ran = Random();

  Alignment containerAlign = Alignment.topCenter;
  void rollDice() {
    setState(() {

      containerAlign = containerAlign == Alignment.topCenter
          ? Alignment.bottomCenter
          : Alignment.topCenter;
      activeButtom = activeButtom == "Player 1" ? "Player 2" : "Player 1";
      numOfDice = ran.nextInt(6) + 1;
      dev.log("pressed");
    });
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedAlign(
          duration: const Duration(milliseconds: 500),
          alignment: containerAlign,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 10),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(80)),
              border: Border.all(
                color: const Color(0xFF98ae6c).withOpacity(.4),
                width: 9,
              ),
            ),
          ),
        ),
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              myTextButton('Player 1', widget.color1, activeButtom),
              Image.asset(
                "assets\\images\\dice-$numOfDice.png",
                width: 100,
              ),
              Transform.rotate(
                angle: 3.14,
                child: myTextButton('Player 2', widget.color2, activeButtom),
              ),
            ],
          ),
        ),
      ],
    );
  }

  TextButton myTextButton(txt, Color color, activeButtom) {
    return TextButton.icon(
      onPressed: activeButtom == txt ? rollDice : null,
      icon: const Icon(Icons.play_arrow),
      label: Text(txt),
      style: TextButton.styleFrom(
        backgroundColor:
            activeButtom == txt ? color.withGreen(3) : color.withOpacity(.1),
      ),
    );
  }
}
