import 'package:flutter/material.dart';
import 'package:ping_pong_turns/models/global.dart';
import 'package:ping_pong_turns/models/usuario.dart';
import 'package:ping_pong_turns/view/game_data.dart';
import 'package:ping_pong_turns/view/playing.dart';
import 'package:ping_pong_turns/widgets/widgets.dart';

class GameRoom extends StatefulWidget {
  static String routeName = '/game-room';
  const GameRoom({super.key});

  @override
  State<GameRoom> createState() => _GameRoomState();
}

class _GameRoomState extends State<GameRoom> {
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
    Usuario next = Global.jugando.first;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const GameData(),
            const SizedBox(height: 35),
            Row(
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
            ),
            const SizedBox(height: 35),
            const TitleText(txt: "Siguiente en jugar"),
            const SizedBox(height: 5),
            PlayerData(user: next),
          ],
        ),
      ),
    );
  }
}
