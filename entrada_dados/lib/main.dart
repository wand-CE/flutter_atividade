import 'package:flutter/material.dart';
import 'database/db_helper.dart';
import 'model/user.dart';

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
    final _formKey = GlobalKey<FormState>();
    final _nameController = TextEditingController();
    final _ageController = TextEditingController();
    final _emailController = TextEditingController();
    final _phoneNumberController = TextEditingController();

    Future<void> _submitForm() async {
      if (_formKey.currentState!.validate()) {
        final user = User(
          nome: _nameController.text,
          idade: int.parse(_ageController.text),
          email: _emailController.text,
          celular: _phoneNumberController.text,
        );

        await DatabaseHelper.instance.addUser(user);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Usuário salvo com sucesso!')));
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        child: Form(
          key: _formKey,
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
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Nome:',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite um nome';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(
                  hintText: 'Idade:',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value == '0') {
                    return 'Digite uma idade válida';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                maxLength: 3,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'E-mail:',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite um email válido';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  hintText: 'Celular:',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite um número de celular válido';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _submitForm();

                    _nameController.clear();
                    _emailController.clear();
                    _ageController.clear();
                    _phoneNumberController.clear();
                  }
                },
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
