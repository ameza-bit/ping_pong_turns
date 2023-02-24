import 'package:ping_pong_turns/models/usuario.dart';

class Global {
  static List<Usuario> usuarios = [
    Usuario(id: 1, nickname: "Fito", points: 0, winners: 1),
    Usuario(id: 2, nickname: "George", points: 0, winners: 1),
    Usuario(id: 3, nickname: "Alex", points: 0, winners: 1),
    Usuario(id: 4, nickname: "Alexis", points: 0, winners: 1),
    Usuario(id: 5, nickname: "Josue", points: 0, winners: 2),
    Usuario(id: 6, nickname: "Lalo", points: 0, winners: 0),
    Usuario(id: 7, nickname: "Armando", points: 0, winners: 0),
    Usuario(id: 8, nickname: "David", points: 0, winners: 0),
  ];

  static List<Usuario> jugando = <Usuario>[];
}
