class Sistema {
  int? partido;
  String? fecha;
  String? ganancia;
  bool? jugando;
  late int dias;

  Sistema({
    this.partido, 
    this.fecha, 
    this.ganancia, 
    this.jugando,
    required this.dias
  });

  Sistema.fromJson(Map<String, dynamic> json) {
    partido = json['Partido'];
    fecha = json['Fecha'];
    ganancia = json['Ganancia'];
    jugando = json['Jugando'];
    dias = json['Dias'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Partido'] = partido;
    data['Fecha'] = fecha;
    data['Ganancia'] = ganancia;
    data['Jugando'] = jugando;
    data['Dias'] = dias;
    return data;
  }
}
