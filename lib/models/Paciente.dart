import 'dart:io';
import 'dart:math';

enum Sexo { hombre, mujer }
enum EstadoCivil { soltero, casado, viudo }

class Paciente {
  Sexo sexo;
  EstadoCivil estadoCivil;
  int edad;
  static List<Paciente> _listaPacientes = [];

  Paciente(this.sexo, this.estadoCivil, this.edad);

  static Paciente crearPaciente() {
    print('Ingrese el sexo del paciente (1: Hombre, 2: Mujer):');
    int? sexoInput = int.tryParse(stdin.readLineSync()!);
    Sexo sexo = sexoInput == 1 ? Sexo.hombre : Sexo.mujer;

    print('Ingrese el estado civil del paciente (1: Soltero, 2: Casado, 3: Viudo):');
    int? estadoCivilInput = int.tryParse(stdin.readLineSync()!);
    EstadoCivil estadoCivil;
    switch (estadoCivilInput) {
      case 1:
        estadoCivil = EstadoCivil.soltero;
        break;
      case 2:
        estadoCivil = EstadoCivil.casado;
        break;
      case 3:
        estadoCivil = EstadoCivil.viudo;
        break;
      default:
        throw Exception('Opción inválida para estado civil');
    }

    print('Ingrese la edad del paciente:');
    int? edad = int.tryParse(stdin.readLineSync()!);

    if (sexoInput == null || estadoCivilInput == null || edad == null) {
      throw Exception('Entrada inválida');
    }

    return Paciente(sexo, estadoCivil, edad);
  }


  static void agregarPaciente(Paciente paciente) {
    _listaPacientes.add(paciente);
  }

  static List<Paciente> obtenerListaPacientes() {
    return List.from(_listaPacientes);
  }

  // Rellenar la lista de pacientes antes de empezar
  static void generarPacientesAutomaticamente(int cantidad) {
    for (int i = 0; i < cantidad; i++) {
      Sexo sexo = Random().nextBool() ? Sexo.hombre : Sexo.mujer;
      EstadoCivil estadoCivil = EstadoCivil.values[Random().nextInt(EstadoCivil.values.length)];
      // edades entre 10 y 90
      int edad = Random().nextInt(80) + 10;
      Paciente paciente = Paciente(sexo, estadoCivil, edad);
      agregarPaciente(paciente);
    }
  }

  String get sexoString {
    return sexo == Sexo.hombre ? 'Hombre' : 'Mujer';
  }

  String get estadoCivilString {
    switch (estadoCivil) {
      case EstadoCivil.soltero:
        return 'Soltero';
      case EstadoCivil.casado:
        return 'Casado';
      case EstadoCivil.viudo:
        return 'Viudo';
    }
  }
}

double porcentajeHombresSolteros(List<Paciente> listaPacientes) {
  int totalHombres = 0;
  int hombresSolteros = 0;

  for (var paciente in listaPacientes) {
    if (paciente.sexo == Sexo.hombre) {
      totalHombres++;
      if (paciente.estadoCivil == EstadoCivil.soltero) {
        hombresSolteros++;
      }
    }
  }

  if (totalHombres == 0) {
    return 0; 
  }

  return (hombresSolteros / totalHombres) * 100;
}


double edadPromedioHombresCasados(List<Paciente> listaPacientes) {
  int totalHombresCasados = 0;
  int sumaEdades = 0;

  for (var paciente in listaPacientes) {
    if (paciente.sexo == Sexo.hombre && paciente.estadoCivil == EstadoCivil.casado) {
      totalHombresCasados++;
      sumaEdades += paciente.edad;
    }
  }

  if (totalHombresCasados == 0) {
    return 0; 
  }

  return sumaEdades / totalHombresCasados;
}


double porcentajeMujeresSolteras(List<Paciente> listaPacientes) {
  int totalSolteros = 0;
  int mujeresSolteras = 0;

  for (var paciente in listaPacientes) {
    if (paciente.estadoCivil == EstadoCivil.soltero) {
      totalSolteros++;
      if (paciente.sexo == Sexo.mujer) {
        mujeresSolteras++;
      }
    }
  }

  if (totalSolteros == 0) {
    return 0;
  }

  return (mujeresSolteras / totalSolteros) * 100;
}

