import 'package:flutter/material.dart';
import 'dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DashboardPage(),
      // home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                constraints: const BoxConstraints(maxWidth: 300),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                        child: Image.network(
                            'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif')),
                    SizedBox(
                      height: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Align children to the left
                      children: [
                        const Center(
                          child: Text("Login",
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold)),
                        ),
                        const Center(
                          child: Text("Welcome back to UPN",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black54)),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align children to the left
                          children: [
                            const TextField(
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 24),
                                hintText: "Username",
                                hintStyle: TextStyle(color: Colors.black38),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    borderSide:
                                        BorderSide(color: Colors.black12)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            const TextField(
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 24),
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.black38),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    borderSide:
                                        BorderSide(color: Colors.black12)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 24,
                                  ),
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  minimumSize: Size(double.infinity, 0)),
                              onPressed: () {},
                              child: const Text("Login"),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Text("Belum punya akun?"),
                            SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {
                                // navigation logic here
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ) // Add some space before "halo"
                      ],
                    )
                  ],
                ))));
  }
}
