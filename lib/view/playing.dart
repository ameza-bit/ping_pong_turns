import 'package:flutter/material.dart';
import 'package:ping_pong_turns/models/global.dart';
import 'package:ping_pong_turns/models/usuario.dart';
import 'package:ping_pong_turns/widgets/widgets.dart';

class Playing extends StatefulWidget {
  const Playing({super.key});

  @override
  State<Playing> createState() => _PlayingState();
}

class _PlayingState extends State<Playing> {
  void userPoint(Usuario user) {
    user.points += 1;
    if (user.points >= 3) {
      if (user.id == Global.player1.id) {
        Global.player1.playing += 1;
        Global.jugando.add(Global.player2);
        Global.player2 = Global.jugando.first;
        Global.jugando.remove(Global.player2);
        Global.player1.points = Global.player2.points = 0;
      } else {
        Global.player1.playing = 0;
        Global.player2.playing += 1;
        Global.jugando.add(Global.player1);
        Global.player1 = Global.player2;
        Global.player2 = Global.jugando.first;
        Global.jugando.remove(Global.player2);
        Global.player1.points = Global.player2.points = 0;
      }
    }
  }

  String getPoints(int p) {
    switch (p) {
      case 1:
        return "•   ○   ○";
      case 2:
        return "•   •   ○";
      case 3:
        return "•   •   •";
      default:
        return "○   ○   ○";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () => setState(() => userPoint(Global.player1)),
              child: PlayerData(user: Global.player1)),
            Text(getPoints(Global.player1.points))
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TitleText(txt: "VS"),
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () => setState(() => userPoint(Global.player2)),
              child: PlayerData(user: Global.player2)),
            Text(getPoints(Global.player2.points))
          ],
        ),
      ],
    );
  }
}
