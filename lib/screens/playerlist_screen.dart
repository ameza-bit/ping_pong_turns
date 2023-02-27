import 'package:flutter/material.dart';
import 'package:ping_pong_turns/models/global.dart';
import 'package:ping_pong_turns/models/usuario.dart';

class PlayerList extends StatefulWidget {
  static String routeName = '/playerList-room';
  const PlayerList({super.key});

  @override
  State<PlayerList> createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  List<Usuario> j = Global.jugando;
  @override
  Widget build(BuildContext context) {
    j = List.empty(growable: true);
    j.add(Global.player1);
    j.add(Global.player2);
    for (var usuario in Global.jugando) {
      j.add(usuario);
    }
    for (var usuario in Global.usuarios) {
      if (!j.contains(usuario)) {
        j.add(usuario);
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Jugadores")),
      body: Column(
        children: [
          Expanded(
            child: ReorderableListView.builder(
              itemCount: Global.usuarios.length,
              shrinkWrap: true,
              // buildDefaultDragHandles: false,
              itemBuilder: (context, index) {
                bool onList = Global.jugando.contains(j[index]);
                bool playing = index == 0 || index == 1;
                Color color = playing
                    ? const Color.fromARGB(255, 84, 88, 206)
                    : onList
                        ? const Color.fromARGB(255, 30, 72, 255)
                        : const Color.fromARGB(255, 30, 33, 117);

                return Padding(
                  key: Key('$index'),
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () => setState(() => !onList
                        ? Global.jugando.add(j[index])
                        : Global.jugando.remove(j[index])),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(0, 0, 0, 0)),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5), color: color),
                      child:
                          PlayerListItem(player: j[index], index: (1 + index)),
                    ),
                  ),
                );
              },
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  oldIndex -= 2;
                  newIndex -= 2;
                  if (oldIndex < 0 || newIndex < 0 || newIndex > Global.jugando.length || oldIndex >= Global.jugando.length) return;
                  if (oldIndex < newIndex) { newIndex -= 1; }
                  final Usuario item = Global.jugando.removeAt(oldIndex);
                  Global.jugando.insert(newIndex, item);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PlayerListItem extends StatelessWidget {
  const PlayerListItem({
    super.key,
    required this.player,
    required this.index,
  });

  final Usuario player;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
              fit: FlexFit.tight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  WaittingText(txt: index.toString()),
                ],
              )),
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
