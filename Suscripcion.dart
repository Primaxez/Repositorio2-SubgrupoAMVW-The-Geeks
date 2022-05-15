import 'DetallePago.dart';

class Suscripcion{

  String estado;
  List<DetallePago> detallesPagos;

  Suscripcion (this.estado, this.detallesPagos);

  void agregarPago(DetallePago detallePago){
    this.detallesPagos.add(detallePago);
  }

  bool modificarSuscripcion(String estado){
    this.estado = estado;
    return true;
  }


}