import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ping_pong_turns/models/global.dart';
import 'package:ping_pong_turns/models/usuario.dart';
import 'package:ping_pong_turns/screens/game_room_screen.dart';
import 'package:ping_pong_turns/utils/fetch_data.dart';

class WaittingRoom extends StatefulWidget {
  static String routeName = '/waitting-room';
  const WaittingRoom({super.key});

  @override
  State<WaittingRoom> createState() => _WaittingRoomState();
}

class _WaittingRoomState extends State<WaittingRoom> {
  void letsPlay(BuildContext context) {
    Global.jugando.shuffle();
    Global.player1 = Global.jugando.first;
    Global.jugando.remove(Global.player1);
    Global.player2 = Global.jugando.first;
    Global.jugando.remove(Global.player2);
    Global.player1.points = Global.player2.points = 0;
    Global.player1.playing = Global.player2.playing = 0;
    fetchLetsPlay();
    Navigator.pushNamed(context, GameRoom.routeName);
  }

  @override
  void initState() {
    super.initState();
    fetchUsuarioData();
    fetchSystemData().whenComplete(() => 
      fetchOnPlaying().then((value) => {
        if(value) Navigator.pushNamed(context, GameRoom.routeName)
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    bool ready = Global.jugando.length >= 3;
    if (Global.usuarios.isEmpty) {
      Timer.periodic(
          const Duration(milliseconds: 1),
          (timer) => setState(
              () => Global.usuarios.isNotEmpty ? timer.cancel() : null));
    }
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Waitting Room"))),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: Global.usuarios.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                bool onList = Global.jugando.contains(Global.usuarios[index]);
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () => setState(() => !onList
                        ? Global.jugando.add(Global.usuarios[index])
                        : Global.jugando.remove(Global.usuarios[index])),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(0, 0, 0, 0)),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: !onList
                              ? const Color.fromARGB(255, 30, 33, 117)
                              : const Color.fromARGB(255, 30, 72, 255)),
                      child: PlayerListItem(player: Global.usuarios[index]),
                    ),
                  ),
                );
              },
            )
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => {if (ready) letsPlay(context)},
                style: ElevatedButton.styleFrom(
                    backgroundColor: ready ? Colors.blue : Colors.blueGrey[900],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 75, vertical: 20),
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w200,
                    )),
                child: const Text("Entrar"),
              )),
        ],
      ),
    );
  }
}

class PlayerListItem extends StatelessWidget {
  const PlayerListItem({
    super.key,
    required this.player,
  });

  final Usuario player;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WaittingText(txt: player.nickname),
            ],
          )),
          Flexible(
              fit: FlexFit.tight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  WaittingText(txt: player.winners.toString()),
                ],
              )),
        ],
      ),
    );
  }
}

class WaittingText extends StatelessWidget {
  const WaittingText({super.key, required this.txt});
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
