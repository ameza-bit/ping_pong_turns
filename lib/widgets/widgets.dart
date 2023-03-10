import 'package:flutter/material.dart';
import 'package:ping_pong_turns/models/global.dart';
import 'package:ping_pong_turns/models/usuario.dart';

class HeaderInfo extends StatelessWidget {
  const HeaderInfo({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitleText(txt: title),
          SubtitleText(txt: subtitle),
        ],
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.txt});
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class SubtitleText extends StatelessWidget {
  const SubtitleText({super.key, required this.txt});
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
    );
  }
}

// class PlayerData extends StatelessWidget {
//   const PlayerData({
//     super.key, required this.name, required this.photo,
//   });
//   final String name;
//   final String photo;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 150,
//       width: 150,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           image: DecorationImage(
//               image: NetworkImage(photo),
//               fit: BoxFit.cover)),
//       child: Text(name),
//     );
//   }
// }

class PlayerData extends StatelessWidget {
  const PlayerData({super.key, required this.user});
  final Usuario user;

  String getPoints(int p) {
    switch (p) {
      case 1:
        return "○   •   •";
      case 2:
        return "○   ○   •";
      case 3:
        return "○   ○   ○";
      default:
        return "•   •   •";
    }
  }

  @override
  Widget build(BuildContext context) {
    String nickname = user.id == Global.player1.id
        ? "${user.nickname} (${user.playing})"
        : user.nickname;
    return Column(
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: NetworkImage(user.avatar), fit: BoxFit.cover)),
        ),
        Center(child: SubtitleText(txt: nickname)),
        if (user.id != Global.jugando.first.id) Text(getPoints(user.points))
      ],
    );
  }
}

class OnGameButtons extends StatelessWidget {
  const OnGameButtons({super.key, required this.txt, required this.color, required this.press});

  final String txt;
  final Color color;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: press,
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              //padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 20),
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w200,
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(txt),
          )),
    );
  }
}
