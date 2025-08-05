import 'package:flutter/material.dart';
import 'package:latihan1_11pplg1/login_page.dart';
import 'package:latihan1_11pplg1/widgets/button.dart';
import 'function/user_data.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _jenisKelamin; // Laki-laki / Perempuan
  DateTime? _tanggalLahir;

  void _pickTanggalLahir() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2005, 1, 1),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _tanggalLahir = picked;
      });
    }
  }

  void _handleRegister() {
    final nama = _namaController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (nama.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        _jenisKelamin == null ||
        _tanggalLahir == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Isi semua field dengan benar ya mamang!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Pendaftaran berhasil 🎉"),
        backgroundColor: Colors.green,
      ),
    );
    // Simpan email dan password ke "database sementara"
    registeredUsers[nama] = password;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Pendaftaran berhasil 🎉"),
        backgroundColor: Colors.green,
      ),
    );

    // Kembali ke halaman login
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),

              // Nama
              TextField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              // Email / Username
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              // Password
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),

              const SizedBox(height: 16),

              // Jenis Kelamin Dropdown
              DropdownButtonFormField<String>(
                value: _jenisKelamin,
                decoration: const InputDecoration(
                  labelText: 'Jenis Kelamin',
                  border: OutlineInputBorder(),
                ),
                items: ['Laki-laki', 'Perempuan']
                    .map((jk) => DropdownMenuItem(value: jk, child: Text(jk)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _jenisKelamin = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              // Tanggal Lahir Picker
              GestureDetector(
                onTap: _pickTanggalLahir,
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Tanggal Lahir',
                    border: OutlineInputBorder(),
                  ),
                  child: Text(
                    _tanggalLahir == null
                        ? 'Pilih tanggal'
                        : '${_tanggalLahir!.day}/${_tanggalLahir!.month}/${_tanggalLahir!.year}',
                    style: TextStyle(
                      color: _tanggalLahir == null
                          ? Colors.grey[600]
                          : Colors.black,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Tombol Register
              CustomButton(
                text: "Register!",
                textcolor: Colors.black,
                onPressed: _handleRegister,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
