import 'package:flutter/material.dart';
import 'package:login_and_math/components/custom_button.dart';
import 'package:login_and_math/components/custom_textfield.dart';
import 'package:login_and_math/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("Email: $_email");
      print("Password: $_password");

      if (_email == "admin@gmail.com" && _password == "admin") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid credentials')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            constraints: const BoxConstraints(maxWidth: 300),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Center(
                  child: Image.network(
                    'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error);
                    },
                  ),
                ),
                const SizedBox(height: 40),
                const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                const Center(
                  child: Text(
                    "Welcome back to UPN",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 40),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (e) => _email = e ?? '',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!value.contains("@")) {
                            return "Email is not valid";
                          }
                          return null;
                        },
                        label: "Email",
                        icon: Icons.person_sharp,
                      ),
                      const SizedBox(height: 24),
                      CustomTextField(
                        onSaved: (e) => _password = e ?? '',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        label: "Password",
                        obsecure: true,
                        icon: Icons.lock,
                      ),
                      const SizedBox(height: 40),
                      CustomButton(text: "Login", onPressed: _submit),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Text("Belum punya akun?"),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              // navigation logic here
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
