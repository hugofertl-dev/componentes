import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cards Page')),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo3(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo3(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(children: [
        ListTile(
          leading: Icon(Icons.photo_album, color: Colors.blue),
          title: Text('titulo de la Tarjeta'),
          subtitle: Text(
              'Este es un Ejemplo del Subtitulo de la Tarjeta que estamos mostrando en estos momentos'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: () {},
            ),
          ],
        ),
      ]),
    );
  }

  Widget _cardTipo2() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/9/91/Oahu_Landscape.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 200,
            fit: BoxFit.cover,
          ),
          // Image(
          //   image: NetworkImage(
          //       'https://upload.wikimedia.org/wikipedia/commons/9/91/Oahu_Landscape.jpg'),
          // ),
          Container(
              padding: EdgeInsets.all(10.0), child: Text('texto de la Imagen')),
        ],
      ),
    );
  }

  Widget _cardTipo3() {
    final card = Container(
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(
                'https://landscapewpstorage01.blob.core.windows.net/www-landscapeinstitute-org/2015/04/Landscape-and-the-general-election.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 200,
            fit: BoxFit.cover,
          ),
          // Image(
          //   image: NetworkImage(
          //       'https://upload.wikimedia.org/wikipedia/commons/9/91/Oahu_Landscape.jpg'),
          // ),
          Container(
              padding: EdgeInsets.all(10.0), child: Text('texto de la Imagen')),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}
