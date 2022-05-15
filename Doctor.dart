import 'Persona.dart';
import 'UbicacionGeografica.dart';

class Doctor extends Persona {
  Doctor(String nombre_usuario, String contrasena, String nombre,
      UbicacionGeografica ubicacion)
      : super(nombre_usuario, contrasena, nombre, ubicacion);
}
