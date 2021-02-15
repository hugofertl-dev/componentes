import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routs/routs.dart';

//import 'package:componentes/src/pages/home_temp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('es', ''), // Español, no country code
      ],
      debugShowCheckedModeBanner: false,
      title: 'Componentes APP',
      //home: HomePageTemp(),
      //home: HomePage(),
      initialRoute: '/',
      routes: getAplicationRouts(),
      onGenerateRoute: (settings) {
        print('ruta llamada inexistente: ${settings.name}');
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
