import 'package:flutter/material.dart';
import 'package:ping_pong_turns/models/global.dart';
import 'package:ping_pong_turns/models/usuario.dart';
import 'package:ping_pong_turns/screens/playerlist_screen.dart';
import 'package:ping_pong_turns/utils/fetch_data.dart';
import 'package:ping_pong_turns/view/game_data.dart';
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
      Global.sistema.partido = Global.sistema.partido! + 1;
      fetchLetsPlay();
    }
    fetchUpdatePlayer(Global.player1);
    fetchUpdatePlayer(Global.player2);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Usuario next = Global.jugando.first;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const GameData(),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () => setState(() => userPoint(Global.player1)),
                      child: PlayerData(user: Global.player1)),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TitleText(txt: "VS"),
                  ),
                  GestureDetector(
                      onTap: () => setState(() => userPoint(Global.player2)),
                      child: PlayerData(user: Global.player2)),
                ],
              ),
              const SizedBox(height: 35),
              const TitleText(txt: "Siguiente en jugar"),
              const SizedBox(height: 5),
              GestureDetector(
                  // onLongPress: () => ,
                  child: PlayerData(user: next)),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OnGameButtons(
                      txt: "Finalizar Día", color: Colors.red, press: () => {}),
                  OnGameButtons(
                      txt: "Ver jugadores",
                      color: Colors.blue.shade600,
                      press: () =>
                          Navigator.pushNamed(context, PlayerList.routeName)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
