import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _resultController = TextEditingController();

  void _clearFields() {
    _controller1.clear();
    _controller2.clear();
    _resultController.clear(); // <- ini yang benar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Angka Pertama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Angka Kedua',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final nomor1 = double.tryParse(_controller1.text);
                    final nomor2 = double.tryParse(_controller2.text);
                    if (nomor1 != null && nomor2 != null) {
                      final hasil = nomor1 + nomor2;
                      if (hasil % 1 == 0) {
                        _resultController.text = hasil.toInt().toString();
                      }
                    } else {
                      _resultController.text = "Masukkan dulu angkanya, pls.";
                    }
                  },

                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final nomor1 = double.tryParse(_controller1.text);
                    final nomor2 = double.tryParse(_controller2.text);
                    if (nomor1 != null && nomor2 != null) {
                      final hasil = nomor1 - nomor2;
                      if (hasil % 1 == 0) {
                        _resultController.text = hasil.toInt().toString();
                      }
                    } else {
                      _resultController.text = "Masukkan dulu angkanya, pls.";
                    }
                  },
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () {
                   final nomor1 = double.tryParse(_controller1.text);
                    final nomor2 = double.tryParse(_controller2.text);
                    if (nomor1 != null && nomor2 != null) {
                      final hasil = nomor1 * nomor2;
                      if (hasil % 1 == 0) {
                        _resultController.text = hasil.toInt().toString();
                      }
                    } else {
                      _resultController.text = "Masukkan dulu angkanya, pls.";
                    }
                  },
                  child: const Text('×'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final nomor1 = double.tryParse(_controller1.text);
                    final nomor2 = double.tryParse(_controller2.text);
                    if (nomor1 != null && nomor2 != null) {
                      final hasil = nomor1 / nomor2;
                      if (hasil % 1 == 0) {
                        _resultController.text = hasil.toInt().toString();
                      }
                    } else {
                      _resultController.text = "Masukkan dulu angkanya, pls.";
                    }
                  },
                  child: const Text('÷'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _resultController,
              readOnly: true,
              decoration: const InputDecoration(labelText: 'Hasil'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _clearFields,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
}
