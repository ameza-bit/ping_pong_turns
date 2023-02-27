import 'package:flutter/material.dart';
import 'package:ping_pong_turns/screens/game_room_screen.dart';
import 'package:ping_pong_turns/screens/playerlist_screen.dart';
import 'package:ping_pong_turns/screens/waitting_room_screen.dart';
import 'package:ping_pong_turns/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: bgColor),
      routes: {
        WaittingRoom.routeName: (context) => const WaittingRoom(),
        GameRoom.routeName: (context) => const GameRoom(),
        PlayerList.routeName: (context) => const PlayerList(),
      },
      initialRoute: WaittingRoom.routeName,
    );
  }
}