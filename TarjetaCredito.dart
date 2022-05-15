import 'MetodoPago.dart';
class TarjetaCredito implements MetodoPago {

    int nroTarjeta;
    int cvv;
    String nombreTarjeta;

     bool pagar ( double monto ){
       print("Se ha pagado correctamente con TarjetaCredito");
       return true;
    }

    TarjetaCredito (this.nroTarjeta, this.cvv, this.nombreTarjeta );
    
}


void main (){
 TarjetaCredito pago = new TarjetaCredito(685947213589, 684, "Vicente Mirabal");
 // print(pago.correo);
 pago.pagar(19);
}
