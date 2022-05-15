import 'Registro.dart';

class HistoriaMedica {
  List<Registro> registros = [];

  HistoriaMedica();

  agregarRegistro(Registro registro) {
    this.registros.add(registro);
  }
}
