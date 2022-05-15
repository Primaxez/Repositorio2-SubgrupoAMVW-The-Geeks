import 'Cita.dart';
import 'Medicion.dart';
import 'Observable.dart';
import 'Observer.dart';
import 'Doctor.dart';

class Registro implements Observable {
  List<Medicion> mediciones;
  Cita cita;
  List<Observer> observers = [];

  Registro(this.mediciones, this.cita);

  agregarMedicion(Medicion medicion) {
    this.mediciones.add(medicion);
  }

  obtenerMedicion(String nombreValor) {
    var listaMed = this.mediciones;
    for (var i = 0; i < listaMed.length; i++) {
      if (listaMed[i].valor.nombre == nombreValor) {
        return listaMed[i];
      }
    }
    return null;
  }

  editarMedicion(String nombreValor, String evaluacion, Doctor doctor) {
    var med = this.obtenerMedicion(nombreValor);
    if (med != null) {
      med.evaluacion = evaluacion;
      var hoy = new DateTime.now().toIso8601String();
      this.notifyall("El doctor " +
          doctor.nombre +
          " editó el valor " +
          nombreValor +
          " el día " +
          hoy);
    }
  }

  @override
  void add(Observer observer) {
    this.observers.add(observer);
  }

  @override
  void notifyall(String descripcion) {
    for (final observers in this.observers) {
      print('Registro: Notificando a: $observers[i] que cambió');
      observers.update(this, descripcion);
    }
  }

  @override
  void remove(Observer observer) {
    this.observers.remove(observer);
  }
}
