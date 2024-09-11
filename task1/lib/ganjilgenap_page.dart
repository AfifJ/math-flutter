import 'package:flutter/material.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.black26)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.black)),
                labelText: 'Masukkan angka',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _ganjilGenap,
              child: const Text('Cek'),
            ),
            const SizedBox(height: 20),
            Text(
              _hasil,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
