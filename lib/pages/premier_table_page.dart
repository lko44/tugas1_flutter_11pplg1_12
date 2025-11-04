import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/controllers/premier_table_controller.dart';

class PremiereTablePage extends StatelessWidget {
  PremiereTablePage({super.key});

  final controller = Get.find<PremiereTableController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Premiere League table")),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
            
            onRefresh: () { 
              return controller.fetchPremiereTable();
            },
            child: ListView.builder(
              itemCount: controller.standings.length,
              itemBuilder: (context, index) {
                final team = controller.standings[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(team.strBadge),),
                      title: Text(team.strTeam),
                      trailing: Text(team.intPoints.toString()),
                      subtitle: Text("Played: "+team.intPlayed+"W:"+team.intWin+"D:"+team.intDraw+"L:"+team.intLoss),
                    ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
