import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final respuesta = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(respuesta);
    opciones = dataMap['rutas'];
    return opciones;
  }

  // cargarData() {
  //   rootBundle.loadString('data/menu_opts.json').then((data) {
  //     Map dataMap = json.decode(data);
  //     opciones.add(dataMap['rutas']);
  //     print(opciones);
  //   });
  // }
}

final menuProvider =
    new _MenuProvider(); // con esto lo que hago es que el archivo menu_provider.dart solo muestre esta opcion menuProvider
