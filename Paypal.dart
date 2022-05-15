import 'MetodoPago.dart';

void main (){
 Paypal pago = new Paypal("vicente@gmail.com", "Vicente", "Mirabal");
 // print(pago.correo);
 pago.pagar(19);
}


class Paypal implements MetodoPago {

    String correo;
    String nombre;
    String apellido;

     bool pagar ( double monto ){
       print("Se ha pagado correctamente con Paypal");
       return true;
    }

    Paypal (this.correo, this.nombre, this.apellido );
    
}