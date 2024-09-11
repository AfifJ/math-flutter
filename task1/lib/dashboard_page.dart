import 'package:flutter/material.dart';
import 'package:login_and_math/ganjilgenap_page.dart';
import 'package:login_and_math/tambahkurang.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  static const List<String> anggota = [
    "Afif Jamhari (124220018)",
    "Habib maulana (124220024)"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 40),
                constraints: BoxConstraints(maxWidth: 300),
                child: Scaffold(
                  body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: Text("Dashboard",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold))),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Kelompok:",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: anggota.length,
                          padding: EdgeInsets.symmetric(
                              vertical: 8), // Padding vertikal untuk ListView
                          itemBuilder: (context, index) {
                            return Text("${index + 1}. ${anggota[index]}");
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: Text(
                            "Pilih Menu",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 40),

                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 18,
                              ),
                              foregroundColor: Colors.black,
                              minimumSize: Size(double.infinity, 0)),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => TambahKurang()),);
                          },
                          child: const Text("Tambah Kurang"),
                        ),
                        SizedBox(height: 12),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 18,
                              ),
                              foregroundColor: Colors.black,
                              minimumSize: Size(double.infinity, 0)),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => GanjilGenap()),);
                          },
                          child: const Text("Ganjil Genap"),
                        ),
                        SizedBox(height: 40),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.shade900,
                              foregroundColor: Colors.white,
                              minimumSize: Size(double.infinity, 0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 18)),
                          onPressed: () {},
                          icon: Icon(Icons.logout),
                          label: Text("Logout"),
                        ) // child: Text("Logout"))
                      ]),
                ))));
  }
}
