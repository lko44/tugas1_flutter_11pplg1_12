import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/routes/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile User"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Foto Profil
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/ciper.jpg"), 
                // ganti sesuai asset kamu
              ),
            ),
            const SizedBox(height: 16),

            // Nama User
            const Text(
              "Enriko Raina Patasa",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Email User
            const Text(
              "enriko@example.com",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Card Info
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.school, color: Colors.blueAccent),
                title: const Text("Kelas 10 PPLG 1"),
                subtitle: const Text("Nomor Absen: 12"),
              ),
            ),
            const SizedBox(height: 16),

            // Tombol Logout
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Get.snackbar("Logout", "Kamu berhasil logout! \n Username:Admin \n Password:111",
                    snackPosition: SnackPosition.BOTTOM);
                Get.offNamed(AppRoutes.loginpage);
              },
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
