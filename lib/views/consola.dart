import 'dart:io';

import 'package:centro_asistencial_protesis/models/Paciente.dart';

void main(List<String> args) {
  bool running = true;
  List<Paciente> listaPacientes = [];
  Paciente.generarPacientesAutomaticamente(10);

  while (running) {
    print('Menú:');
    print('1. Ingresar nuevo paciente');
    print('2. Mostrar lista de pacientes');
    print('3. Mostrar porcentaje de hombres solteros');
    print('4. Mostrar edad promedio de hombres casados');
    print('5. Mostrar porcentaje de mujeres solteras');
    print('6. Salir');
    print('Ingrese su opción:');

    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case '1':
        // Ingresar nuevo paciente
        Paciente nuevoPaciente = Paciente.crearPaciente();
        Paciente.agregarPaciente(nuevoPaciente);
        print('Se agregó el paciente con éxito\n');
        break;
      case '2':
        // Mostrar lista de pacientes
        listaPacientes = Paciente.obtenerListaPacientes();
        if (listaPacientes.isEmpty) {
          print('No hay pacientes aún.\n');
        } else {
          print('Lista de pacientes:');
          for (var paciente in listaPacientes) {
            print(
                'Sexo: ${paciente.sexoString}, Estado civil: ${paciente.estadoCivilString}, Edad: ${paciente.edad}');
          }
          print('');
        }
        break;
      case '3':
        // Porcentaje de hombres solteros
        double porcentajeHombres = porcentajeHombresSolteros(listaPacientes);
        print('Porcentaje de hombres solteros: $porcentajeHombres%');
        break;
      case '4':
        // Edad promedio de hombres casados
        double edadPromedio = edadPromedioHombresCasados(listaPacientes);
        print('Edad promedio de hombres casados: $edadPromedio');
        break;
      case '5':
        // Porcentaje de mujeres solteras
        double porcentajeMujeres = porcentajeMujeresSolteras(listaPacientes);
        print('Porcentaje de mujeres solteras: $porcentajeMujeres%');
        break;
      case '6':
        running = false;
        break;
      default:
        print('Opción inválida, vuelva a intentarlo\n');
        break;
    }
  }
}
