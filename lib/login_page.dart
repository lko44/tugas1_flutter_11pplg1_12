import 'package:flutter/material.dart';
import 'package:latihan1_11pplg1/home_page.dart';
import 'package:latihan1_11pplg1/register_page.dart';
import 'package:latihan1_11pplg1/widgets/button.dart';
import 'function/user_data.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernamebenar = TextEditingController();
  final TextEditingController _passwordbenar = TextEditingController();
  void login() {
    // final username = _usernamebenar.text.trim();
    // final password = _passwordbenar.text.trim();

    // Validasi input kosong
    //   if (username.isEmpty || password.isEmpty) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text("Isi dulu username dan password-nya!"),
    //         duration: Duration(seconds: 2),
    //         backgroundColor: Colors.orange,
    //       ),
    //     );
    //     return;
    //   }

    //   // Validasi login
    //   if (username == "Galih" && password == "111") {
    //     print("Berhasil Login");

    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text("Login Berhasil! Selamat datang, $username."),
    //         duration: Duration(seconds: 2),
    //         backgroundColor: Colors.green,

    //       ),
    //     );

    //     _usernamebenar.clear();
    //     _passwordbenar.clear();
    //   } else {
    //     print("Gagal Login");

    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text("Login gagal! Username atau password salah."),
    //         duration: Duration(seconds: 2),
    //         backgroundColor: Colors.red,
    //       ),
    //     );
    //   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page mamang")),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "Siilahkan Masukan Username Dan Password",
              style: TextStyle(fontSize: 20, color: (Colors.blue)),
            ),
            // isian username dan password
            Image.asset(
              'assets/images/SWIM.jpg',
              height: 120, // atur tinggi gambar
              width: 120, // opsional: atur lebar
              fit: BoxFit.cover, // atur cara gambar "mengisi" area
            ),

            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: TextField(
                controller: _usernamebenar,
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // style : hint, hidden char for password
            TextField(
              controller: _passwordbenar,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),

                  // Tombol Login
                  CustomButton(
                    text: "LOGIN",
                    onPressed: () {
                      final username = _usernamebenar.text.trim();
                      final password = _passwordbenar.text.trim();

                      if (registeredUsers[username] == password) {
                        print("Berhasil Login");

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Login Berhasil! Selamat datang."),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.green,
                          ),
                        );

                        _usernamebenar.clear();
                        _passwordbenar.clear();

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      } else {
                        print("Gagal Login");

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Login gagal! Username atau password salah.",
                            ),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                  ),

                  const SizedBox(height: 20),

                  // Teks info
                  const Text(
                    "Belum punya akun?",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors
                          .blueAccent, // Or your app's primary/accent color
                      fontWeight: FontWeight.w600, // Slightly bolder
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Tombol Register
                  CustomButton(
                    text: "Register",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
