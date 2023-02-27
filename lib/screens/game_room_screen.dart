import 'package:flutter/material.dart';
import 'package:ping_pong_turns/models/global.dart';
import 'package:ping_pong_turns/models/usuario.dart';
import 'package:ping_pong_turns/utils/responsive.dart';
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
  Usuario next = Global.jugando.first;
  @override
  void initState() {
    super.initState();
    next = Global.jugando.first;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //const GameData(),
            const SizedBox(height: 35),
            const Playing(),
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
