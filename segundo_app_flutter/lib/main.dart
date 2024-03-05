import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Segundo App',
      home: const SegundoApp(title: 'Segundo App em Flutter'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SegundoApp extends StatefulWidget {
  const SegundoApp({super.key, required this.title});
  final title;

  @override
  State<SegundoApp> createState() => _SegundoAppState();
}

class _SegundoAppState extends State<SegundoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text(widget.title, style: TextStyle(fontSize: 25)),
        toolbarHeight: 100,
      ),
      body: Image.asset(
        'images/paisagem.jpg',
        fit: BoxFit.fill,
        height: 1000,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {print("Carregando")},
        tooltip: 'pressionar',
        child: const Icon(
          Icons.restore,
          color: Colors.deepOrange,
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepOrange,
        child: SizedBox(
          height: 50,
        ),
      ),
    );
  }
}
