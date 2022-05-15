import 'dart:ffi';

import 'DetallePago.dart';

void main (){
  print("Hello");
}

abstract class DescuentoVisitor{
  double AplicarDescuento ( DetallePago detallePago );
}