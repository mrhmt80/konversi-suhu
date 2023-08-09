import 'package:flutter/material.dart';
import 'package:konversi_suhu/widgets/suhu_widget.dart';

class Konversi extends StatefulWidget {
  const Konversi({super.key});

  @override
  State<Konversi> createState() => _KonversiState();
}

class _KonversiState extends State<Konversi> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController userInput = TextEditingController();

  double _kelvin = 0;
  double _reamur = 0;
  double _fahrenheit = 0;
  _konversiSuhu() {
    setState(() {
      if (_formKey.currentState!.validate()) {
        double celsius = double.parse(userInput.text);

        // Konversi
        _kelvin = celsius + 273;
        _reamur = 4 / 5 * celsius;
        _fahrenheit = (celsius * 9 / 5) + 32;

        //untuk test console 
        //print("Fahrenheit: $_fahrenheit");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: userInput,
                  decoration: const InputDecoration(
                    hintText: 'Masukan suhu dalam celcius',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silahkan masukkan suhu dalam celsius';
                    }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SuhuWidget(
                    title: "suhu dalam kelvin",
                    nilai: _kelvin
                        .toStringAsFixed(2), 
                  ),
                  SuhuWidget(
                    title: "suhu dalam reamur",
                    nilai: _reamur
                        .toStringAsFixed(2), 
                  ),
                  SuhuWidget(
                    title: "suhu dalam fahrenheit",
                    nilai: _fahrenheit.toStringAsFixed(2),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: _konversiSuhu,
                child: Text("Tombol"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
