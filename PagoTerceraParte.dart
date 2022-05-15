import 'dart:ffi';

import 'DescuentoVisitor.dart';
import 'DetallePago.dart';

class PagoTerceraParte implements DescuentoVisitor {
  @override
  double AplicarDescuento(DetallePago detallePago) {
   return detallePago.monto*(1/3);
  }

}