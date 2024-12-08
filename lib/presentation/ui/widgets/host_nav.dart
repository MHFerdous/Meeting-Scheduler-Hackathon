import 'package:flutter/material.dart';
import 'package:task_scheduler/presentation/ui/screens/host_screens/host_booking_trend_analytics_screen.dart';
import 'package:task_scheduler/presentation/ui/screens/host_screens/host_most_booked_analytics_screen.dart';

class HostNav extends StatefulWidget {
  const HostNav({super.key});

  @override
  State<HostNav> createState() => _HostNavState();
}

var scaffoldKey = GlobalKey<ScaffoldState>();

class _HostNavState extends State<HostNav> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HostMostBookedAnalyticsScreen(),
    const HostBookingTrendAnalyticsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            icon: Icon(Icons.book),
            label: "Most Booked",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: "Booking Trend",
          ),
        ],
      ),
    );
  }
}
