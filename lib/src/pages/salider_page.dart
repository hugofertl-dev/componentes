import 'package:flutter/material.dart';

class SlaiderPage extends StatefulWidget {
  SlaiderPage({Key key}) : super(key: key);

  @override
  _SlaiderPageState createState() => _SlaiderPageState();
}

class _SlaiderPageState extends State<SlaiderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sliders')),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheqBox(),
            _creaSwith(),
            Expanded(child: _crearImagen())
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Tamaño de la Imagen',
        //divisions: 20,
        value: _valorSlider,
        min: 10.0,
        max: 400.0,
        onChanged: (_bloquearCheck)
            ? null
            : (valor) {
                setState(() => _valorSlider = valor);
              });
  }

  _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/65bffdbd-9c46-4271-8b41-8a5982c65591/ddki85x-2e0e1074-9484-4a84-9fb5-dce5e9b28817.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvNjViZmZkYmQtOWM0Ni00MjcxLThiNDEtOGE1OTgyYzY1NTkxXC9kZGtpODV4LTJlMGUxMDc0LTk0ODQtNGE4NC05ZmI1LWRjZTVlOWIyODgxNy5wbmcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.-i4nH4Bt9LkXfeD1bs4MfkUmkhLzBn58Y_qw2Ak7lHU'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  _crearCheqBox() {
    // return Checkbox(
    //     value: _bloquearCheck,
    //     onChanged: (value) {
    //       setState(() {
    //         _bloquearCheck = value;
    //       });
    //     });
    return CheckboxListTile(
        title: Text('Bloquear Slider: '),
        value: _bloquearCheck,
        onChanged: (value) {
          setState(() {
            _bloquearCheck = value;
          });
        });
  }

  _creaSwith() {
    return SwitchListTile(
        title: Text('Bloquear Slider: '),
        value: _bloquearCheck,
        onChanged: (value) {
          setState(() {
            _bloquearCheck = value;
          });
        });
  }
}
