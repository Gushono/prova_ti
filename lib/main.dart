import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prova TI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

enum operation { soma, subtracao, multiplicacao, divisao }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var result;
  operation? _operation;
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();

  void calculation(value) {
    setState(() {
      _operation = value;

      if (value == operation.soma) {
        result = int.parse(num1.text) + int.parse(num2.text);
      } else if (value == operation.subtracao) {
        result = int.parse(num1.text) - int.parse(num2.text);
      } else if (value == operation.multiplicacao) {
        result = int.parse(num1.text) * int.parse(num2.text);
      } else if (value == operation.divisao) {
        result = int.parse(num1.text) / int.parse(num2.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                      controller: num1,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.done),
                        hintText: 'Digite o número 1',
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                      )),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: num2,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.done),
                    hintText: 'Digite o número 2',
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ))
              ],
            ),
            SizedBox(height: 20),
            Text("Escolha a operação desejada:"),
            ListTile(
              title: const Text('Adição'),
              leading: Radio<operation>(
                value: operation.soma,
                groupValue: _operation,
                onChanged: (operation? value) {
                  calculation(value);
                },
              ),
            ),
            ListTile(
              title: const Text('Subtração'),
              leading: Radio<operation>(
                value: operation.subtracao,
                groupValue: _operation,
                onChanged: (operation? value) {
                  calculation(value);
                },
              ),
            ),
            ListTile(
              title: const Text('Multiplicação'),
              leading: Radio<operation>(
                value: operation.multiplicacao,
                groupValue: _operation,
                onChanged: (operation? value) {
                  calculation(value);
                },
              ),
            ),
            ListTile(
              title: const Text('Divisão'),
              leading: Radio<operation>(
                value: operation.divisao,
                groupValue: _operation,
                onChanged: (operation? value) {
                  calculation(value);
                },
              ),
            ),
            Row(
              children: [
                Text("Resultado: "),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                    ),
                    child: Center(child: result != null ? Text(result.toString()) : Text("Aqui vem o resultado")),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
