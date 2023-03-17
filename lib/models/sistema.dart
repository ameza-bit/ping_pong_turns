class Sistema {
  int? partido;
  String? fecha;
  String? ganancia;
  bool? jugando;
  late int dias;
  int? player1;
  int? player2;
  int? player3;

  Sistema({
    this.partido, 
    this.fecha, 
    this.ganancia, 
    this.jugando,
    required this.dias,
    this.player1,
    this.player2,
    this.player3
  });

  Sistema.fromJson(Map<String, dynamic> json) {
    partido = json['Partido'];
    fecha = json['Fecha'];
    ganancia = json['Ganancia'];
    jugando = json['Jugando'];
    dias = json['Dias'];
    player1 = json['Player1'];
    player2 = json['Player2'];
    player3 = json['Player3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Partido'] = partido;
    data['Fecha'] = fecha;
    data['Ganancia'] = ganancia;
    data['Jugando'] = jugando;
    data['Dias'] = dias;
    data['Player1'] = player1;
    data['Player2'] = player2;
    data['Player3'] = player3;
    return data;
  }
}
