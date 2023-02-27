// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ping_pong_turns/models/sistema.dart';

const apiURL = "http://api.pingpong.bit";

Future<Sistema> fetchSystemData() async {
  final response = await http.post(Uri.parse(apiURL),
      headers: {"Content-Type": "application/json;charset=UTF-8"},
      body: jsonEncode({"action": "Sistema", "mode": "Select"}));
  statusCodesMessage(response.statusCode);
  return Sistema.fromJson(jsonDecode(response.body));
}

// fetchUsuarioData() async {
//   await http
//     .post(Uri.parse(apiURL),
//         headers: {"Content-Type": "application/json;charset=UTF-8"},
//         body: jsonEncode({"action": "Usuario", "mode": "All"}))
//     .then((value) {
//       Global.users = (jsonDecode(value.body) as List).map((e) => Usuario.fromJson(e)).toList();
//     }).then((_) {
//       Global.player1 = Global.users[0];
//       Global.player2 = Global.users[1];
//     });
// }

// Future<Usuario> fetchUsuarioData() async {
//   final response = await http.post(Uri.parse(apiURL),
//       headers: {"Content-Type": "application/json;charset=UTF-8"},
//       body: jsonEncode({"action": "Usuario", "mode": "All"}));
//   statusCodesMessage(response.statusCode);

//   return Usuario.fromJson(jsonDecode(response.body));

//   // return Usuario.fromJson(jsonDecode(response.body));
// }

void statusCodesMessage(code) {
  switch (code) {
    case 200:
      print(" ---------- Coneccion Exitosa ---------- ");
      break;
    default:
      throw Exception('Failed to load\nCode: $code');
  }
}
