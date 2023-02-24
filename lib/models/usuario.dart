class Usuario {
  final int id;
  final String nickname;
  final int points;
  final int winners;

  Usuario({
    required this.id,
    required this.nickname,
    required this.points,
    required this.winners,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nickname': nickname,
      'points': points,
      'winners': winners,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id']?.toInt() ?? 0,
      nickname: map['nickname'] ?? '',
      points: map['points']?.toInt() ?? 0.0,
      winners: map['winners']?.toInt() ?? 0,
    );
  }

  Usuario copyWith({
    int? id,
    String? nickname,
    int? points,
    int? winners,
  }) {
    return Usuario(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      points: points ?? this.points,
      winners: winners ?? this.winners,
    );
  }
}
