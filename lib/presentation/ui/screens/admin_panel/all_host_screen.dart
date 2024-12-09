import 'package:flutter/material.dart';
import 'package:task_scheduler/data/models/guest_model/available_host_model.dart';

import '../../../../data/services/network_caller.dart';
import '../../../../data/utility/urls.dart';

class AllHostScreen extends StatefulWidget {
  const AllHostScreen({super.key});

  @override
  State<AllHostScreen> createState() => _AllHostScreenState();
}

class _AllHostScreenState extends State<AllHostScreen> {

  bool inProgress = false;
  AvailableHostModel availableHostModel = AvailableHostModel();
  List list = [];

  @override
  void initState() {
    super.initState();
    getAllHost();
  }
  Future<void> getAllHost() async {
    inProgress = true;
    setState(() {});
    final response = await NetworkCaller().getMethod(Urls.guestSchedules);

    if (response != null) {
      availableHostModel = AvailableHostModel.fromJson(response);

      for(int i=0; i<availableHostModel.data!.length; i++){
        list.add(availableHostModel.data?[i].hostFullName);
      }


    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Failed', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.red));
      }
    }
    inProgress = false;
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            itemCount: list.length,
            itemBuilder: (context, index){
          return ListTile(
            tileColor: Colors.grey.shade300,
            title: Text(list[index]),
            trailing: InkWell(
                onTap: (){
                  list.removeAt(index);
                  setState(() {

                  });

                },
                child: const Icon(Icons.delete)),
          );
        }, separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                height: 8,
                thickness: 1,
              );
        },),
      ),

    );
  }
}
