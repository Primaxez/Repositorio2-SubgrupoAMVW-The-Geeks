import 'Especialidad.dart';
import 'EstadoCita.dart';
import 'Persona.dart';
import 'Cita.dart';
import 'Registro.dart';
import 'Medicion.dart';
import 'UbicacionGeografica.dart';

class Doctor extends Persona {
  List<Especialidad> especialidades;

  Doctor(String nombre_usuario, String contrasena, String nombre,
      UbicacionGeografica ubicacion, this.especialidades)
      : super(nombre_usuario, contrasena, nombre, ubicacion);

  crearRegistro(List<Medicion> mediciones, Cita cita) {
    var reg = new Registro(mediciones, cita);
    return reg;
  }

  modificarRegistro(Registro registro, String nombreValor, String evaluacion) {
    registro.editarMedicion(nombreValor, evaluacion, this);
  }

  aceptarCita(Cita cita) {
    cita.setEstado(EstadoCita.CONFIRMADA);
  }
}
