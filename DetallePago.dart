
import 'DescuentoVisitor.dart';
import 'EstadoPago.dart';
import 'MetodoPago.dart';

class DetallePago {
    EstadoPago estado;
    String fechaPago;
    double monto;
    MetodoPago metodo;
    int cantDias;

    DetallePago (this.estado, this.fechaPago, this.monto, this.metodo, this.cantDias );

    EstadoPago consultarEstado(){
      return this.estado;
    }

    void aceptarDescuento(DescuentoVisitor descuento){
      this.monto = descuento.AplicarDescuento(this);
    }

    pagarSuscripcion(MetodoPago metodoPago){
     metodoPago.pagar(this.monto);
    }



    
}