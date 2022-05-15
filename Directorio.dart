import 'Observable.dart';
import 'Observer.dart';
import 'Doctor.dart';
import 'Paciente.dart';
import 'UbicacionGeografica.dart';

class Directorio implements Observable {
  List<Doctor> doctores;
  List<Observer> observers = [];

  Directorio(this.doctores);

  agregarDoctor(Doctor doctor) {
    this.doctores.add(doctor);
  }

  buscarPorEspecialidad(String nomEspecialidad, Paciente paciente) {
    // Retornar una lista con los doctores que tengan la especialidad indicada
    List<Doctor> listaDocsEsp = [];
    var listaDoc = this.doctores;
    for (var i = 0; i < listaDoc.length; i++) {
      var listaEsp = listaDoc[i].especialidades;
      for (var j = 0; j < listaEsp.length; j++) {
        if (listaEsp[j].nombre == nomEspecialidad) {
          listaDocsEsp.add(listaDoc[i]);
          j = listaEsp.length;
        }
      }
    }
    var hoy = new DateTime.now().toIso8601String();
    notifyall("Paciente " +
        paciente.nombre +
        " buscó la especialidad " +
        nomEspecialidad +
        " el " +
        hoy);
    return listaDocsEsp;
  }

  buscarPorUbicacion(UbicacionGeografica ubicacion, Paciente paciente) {
    // Retornar una lista con los doctores que tengan la ubicación geográfica indicada
    List<Doctor> listaDocsUbi = [];
    var listaDoc = this.doctores;
    for (var i = 0; i < listaDoc.length; i++) {
      if (listaDoc[i].ubicacion == ubicacion) {
        listaDocsUbi.add(listaDoc[i]);
      }
    }
    var hoy = new DateTime.now().toIso8601String();
    notifyall("Paciente " +
        paciente.nombre +
        " buscó la ubicación " +
        ubicacion.ciudad +
        ", " +
        ubicacion.pais +
        " el " +
        hoy);
    return listaDocsUbi;
  }

  buscarTop10(Paciente paciente) {
    List<Doctor> listaDocsTop10 = [];
    /*
    Se debe implementar la búsqueda
    */
    var hoy = new DateTime.now().toIso8601String();
    notifyall("Paciente " +
        paciente.nombre +
        " buscó el Top 10 de doctores el " +
        hoy);
    return listaDocsTop10;
  }

  @override
  void add(Observer observer) {
    this.observers.add(observer);
  }

  @override
  void notifyall(String descripcion) {
    for (final observers in this.observers) {
      print(
          'Directorio: Notificando a: $observers[i] que se hizo una búsqueda:');
      observers.update(this, descripcion);
    }
  }

  @override
  void remove(Observer observer) {
    this.observers.remove(observer);
  }
}
