import 'package:flutter/material.dart';
import 'package:login_and_math/components/custom_button.dart';
import 'package:login_and_math/components/custom_textfield.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: TambahKurang(),
    );
  }
}

class TambahKurang extends StatefulWidget {
  const TambahKurang({super.key});

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
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 32),
              Image.asset('assets/plus.png'),
              SizedBox(height: 32),
              CustomTextField(
                label: "Angka Pertama",
                controller: _numberController1,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: _numberController2,
                label: "Angka Pertama",
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    isOutlined: true,
                    onPressed: () => _hitung('Pengurangan'),
                    text: "Pengurangan",
                    icon: Icons.remove_circle_outline_rounded,
                  ),
                  SizedBox(width: 20),
                  CustomButton(
                      text: "Penjumlahan",
                      icon: Icons.add_circle_outline_rounded,
                      onPressed: () => _hitung("Penjumlahan"))
                ],
              ),
              SizedBox(height: 20),
              Text(_result),
            ],
          ),
        ),
      ),
    );
  }
}
