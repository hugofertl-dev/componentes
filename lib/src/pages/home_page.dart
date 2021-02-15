import 'package:flutter/material.dart';

import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:componentes/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Componetes')),
      body: _lista(),
    );
  }

  Widget _lista() {
    // menuProvider.cargarData().then((opciones) {
    //   print('_lista');
    //   print(opciones);
    // });

    //print(menuProvider.opciones);

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [], //opcional es el valor inical que ba a tener
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        //print('builder@@@');
        print(snapshot.data);
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
    //
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    // if (data == null) {
    //   return [];
    // };

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          //final route = MaterialPageRoute(builder: (context) => AlertPage());
          //Navigator.push(context, route);
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
    // return [
    //   ListTile(
    //     title: Text('Holasssss'),
    //   ),
    //   Divider(),
    //   ListTile(
    //     title: Text('Holasssss'),
    //   ),
    //   Divider(),
    //   ListTile(
    //     title: Text('Holasssss11'),
    //   ),
    //   Divider(),
    // ];
  }
}
