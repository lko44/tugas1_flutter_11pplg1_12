import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:latihan1_11pplg1/controllers/uma_list_controller.dart';


class UmaListPage extends StatelessWidget {
  UmaListPage({super.key});

  final controller = Get.put(UmaListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uma List'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.umas.isEmpty) {
          return const Center(child: Text('No data found'));
        }

        return RefreshIndicator(
          onRefresh: () { 
            return controller.fetchUmaList();
           },
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: controller.umas.length,
            itemBuilder: (context, index) {
              final uma = controller.umas[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: (uma.thumbImg.isNotEmpty && uma.thumbImg.startsWith('http'))
                        ? CachedNetworkImage(
                            imageUrl: uma.thumbImg,
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
                                const Icon(Icons.broken_image, color: Colors.red),
                          )
                        : const Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                  title: Text(
                    uma.nameJp,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(uma.nameEn),
                  trailing: Text(
                    uma.categoryLabelEn.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
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
