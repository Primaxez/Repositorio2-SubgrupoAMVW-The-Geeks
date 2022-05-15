class UbicacionGeografica {
  String pais;
  String estado;
  String ciudad;
  double lat;
  double long;

  UbicacionGeografica(this.pais, this.ciudad, this.estado, this.lat, this.long);

  actualizarUbicacion(String ciudad, String estado) {
    this.ciudad = ciudad;
    this.estado = estado;
  }
}
