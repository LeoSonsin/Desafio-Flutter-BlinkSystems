import 'package:flutter/material.dart';
import 'package:flutter/material.dart' show rootBundle;
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String data = "";
  fetchFileData() async{
    String responseText;
    responseText = await rootBundle.loadString('TextFile/Cidades-SP.txt');

    setState(() {
      data = responseText;
    });
  }

  @override
  void initState() {
    fetchFileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Municípios do estado de São Paulo'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
        return ListTile(
            title: Text(data, style: TextStyle(fontSize: 25.0, color: Colors.black),
          )
        );
      },),
    );
  }
}