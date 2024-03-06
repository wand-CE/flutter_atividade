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
  static List<String> landscapes = [
    'https://www.ignant.com/wp-content/uploads/2016/04/lukegram_ontheroad-61.jpg',
    'https://www.ignant.com/wp-content/uploads/2016/04/lukegram_ontheroad-62.jpg',
    'https://www.ignant.com/wp-content/uploads/2016/04/lukegram_ontheroad-77.jpg',
    'https://www.ignant.com/wp-content/uploads/2016/04/lukegram_ontheroad-125good.jpg',
  ];

  int _counter = 0;

  void changeImage(){
    setState(() {
      _counter = (_counter == (landscapes.length - 1)) ? 0 : _counter+1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text(widget.title, style: TextStyle(fontSize: 25)),
        toolbarHeight: 100,
      ),
      body: Image.network(
        landscapes[_counter],
        fit: BoxFit.fill,
        height: 1000,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => changeImage(),
        tooltip: 'Trocar paisagem',
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
