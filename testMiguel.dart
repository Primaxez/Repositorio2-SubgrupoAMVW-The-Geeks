import 'DetallePago.dart';
import 'Doctor.dart';
import 'EstadoCita.dart';
import 'EstadoPago.dart';
import 'EstadoSuscripcion.dart';
import 'HistoriaMedica.dart';
import 'Notificador.dart';
import 'Paciente.dart';
import 'Paypal.dart';
import 'Suscripcion.dart';
import 'TipoCita.dart';
import 'UbicacionGeografica.dart';

void main() {
  var ubic =
      new UbicacionGeografica('Venezuela', 'Miranda', 'Caracas', 150, 120);
  var paypal = new Paypal('james@gmail.com', 'James', 'Rodriguez');
  var detalle_pago =
      new DetallePago(EstadoPago.Aprobado, '2022-05/12', 20, paypal, 30);
  List<DetallePago> lista = [];
  lista.add(detalle_pago);
  var sub = new Suscripcion(EstadoSuscripcion.ACTIVA, lista);
  var pac = new Paciente('james', '12345', 'James', 24, 'Informatico', 100,
      '0212', 'james@gmai.com', sub, ubic);
  var doc = new Doctor('drgonz', '12345', 'Gonzalez');
  var cita = pac.solicitarCita(doc, '2022-05-16', TipoCita.PRESENCIAL);
  var notif = new Notificador();
  if (cita != null) {
    cita.add(notif);
    cita.setEstado(EstadoCita.CONFIRMADA);
    var historia = new HistoriaMedica();
    pac.setHistoriaMedica(historia);
  }
  print(cita);
}
