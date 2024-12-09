import 'package:flutter/material.dart';
import 'package:task_scheduler/data/models/guest_model/all_guest_model.dart';
import 'package:task_scheduler/data/models/guest_model/available_host_model.dart';

import '../../../../data/services/network_caller.dart';
import '../../../../data/utility/urls.dart';

class AllGuestScreen extends StatefulWidget {
  const AllGuestScreen({super.key});

  @override
  State<AllGuestScreen> createState() => _AllGuestScreenState();
}

class _AllGuestScreenState extends State<AllGuestScreen> {
  bool inProgress = false;
  AllGuestModel allGuestModel = AllGuestModel();
  List list = [];

  @override
  void initState() {
    super.initState();
    getAllHost();
  }

  Future<void> getAllHost() async {
    setState(() {
      inProgress = true;
    });
    final response = await NetworkCaller().getMethod(Urls.allGuest);

    if (response != null) {
      allGuestModel = AllGuestModel.fromJson(response);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Failed', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.red));
      }
    }
    setState(() {
      inProgress = false;
    });
  }

  Future<void> deleteGuest(String guestId) async {
    if (guestId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Invalid Guest ID',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.red));
      return;
    }

    final response = await NetworkCaller().getMethod(Urls.deleteAllGuest(guestId));

    if (response != null) {

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Deleted',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.green));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Failed',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: allGuestModel.data!.length,
          itemBuilder: (context, index) {
            return ListTile(
              tileColor: Colors.grey.shade300,
              title: Text(allGuestModel.data![index].fullName ?? ''),
              trailing: InkWell(
                onTap: () async {
                  // Delete the selected guest
                  await deleteGuest(allGuestModel.data![index].sId.toString());
                  print(deleteGuest(allGuestModel.data![index].sId.toString()));
                },
                child: const Icon(Icons.delete),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: 8,
              thickness: 1,
            );
          },
        ),
      ),
    );
  }
}
