import 'UbicacionGeografica.dart';

abstract class Persona {
  String nombre_usuario;
  String contrasena;
  String nombre;
  UbicacionGeografica ubicacion;

  Persona(this.nombre_usuario, this.contrasena, this.nombre, this.ubicacion);

  modificarDatos(String nombre_usuario, String contrasena, String nombre) {
    this.nombre_usuario = nombre_usuario;
    this.contrasena = contrasena;
    this.nombre = nombre;
  }
}
