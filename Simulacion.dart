import 'DetallePago.dart';
import 'Directorio.dart';
import 'Doctor.dart';
import 'Especialidad.dart';
import 'EstadoPago.dart';
import 'EstadoSuscripcion.dart';
import 'Medicion.dart';
import 'Notificador.dart';
import 'Paciente.dart';
import 'Registro.dart';
import 'Suscripcion.dart';
import 'TarjetaCredito.dart';
import 'TipoCita.dart';
import 'UbicacionGeografica.dart';
import 'Valor.dart';
import 'ValorReferenciado.dart';
import 'Cita.dart';

void main() {
  Valor valPresion = new Valor("Presión Arterial", "mmHg");
  Valor valFrecuencia = new Valor("Frecuencia Cardíaca", "cpm");
  Valor valColesterol = new ValorReferenciado("Colesterol", "mg/dL", 100, 200);

  Especialidad espInternista =
      new Especialidad("Internista", [valPresion, valFrecuencia]);

  Especialidad espCardiologo = new Especialidad(
      "Cardiólogo", [valPresion, valFrecuencia, valColesterol]);

  UbicacionGeografica ubiCaracas = new UbicacionGeografica(
      "Venezuela", "Caracas", "Distrito Capital", 123, 456);

  Doctor docPepe = new Doctor(
      "pepeMarin", "123456", "Pepe Marin", ubiCaracas, [espInternista]);

  print("Se registró el doctor " +
      docPepe.nombre +
      " especialista " +
      docPepe.especialidades[0].nombre);

  Doctor docJuan = new Doctor(
      "juan444", "1234567", "Juan Rondón", ubiCaracas, [espCardiologo]);

  print("Se registró el doctor " +
      docJuan.nombre +
      " especialista " +
      docJuan.especialidades[0].nombre);

  Directorio direDoctores = new Directorio([docPepe, docJuan]);

  direDoctores.add(new Notificador());

  Paciente pacMaria = new Paciente(
      "maria123",
      "123456",
      "Maria Fernanda",
      ubiCaracas,
      44,
      "Contador",
      50,
      "0414123",
      "mariaf@gmail.com",
      new Suscripcion(EstadoSuscripcion.ACTIVA, [
        new DetallePago(EstadoPago.Aprobado, "15/05/22", 400,
            new TarjetaCredito(2512121, 123, "Maria Fernanda Rodriguez"), 365)
      ]));

  print("Se registró la paciente " + pacMaria.nombre);

  pacMaria.buscarEspecialidad(direDoctores, "Internista");

  pacMaria.buscarUbicacion(direDoctores, ubiCaracas);

  Cita citaMaria =
      pacMaria.solicitarCita(docJuan, "15/5/22", TipoCita.TELECONSULTA);

  var valInternista = espInternista.valores;
  List<Medicion> medCitaMaria = [];

  for (var i = 0; i < valInternista.length; i++) {
    medCitaMaria.add(new Medicion(valInternista[i], "100"));
  }

  Registro regCitaMaria = docJuan.crearRegistro(medCitaMaria, citaMaria);

  regCitaMaria.add(new Notificador());

  docJuan.modificarRegistro(regCitaMaria, "Presión Arterial", "50");
}
