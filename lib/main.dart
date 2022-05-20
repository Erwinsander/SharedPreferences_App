import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(DatosApp());

class DatosApp extends StatefulWidget {
  const DatosApp({Key? key}) : super(key: key);

  @override
  State<DatosApp> createState() => _DatosAppState();
}

class _DatosAppState extends State<DatosApp> {
  int value = 0;
  _changeValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      value = value + 1;
      prefs.setInt("value", value);
    });
  }

  @override
  void initState() {
    super.initState();
    _cargarPreferencias();
  }

  _cargarPreferencias() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      value = prefs.getInt("value") ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Almacenamiento Interno",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Almacenamiento Interno"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  value.toString(),
                  style: TextStyle(fontSize: 45),
                ),
              ),
              ElevatedButton(
                  onPressed: _changeValue, child: Text("Aumentar Valor")),
            ],
          ),
        ),
      ),
    );
  }
}
