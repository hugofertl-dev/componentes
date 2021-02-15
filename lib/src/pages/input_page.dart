import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';

  String _opcionSeleccionada = 'Volar';
  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];

  TextEditingController _editingControllerFecha = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de Textos'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearInput(),
          Divider(),
          _crearMail(),
          Divider(),
          _crearPassWord(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
        autofocus: true,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          counter: Text('Cantidad de Letras ${_nombre.length}'),
          hintText: 'Ingrese el Nombre',
          labelText: 'Nombre',
          helperText: 'Solo Ingresa el Nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onChanged: (value) => setState(() {
              _nombre = value;
            }));
  }

  Widget _crearMail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email_outlined),
        icon: Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onChanged: (value) => setState(() {
        _email = value;
      }),
    );
  }

  Widget _crearPassWord() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onChanged: (value) => setState(() {
        //_email = value;
      }),
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _editingControllerFecha,
      decoration: InputDecoration(
        hintText: 'Fecha de Nacimiento',
        labelText: 'Fecha de Nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2000),
        lastDate: new DateTime(2030),
        locale: Locale('es'));
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _editingControllerFecha.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> _getDropDownOpciones() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

  Widget _crearDropDown() {
    return Row(
      children: [
        Icon(Icons.select_all, color: Colors.blue),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
              value: _opcionSeleccionada,
              items: _getDropDownOpciones(),
              onChanged: (opt) {
                setState(() {
                  _opcionSeleccionada = opt;
                });
              }),
        )
      ],
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }
}
