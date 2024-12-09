import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart'; // Add this import
import '../../../../data/models/host_models/most_booked_model.dart';
import '../../../../data/services/network_caller.dart';
import '../../../../data/utility/urls.dart';
import 'host_slot_status_screen.dart';

class HostMostBookedAnalyticsScreen extends StatefulWidget {
  const HostMostBookedAnalyticsScreen({super.key});

  @override
  State<HostMostBookedAnalyticsScreen> createState() =>
      _HostMostBookedAnalyticsScreenState();
}

class _HostMostBookedAnalyticsScreenState
    extends State<HostMostBookedAnalyticsScreen> {
  bool inProgress = false;
  MostBookedModel mostBookedModel = MostBookedModel();

  @override
  void initState() {
    super.initState();
    getMostBooked();
  }

  Future<void> getMostBooked() async {
    inProgress = true;
    setState(() {});
    final response =
    await NetworkCaller().getMethod(Urls.hostMostBooked('host@yahoo.com'));

    if (response != null) {
      mostBookedModel = MostBookedModel.fromJson(response);
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

  Future<void> downloadJSON() async {
    // Prepare data for JSON export
    List<Map<String, dynamic>> jsonData = [];

    for (var item in mostBookedModel.data ?? []) {
      jsonData.add({
        "Title": item.title ?? "Unknown",
        "Start Date": item.startDate ?? "",
        "Start Time": item.startTime ?? "",
        "End Date": item.endDate ?? "",
        "End Time": item.endTime ?? "",
        "Address": item.meetingAddress ?? "",
        "Remaining": item.count.toString()
      });
    }

    // Convert the data to JSON
    String jsonString = jsonEncode(jsonData);

    // Save JSON to a file
    final directory = await getApplicationDocumentsDirectory(); // Use this method
    final path = '${directory.path}/most_booked.json';
    final file = File(path);
    await file.writeAsString(jsonString);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('JSON saved to $path'),
      backgroundColor: Colors.green,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Most Booked'),
        actions: [
          IconButton(
            onPressed: downloadJSON, // Trigger the JSON download
            icon: const Icon(Icons.download),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.w),
                  color: const Color(0xFFFFFFFF)),
              child: ListView.separated(
                itemCount: mostBookedModel.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(
                        HostSlotStatusScreen(
                          topic: mostBookedModel.data![index].title.toString(),
                          startDate:
                          mostBookedModel.data![index].startDate.toString(),
                          startTime:
                          mostBookedModel.data![index].startTime.toString(),
                          endDate:
                          mostBookedModel.data![index].endDate.toString(),
                          endTime:
                          mostBookedModel.data![index].endTime.toString(),
                          meetingAddress: mostBookedModel
                              .data![index].meetingAddress
                              .toString(),
                          remaining:
                          mostBookedModel.data![index].count.toString(),
                          id: mostBookedModel.data![index].sId.toString(),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        mostBookedModel.data?[index].title ?? 'Unknown',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                        ),
                      ),
                      subtitle: Text(
                        '${mostBookedModel.data?[index].startDate} (${mostBookedModel.data?[index].startTime}) To ${mostBookedModel.data?[index].endDate}  (${mostBookedModel.data?[index].endTime})',
                        style: TextStyle(
                          color: const Color(0xFF0D6858),
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_circle_right,
                          size: 35.w,
                        ),
                        color: Colors.teal,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
