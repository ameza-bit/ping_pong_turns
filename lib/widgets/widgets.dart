import 'package:flutter/material.dart';
import 'package:ping_pong_turns/models/usuario.dart';

class HeaderInfo extends StatelessWidget {
  const HeaderInfo({
    super.key, required this.title, required this.subtitle,
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: NetworkImage(user.avatar),
              fit: BoxFit.cover)),
      child: Center(child: Text(user.nickname)),
    );
  }
}
