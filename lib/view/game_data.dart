/*import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ping_pong_turns/models/global.dart';
// import 'package:ping_pong_turns/models/sistema.dart';
// import 'package:ping_pong_turns/utils/fetch_data.dart';
import 'package:ping_pong_turns/widgets/widgets.dart';

class GameData extends StatefulWidget {
  const GameData({super.key});

  @override
  State<GameData> createState() => _GameDataState();
}

class _GameDataState extends State<GameData> {
  // late Future<Sistema> sistema;

  @override
  void initState() {
    super.initState();
    // sistema = fetchSystemData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Sistema>(
      future: sistema,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Global.sistema = snapshot.data!;
          return const GameDataContainer();
        } else if (snapshot.hasError) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [HeaderInfo(title: 'Error', subtitle: '${snapshot.error}'),],
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

class GameDataContainer extends StatelessWidget {
  const GameDataContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HeaderInfo(title: 'Partido', subtitle: '${Global.sistema.partido}°'),
        HeaderInfo(title: 'Fecha', subtitle: '${Global.sistema.fecha}'),
        HeaderInfo(title: 'Apuesta', subtitle: '\$${Global.sistema.ganancia}'),
      ],
    );
  }
}
*/