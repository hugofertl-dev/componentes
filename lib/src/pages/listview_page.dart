import 'package:flutter/material.dart';

import 'dart:async';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = new List();
  int _ultimoValor = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agrega10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_agrega10();
        _fechData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
        ),
        body: Stack(
          children: [
            _crearLista(),
            _crearLoading(),
          ],
        ));
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _obtenerPagin1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          //final imagen = _listaNumeros[index];
          return FadeInImage(
            image: NetworkImage(
                'https://picsum.photos/500/300/?image=${_listaNumeros[index]}'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future<Null> _obtenerPagin1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoValor++;
      _agrega10();
    });

    return Future.delayed(duration);
  }

  void _agrega10() {
    for (var i = 1; i < 10; i++) {
      _ultimoValor++;
      _listaNumeros.add(_ultimoValor);
      setState(() {});
    }
  }

  Future<Null> _fechData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(
      seconds: 2,
    );

    new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 259), curve: Curves.fastOutSlowIn);
    _agrega10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(height: 30.0)
        ],
      );
    } else {
      return Container();
    }
  }
}
