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
          title: Text("Confirm Logout",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center),
          content: Text(
            "Are you sure you want to log out?",
            textAlign: TextAlign.center,
          ),
          actions: [
            Row(
              children: [
                CustomButton(
                  isOutlined: true,
                  text: "Cancel",
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
                margin: EdgeInsets.all(40),
                constraints: BoxConstraints(maxWidth: 500),
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
                        SizedBox(height: 40),
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
