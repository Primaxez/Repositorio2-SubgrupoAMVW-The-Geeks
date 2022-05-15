import 'Valor.dart';

class ValorReferenciado extends Valor {
  double referencia_minimo;
  double referencia_maximo;

  ValorReferenciado(String nombre, String unidad_medida, this.referencia_minimo,
      this.referencia_maximo)
      : super(nombre, unidad_medida);
}
