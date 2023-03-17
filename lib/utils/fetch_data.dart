// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'package:ping_pong_turns/models/global.dart';
import 'dart:convert';
import 'package:ping_pong_turns/models/sistema.dart';
import 'package:ping_pong_turns/models/usuario.dart';
import 'package:intl/intl.dart';

const apiURL = "https://josion99.online/API/";

httpPost(action, mode) {
  return http.post(Uri.parse(apiURL),
      headers: {"Content-Type": "application/json;charset=UTF-8"},
      body: jsonEncode({"action": action, "mode": mode}));
}

Future<Sistema> fetchSystemData() async {
  try {
    final response = await httpPost("Sistema", "Select");
    statusCodesMessage(response.statusCode);
    Global.sistema = Sistema.fromJson(jsonDecode(response.body));
    return Sistema.fromJson(jsonDecode(response.body));
  } catch (e) {
    Sistema sistema = Sistema(dias: 0);
    sistema.partido = 0;
    sistema.fecha = getActualDate();
    sistema.ganancia = "10";
    sistema.jugando = true;
    return sistema;
  }
}

String getActualDate() {
  // Obtener la fecha y hora actual
  DateTime now = DateTime.now();
  // Formatear la fecha como una cadena
  String formattedDate = DateFormat('dd/MMM').format(now);
  // Imprimir la fecha formateada
  return formattedDate;
}

fetchUsuarioData() async {
  try {
    final response = await httpPost("Usuario", "All");
    statusCodesMessage(response.statusCode);
    Global.usuarios = (jsonDecode(response.body) as List)
        .map((e) => Usuario.fromJson(e))
        .toList();
  } catch (e) {
    Global.usuarios = Global.usuarios2;
  }
}

fetchLetsPlay() async {
  final response = await http.post(Uri.parse(apiURL),
      headers: {"Content-Type": "application/json;charset=UTF-8"},
      body: jsonEncode({
        "action": 'Usuario',
        "mode": 'SetPlayers',
        "player1": Global.player1.id,
        "player2": Global.player2.id,
        "player3": Global.jugando.first.id
      }));

  statusCodesMessage(response.statusCode);
}

fetchUpdatePlayer(Usuario usuario) async {
  final response = await http.post(Uri.parse(apiURL),
      headers: {"Content-Type": "application/json;charset=UTF-8"},
      body: jsonEncode({
        "action": 'Usuario',
        "mode": 'UpdatePlayers',
        "id": usuario.id,
        "points": usuario.points,
        "playing": usuario.playing,
        "winner": usuario.winners
      }));

  statusCodesMessage(response.statusCode);
}

Future<bool> fetchOnPlaying() async {
  try {
    final response = await httpPost("Sistema", "OnPlaying");
    statusCodesMessage(response.statusCode);

    if (response.body == "true") {
      print("Esta activo con ${Global.sistema.dias} dias");

      for (Usuario user in Global.usuarios) {
        if (Global.sistema.player1 == user.id) Global.player1 = user;
        if (Global.sistema.player2 == user.id) Global.player2 = user;
        if (Global.sistema.player3 == user.id) Global.jugando.add(user);
      }

      return Future.value(true);
    } else {
      return Future.value(false);
    }
  } catch (e) {
    print(e);
    return Future.value(false);
  }
}

fetchEndDay() async {
  final response = await httpPost("Sistema", "EndDay");
  statusCodesMessage(response.statusCode);
}

fetchAddPartida() async {
  final response = await http.post(Uri.parse(apiURL),
      headers: {"Content-Type": "application/json;charset=UTF-8"},
      body: jsonEncode({
        "action": 'Partidas',
        "mode": 'Insert',
        "player1": Global.player1.id,
        "player2": Global.player2.id,
        "jugadas": Global.player1.playing + 1
      }));

  statusCodesMessage(response.statusCode);
}

fetchAddJugada() async {
  final response = await http.post(Uri.parse(apiURL),
      headers: {"Content-Type": "application/json;charset=UTF-8"},
      body: jsonEncode({
        "action": 'Jugadas',
        "mode": 'Insert',
        "player1": Global.player1.id,
        "punto1": Global.player1.points,
        "player2": Global.player2.id,
        "punto2": Global.player2.points
      }));

  statusCodesMessage(response.statusCode);
}

void statusCodesMessage(code) {
  switch (code) {
    case 200:
      print(" ---------- Coneccion Exitosa ---------- ");
      break;
    default:
      throw Exception('Failed to load\nCode: $code');
  }
}
