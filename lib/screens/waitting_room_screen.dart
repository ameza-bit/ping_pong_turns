import 'package:flutter/material.dart';
import 'package:ping_pong_turns/models/global.dart';
import 'package:ping_pong_turns/models/usuario.dart';

class WaittingRoom extends StatefulWidget {
  static String routeName = '/waitting-room';
  const WaittingRoom({super.key});

  @override
  State<WaittingRoom> createState() => _WaittingRoomState();
}

class _WaittingRoomState extends State<WaittingRoom> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool ready = Global.jugando.length >= 4;
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
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: ready ?Colors.blue : Colors.blueGrey[900],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 75, vertical: 20),
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w200,
                    )),
                child: Text("Entrar"),
              )),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: FloatingActionButton.extended(
          //     onPressed: Global.jugando.length < 4 ? null : () => {},
          //     label: const Text("Entrar")
          //   ),
          // ),
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
