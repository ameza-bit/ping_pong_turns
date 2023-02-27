class Sistema {
  int? partido;
  String? fecha;
  String? ganancia;

  Sistema({this.partido, this.fecha, this.ganancia});

  Sistema.fromJson(Map<String, dynamic> json) {
    partido = json['Partido'];
    fecha = json['Fecha'];
    ganancia = json['Ganancia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Partido'] = partido;
    data['Fecha'] = fecha;
    data['Ganancia'] = ganancia;
    return data;
  }
}
