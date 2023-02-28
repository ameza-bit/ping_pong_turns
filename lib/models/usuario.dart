class Usuario {
  late int id;
  late String nickname;
  late int points; // Un juego de 3 de 3
  late int playing;  // Veces jugando consecutivamente
  late int winners; // Veces ganadas en general
  late String avatar;

  Usuario({
    required this.id,
    required this.nickname,
    required this.points,
    required this.playing,
    required this.winners,
    required this.avatar,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nickname': nickname,
      'points': points,
      'playing': playing,
      'winners': winners,
      'avatar': avatar,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id']?.toInt() ?? 0,
      nickname: map['nickname'] ?? '',
      points: map['points']?.toInt() ?? 0,
      playing: map['playing']?.toInt() ?? 0,
      winners: map['winners']?.toInt() ?? 0,
      avatar: map['avatar'] ?? '',
    );
  }

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    nickname = json['Nickname'];
    points = json['Points'];
    playing = json['Playing'];
    winners = json['Winners'];
    avatar = json['Avatar'];
  }

  Usuario copyWith({
    int? id,
    String? nickname,
    int? points,
    int? playing,
    int? winners,
    String? avatar,
  }) {
    return Usuario(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      points: points ?? this.points,
      playing: playing ?? this.playing,
      winners: winners ?? this.winners,
      avatar: avatar ?? this.avatar,
    );
  }
}
