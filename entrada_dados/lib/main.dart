import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Entrada de dados',
      home: const EntradaDados(title: 'Entrada de dados'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class EntradaDados extends StatelessWidget {
  const EntradaDados({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        child: Column(
          children: <Widget>[
            const Text(
              'Seja bem vindo! Aplicativo para entrada de dados:',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Nome:',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Idade:',
              ),
              keyboardType: TextInputType.number,
              maxLength: 3,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'E-mail:',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Celular:',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () => {print('Salvando')},
                child: SizedBox(
                  width: 100,
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.save_alt,
                        size: 30,
                      ),
                      Text(
                        ' Salvar',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
