import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/controllers/hsr_list_controller.dart';

class HsrListPage extends StatelessWidget {
  HsrListPage({super.key});

  final controller = Get.put(CharacterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character List'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.characters.isEmpty) {
          return const Center(child: Text('No characters found'));
        }

        return RefreshIndicator(
          onRefresh: () { 
            return controller.fetchCharacterList();
           },
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: controller.characters.length,
            itemBuilder: (context, index) {
              final char = controller.characters[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: char.img,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const SizedBox(
                        width: 50,
                        height: 50,
                        child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error, color: Colors.red),
                    ),
                  ),
                  title: Text(
                    char.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text('${char.path} • ${char.element}'),
                  trailing: Text(
                    '${char.rarity}★',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: char.rarity >= 5 ? Colors.amber[700] : Colors.grey[600],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
