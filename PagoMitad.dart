import 'dart:ffi';

import 'DescuentoVisitor.dart';
import 'DetallePago.dart';

class PagoMitad implements DescuentoVisitor {
  @override
  double AplicarDescuento(DetallePago detallePago) {
   return detallePago.monto*0.5;
  }

}
