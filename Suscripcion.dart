import 'DetallePago.dart';
import 'EstadoSuscripcion.dart';

class Suscripcion {
  EstadoSuscripcion estado;
  List<DetallePago> detallesPagos;

  Suscripcion(this.estado, this.detallesPagos);

  void agregarPago(DetallePago detallePago) {
    this.detallesPagos.add(detallePago);
  }

  bool modificarSuscripcion(EstadoSuscripcion estado) {
    this.estado = estado;
    return true;
  }
}
