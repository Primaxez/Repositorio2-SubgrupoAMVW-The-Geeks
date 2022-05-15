import 'Doctor.dart';
import 'EstadoCita.dart';
import 'Observable.dart';
import 'Observer.dart';
import 'Paciente.dart';
import 'TipoCita.dart';

class Cita implements Observable {
  String fecha;
  EstadoCita estado;
  Doctor doctor;
  Paciente paciente;
  TipoCita tipo;
  String comentario = "";
  int valoracion = -1;
  List<Observer> observers = [];

  Cita(
    this.fecha,
    this.estado,
    this.doctor,
    this.paciente,
    this.tipo, [
    this.comentario = "",
    this.valoracion = -1,
  ]);

  agregarObservacion(String comentario, int valoracion) {
    this.comentario = comentario;
    this.valoracion = valoracion;
  }

  setEstado(EstadoCita estado) {
    this.estado = estado;
    this.notifyall("Se ha modificado el estado de la Cita");
  }

  @override
  void add(Observer observer) {
    this.observers.add(observer);
  }

  @override
  void notifyall(String descripcion) {
    for (final observers in this.observers) {
      print(
          'Cita: Notificando a: $observers[i] que cambio a Estado: $this.estado');
      observers.update(this, descripcion);
    }
  }

  @override
  void remove(Observer observer) {
    this.observers.remove(observer);
  }
}
