import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: TambahKurang(),
    );
  }
}

class TambahKurang extends StatefulWidget {
  @override
  _TambahKurangState createState() => _TambahKurangState();
}

class _TambahKurangState extends State<TambahKurang> {
  final TextEditingController _numberController1 = TextEditingController();
  final TextEditingController _numberController2 = TextEditingController();
  String _result = '';

  void _hitung(String operation) {
    final int? number1 = int.tryParse(_numberController1.text);
    final int? number2 = int.tryParse(_numberController2.text);

    if (number1 != null && number2 != null) {
      setState(() {
        final result =
            operation == 'Penjumlahan' ? number1 + number2 : number1 - number2;
        _result = 'Hasil: $result';
      });
    } else {
      setState(() {
        _result = 'Masukkan angka yang valid';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Kurang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _numberController1,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.black26)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: 'Angka pertama'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: _numberController2,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.black26)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: 'Angka kedua'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _hitung('Penjumlahan'),
                  child: Text('Penjumlahan'),
                ),
                ElevatedButton(
                  onPressed: () => _hitung('Pengurangan'),
                  child: Text('Pengurangan'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(_result),
          ],
        ),
      ),
    );
  }
}
