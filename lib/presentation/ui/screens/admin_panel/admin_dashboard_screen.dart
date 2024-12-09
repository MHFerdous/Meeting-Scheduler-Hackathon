import 'package:flutter/material.dart';
import 'package:task_scheduler/presentation/ui/screens/admin_panel/all_guest_screen.dart';
import 'package:task_scheduler/presentation/ui/screens/admin_panel/all_host_screen.dart';
import 'package:task_scheduler/presentation/ui/screens/host_screens/host_booking_trend_analytics_screen.dart';
import 'package:task_scheduler/presentation/ui/screens/host_screens/host_most_booked_analytics_screen.dart';
import 'package:task_scheduler/presentation/ui/widgets/appbar_method.dart';

class AdminPanelDashboardScreen extends StatefulWidget {
  const AdminPanelDashboardScreen({super.key});

  @override
  State<AdminPanelDashboardScreen> createState() => _AdminPanelDashboardScreenState();
}

var scaffoldKey = GlobalKey<ScaffoldState>();

class _AdminPanelDashboardScreenState extends State<AdminPanelDashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const AllHostScreen(),
    const AllGuestScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customisedAppBar(scaffoldKey, context, 3),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "All Hosts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_sharp),
            label: "All Guest",
          ),
        ],
      ),
    );
  }
}
