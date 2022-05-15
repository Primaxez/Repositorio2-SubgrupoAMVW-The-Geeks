abstract class Persona {
  String nombre_usuario;
  String contrasena;
  String nombre;

  Persona(this.nombre_usuario, this.contrasena, this.nombre);

  modificarDatos(String nombre_usuario, String contrasena, String nombre) {
    this.nombre_usuario = nombre_usuario;
    this.contrasena = contrasena;
    this.nombre = nombre;
  }
}
