import 'package:flutter/material.dart';
import 'package:task_scheduler/data/models/host_models/popular_slot_model.dart';

import '../../../../data/services/network_caller.dart';
import '../../../../data/utility/urls.dart';

class HostBookingTrendAnalyticsScreen extends StatefulWidget {
  const HostBookingTrendAnalyticsScreen({super.key});

  @override
  State<HostBookingTrendAnalyticsScreen> createState() => _HostBookingTrendAnalyticsScreenState();
}

class _HostBookingTrendAnalyticsScreenState extends State<HostBookingTrendAnalyticsScreen> {

  PopularSlotModel popularSlotModel = PopularSlotModel();
  bool inProgress = false;
  @override
  void initState() {
    super.initState();
    getPopularBooked();
  }

  Future<void> getPopularBooked() async {
    inProgress = true;
    setState(() {});
    final response =
    await NetworkCaller().getMethod(Urls.hostPopularBooked('host@yahoo.com'));

    if (response != null) {
      popularSlotModel = PopularSlotModel.fromJson(response);
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
      appBar: AppBar(
        title: const Text('Popular Time Slots'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListView.builder(
            itemCount: popularSlotModel.data?.length ?? 0,
            itemBuilder: (context, index){
          return ListTile(
            tileColor: Colors.grey.shade200,
            title: Text('Time: ${popularSlotModel.data?[index].time ?? 'Time'}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            subtitle: Text('Popularity: ${popularSlotModel.data?[index].count?.toString() ?? "0"}', style: TextStyle(fontSize: 16),),
          );
        }),
      ),
    );
  }
}
