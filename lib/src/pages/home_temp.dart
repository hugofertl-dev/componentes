import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: ListView(
        //children: _creaOpciones(),
        children: _creaOpcionesCorta(),
      ),
    );
  }

  // List<Widget> _creaOpciones() {
  //   List<Widget> lista = new List<Widget>();

  //   for (var opt in opciones) {
  //     final widgettemp = ListTile(
  //       title: Text(opt),
  //     );
  //     lista..add(widgettemp)..add(Divider());
  //   }
  //   return lista;
  // }

  List<Widget> _creaOpcionesCorta() {
    return opciones.map((elemento) {
      return Column(
        children: [
          ListTile(
            title: Text(elemento + '!!'),
            subtitle: Text('subTitulo de ' + elemento),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}
