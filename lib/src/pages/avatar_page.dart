import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          Container(
            margin: EdgeInsets.all(2.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://disenowebakus.net/imagenes/articulos/steve-jobs.jpg'),
              radius: 20.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SJ'),
              backgroundColor: Colors.purple,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://disenowebakus.net/imagenes/articulos/steve-jobs.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
