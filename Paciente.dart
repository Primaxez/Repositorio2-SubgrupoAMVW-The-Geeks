import 'Cita.dart';
import 'Doctor.dart';
import 'EstadoCita.dart';
import 'EstadoSuscripcion.dart';
import 'HistoriaMedica.dart';
import 'Persona.dart';
import 'Suscripcion.dart';
import 'TipoCita.dart';
import 'UbicacionGeografica.dart';

class Paciente extends Persona {
  int edad;
  String profesion;
  double peso;
  String telefono;
  String correo;
  Suscripcion suscripcion;
  UbicacionGeografica ubicacion;
  HistoriaMedica? historia;
  Paciente(
      String nombre_usuario,
      String contrasena,
      String nombre,
      this.edad,
      this.profesion,
      this.peso,
      this.telefono,
      this.correo,
      this.suscripcion,
      this.ubicacion)
      : super(nombre_usuario, contrasena, nombre);

  solicitarCita(
    Doctor doctor,
    String fecha,
    TipoCita tipo,
  ) {
    if (this.suscripcion.estado == EstadoSuscripcion.ACTIVA) {
      Cita cita = new Cita(fecha, EstadoCita.PENDIENTE, doctor, this, tipo);
      print(
          'CITA: Se ha agendado una cita en: $fecha con el Dr. $doctor.nombre bajo la modalidad: $tipo');
      return cita;
    }
    print('No posee una suscripcion ACTIVA');
    return null;
  }

  cancelarCita(Cita cita) {
    cita.setEstado(EstadoCita.CANCELADA);
  }

  buscarEspecialidad(String especialidad) {}

  setHistoriaMedica(HistoriaMedica historia) {
    this.historia = historia;
  }

  leerHistoriaMedica(HistoriaMedica historia) {
    if (this.historia != null) {
      for (final registro in this.historia!.registros) {
        print(registro);
      }
    } else {
      print('No posee una historia');
    }
  }
}
