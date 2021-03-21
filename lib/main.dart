import 'package:flutter/material.dart';
import 'package:flutter_animations/widget_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        ElevatedButton(
          child: Text("Scale Exemple"),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => _scaleExemplo()));
          },
        ),
      ]),
    ));
  }

  Scaffold _scaleExemplo() {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Scale Exemple"),
        centerTitle: true,
      ),
      body: Center(
        child: WidgetsTransition(
          firstWidget: Container(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Carregar"),
            ),
          ),
          secondWidget: Container(
            color: Colors.black,
            height: 64,
            width: 64,
            child: CircularProgressIndicator(strokeWidth: 8),
          ),
        ),
      ),
    );
  }
}
