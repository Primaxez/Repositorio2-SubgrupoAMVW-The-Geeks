import 'Cita.dart';
import 'Doctor.dart';
import 'EstadoCita.dart';
import 'EstadoSuscripcion.dart';
import 'HistoriaMedica.dart';
import 'Persona.dart';
import 'Suscripcion.dart';
import 'TipoCita.dart';
import 'UbicacionGeografica.dart';
import 'Directorio.dart';

class Paciente extends Persona {
  int edad;
  String profesion;
  double peso;
  String telefono;
  String correo;
  Suscripcion suscripcion;
  HistoriaMedica? historia;
  Paciente(
      String nombre_usuario,
      String contrasena,
      String nombre,
      UbicacionGeografica ubicacion,
      this.edad,
      this.profesion,
      this.peso,
      this.telefono,
      this.correo,
      this.suscripcion)
      : super(nombre_usuario, contrasena, nombre, ubicacion);

  solicitarCita(
    Doctor doctor,
    String fecha,
    TipoCita tipo,
  ) {
    if (this.suscripcion.estado == EstadoSuscripcion.ACTIVA) {
      Cita cita = new Cita(fecha, EstadoCita.PENDIENTE, doctor, this, tipo);
      var nomDoctor = doctor.nombre;
      print(
          'CITA: Se ha agendado una cita en: $fecha con el Dr. $nomDoctor bajo la modalidad: $tipo');
      return cita;
    }
    print('No posee una suscripcion ACTIVA');
    return null;
  }

  cancelarCita(Cita cita) {
    cita.setEstado(EstadoCita.CANCELADA);
  }

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

  buscarEspecialidad(Directorio directorio, String nomEspecialidad) {
    List<Doctor> listaDocsEsp =
        directorio.buscarPorEspecialidad(nomEspecialidad, this);
    if (listaDocsEsp != []) {
      print("Lista de doctores de la especialidad " + nomEspecialidad + ":");
      for (var i = 0; i < listaDocsEsp.length; i++) {
        print(listaDocsEsp[i].nombre);
      }
    } else {
      print("No se encontraron doctores de la especialidad indicada");
    }
  }

  buscarUbicacion(Directorio directorio, UbicacionGeografica ubicacion) {
    List<Doctor> listaDocsUbi = directorio.buscarPorUbicacion(ubicacion, this);
    if (listaDocsUbi != []) {
      print("Lista de doctores en la ubicacion " +
          ubicacion.ciudad +
          ", " +
          ubicacion.pais +
          ":");
      for (var i = 0; i < listaDocsUbi.length; i++) {
        print(listaDocsUbi[i].nombre);
      }
    } else {
      print("No se encontraron doctores en la ubicacion indicada");
    }
  }

  buscarTop10(Directorio directorio) {
    List<Doctor> listaDocsTop10 = directorio.buscarTop10(this);
    if (listaDocsTop10 != []) {
      print("Lista del top 10 de doctores:");
      for (var i = 0; i < listaDocsTop10.length; i++) {
        print(listaDocsTop10[i].nombre);
      }
    } else {
      print("No se encontraron doctores en el sistema");
    }
  }
}
