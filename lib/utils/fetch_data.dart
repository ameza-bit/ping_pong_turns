// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'package:ping_pong_turns/models/global.dart';
import 'dart:convert';
import 'package:ping_pong_turns/models/sistema.dart';
import 'package:ping_pong_turns/models/usuario.dart';

const apiURL = "http://api.pingpong.bit";

Future<Sistema> fetchSystemData() async {
  final response = await http.post(Uri.parse(apiURL),
      headers: {"Content-Type": "application/json;charset=UTF-8"},
      body: jsonEncode({"action": "Sistema", "mode": "Select"}));
  statusCodesMessage(response.statusCode);
  return Sistema.fromJson(jsonDecode(response.body));
}

fetchUsuarioData() async {
  final response = await http.post(Uri.parse(apiURL),
      headers: {"Content-Type": "application/json;charset=UTF-8"},
      body: jsonEncode({"action": "Usuario", "mode": "All"}));
  statusCodesMessage(response.statusCode);
  Global.usuarios = (jsonDecode(response.body) as List).map((e) => Usuario.fromJson(e)).toList();
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
