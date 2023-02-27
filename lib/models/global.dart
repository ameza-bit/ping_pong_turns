import 'package:ping_pong_turns/models/usuario.dart';

const NO_IMAGE = "https://hips.hearstapps.com/hmg-prod/images/legacy-fre-image-placeholder-1642515924.png";

class Global {
  static List<Usuario> usuarios = [
    Usuario(id: 1, nickname: "Fito", points: 0, playing: 0, winners: 1, avatar: "https://static.samva.io/1/ClienteUsuarioPerfil/ea5c4153_51b7_4710_804b_dad794fad2ac2.jpg"),
    Usuario(id: 2, nickname: "George", points: 0, playing: 0, winners: 1, avatar: "https://static.samva.io/1/ClienteUsuarioPerfil/5740031b_88b4_43c8_9c4a_9b89cef9e1ca2.jpg"),
    Usuario(id: 3, nickname: "Alex", points: 0, playing: 0, winners: 1, avatar: "https://static.samva.io/1/ClienteUsuarioPerfil/fe9af2d3_ef5f_447a_9610_753aafc445912.jpg"),
    Usuario(id: 4, nickname: "Alexis", points: 0, playing: 0, winners: 1, avatar: NO_IMAGE),
    Usuario(id: 5, nickname: "Josue", points: 0, playing: 0, winners: 2, avatar: "https://static.samva.io/1/ClienteUsuarioPerfil/a624701b_52b2_4e72_992a_0b043b65e3a82.jpg"),
    Usuario(id: 6, nickname: "Lalo", points: 0, playing: 0, winners: 0, avatar: "https://static.samva.io/1/ClienteUsuarioPerfil/dc0b0f57_ee71_4ee2_bd49_38442df618f12.jpg"),
    Usuario(id: 7, nickname: "Armando", points: 0, playing: 0, winners: 0, avatar: "https://lh3.googleusercontent.com/a/AGNmyxYRuQwhHQmbw5_IKvqw_tpY1_4bqoYMyJ_u9Lmx=s96-c"),
    Usuario(id: 8, nickname: "David", points: 0, playing: 0, winners: 0, avatar: NO_IMAGE),
  ];

  static List<Usuario> jugando = <Usuario>[];

  static Usuario player1 = Usuario(id: 0, nickname: "nickname", points: 0, playing: 0, winners: 0, avatar: NO_IMAGE);
  static Usuario player2 = Usuario(id: 0, nickname: "nickname", points: 0, playing: 0, winners: 0, avatar: NO_IMAGE);
}
