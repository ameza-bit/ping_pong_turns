// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'package:ping_pong_turns/models/global.dart';
import 'dart:convert';
import 'package:ping_pong_turns/models/sistema.dart';
import 'package:ping_pong_turns/models/usuario.dart';
import 'package:intl/intl.dart';

const apiURL = "http://api.pingpong.bit";

httpPost(action, mode) {
  return http.post(Uri.parse(apiURL),
      headers: {"Content-Type": "application/json;charset=UTF-8"},
      body: jsonEncode({"action": action, "mode": mode}));
}

Future<Sistema> fetchSystemData() async {
  try {
    final response = await httpPost("Sistema", "Select");
    statusCodesMessage(response.statusCode);
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

void statusCodesMessage(code) {
  switch (code) {
    case 200:
      print(" ---------- Coneccion Exitosa ---------- ");
      break;
    default:
      throw Exception('Failed to load\nCode: $code');
  }
}
