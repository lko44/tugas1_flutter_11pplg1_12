import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/helper/db_helper.dart';
import 'package:latihan1_11pplg1/routes/routes.dart';

class ContactController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final names = <String>[].obs;
  final _dbHelper = DBHelper();

  @override
  void onInit() {
    super.onInit();
    fetchNames();
  }

  Future<void> fetchNames() async {
    final data = await _dbHelper.getNames();
    names.value = data.map((e) => e['name'] as String).toList();
  }

  Future<void> addName() async {
    final text = nameController.text.trim();
    if (text.isEmpty) return;
    await _dbHelper.insertName(text);
    nameController.clear();
    fetchNames();
  }

Future<void> deleteName(int index) async {
  final name = names[index];
  Get.defaultDialog(
    title: "Konfirmasi",
    middleText: "Apakah kamu yakin ingin menghapus data ini?",
    textCancel: "Batal",
    textConfirm: "Hapus",
    confirmTextColor: Colors.white,
    onConfirm: () async {
      await _dbHelper.deleteContactByName(name);
      fetchNames();
      Get.back(); // Close the dialog
      Get.snackbar(
        "Success",
        "Deleted successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
    },
  );
}

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
