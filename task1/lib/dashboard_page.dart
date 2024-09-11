import 'package:flutter/material.dart';
import 'package:login_and_math/components/custom_button.dart';
import 'package:login_and_math/ganjilgenap_page.dart';
import 'package:login_and_math/login_page.dart';
import 'package:login_and_math/tambahkurang.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  static const List<String> anggota = [
    "Afif Jamhari (124220018)",
    "Habib maulana (124220024)"
  ];

  void _logout(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          title: Text("Konfirmasi Logout",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center),
          content: Text(
            "Apakah anda yakin akan logout? Anda harus login lagi nanti.",
            textAlign: TextAlign.center,
          ),
          actions: [
            Row(
              children: [
                CustomButton(
                  isOutlined: true,
                  text: "Batal",
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
                SizedBox(width: 12),
                CustomButton(
                  text: "Logout",
                  backgroundColor: Colors.red.shade900,
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                    _logout(context); // Proceed with logout
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                margin: EdgeInsets.all(16),
                constraints: BoxConstraints(maxWidth: 500),
                child: Scaffold(
                  body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Center(
                            child: Text("Dashboard",
                                style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold))),
                        SizedBox(
                          height: 60,
                        ),
                        Center(
                          child: Text(
                            "Kelompok:",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                height: 1),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: anggota.length,
                          padding: EdgeInsets.symmetric(
                              vertical: 8), // Padding vertikal untuk ListView
                          itemBuilder: (context, index) {
                            return Text(anggota[index],
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center);
                          },
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Center(
                          child: Text(
                            "Pilih Menu",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 40),
                        CustomButton(
                            isOutlined: true,
                            text: "Tambah Kurang",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TambahKurang()),
                              );
                            }),
                        SizedBox(height: 12),
                        CustomButton(
                          isOutlined: true,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GanjilGenap()),
                            );
                          },
                          text: "Ganjil Genap",
                        ),
                        SizedBox(height: 20),
                        const Row(children: [
                          Expanded(child: Divider()),
                          SizedBox(width: 10),
                          Text("atau"),
                          SizedBox(width: 10),
                          Expanded(child: Divider()),
                        ]),
                        SizedBox(height: 20),
                        CustomButton(
                            text: "Logout",
                            backgroundColor: Colors.red[900],
                            icon: Icons.logout,
                            onPressed: () => _confirmLogout(context)),

                        // child: Text("Logout"))
                      ]),
                ))));
  }
}
