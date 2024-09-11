import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:login_and_math/components/custom_button.dart';
import 'package:login_and_math/components/custom_textfield.dart';

void main() {
  runApp(const MaterialApp(
    home: GanjilGenap(),
  ));
}

class GanjilGenap extends StatefulWidget {
  const GanjilGenap({super.key});

  @override
  _GanjilGenapState createState() => _GanjilGenapState();
}

class _GanjilGenapState extends State<GanjilGenap> {
  final TextEditingController _controller = TextEditingController();
  String _hasil = '';

  void _ganjilGenap() {
    final int? angka = int.tryParse(_controller.text);
    if (angka != null) {
      setState(() {
        _hasil =
            (angka % 2 == 0) ? '$angka adalah genap' : '$angka adalah ganjil';
      });
    } else {
      setState(() {
        _hasil = 'Masukkan angka yang valid';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ganjil Genap'),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.network(
                  "assets/odd_even.png"),
              CustomTextField(
                label: "Masukkan angka",
                controller: _controller,
              ),
              const SizedBox(height: 20),
              CustomButton(text: "Cek", onPressed: _ganjilGenap),
              const SizedBox(height: 20),
              Text(
                _hasil,
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
