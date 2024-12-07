import 'package:flutter/material.dart';

void main() {
  runApp(const TimeTableApp());
}

class TimeTableApp extends StatelessWidget {
  const TimeTableApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const TimeTablePage(),
        '/mon': (context) => const DaySchedulePage(day: 'Monday'),
        '/tue': (context) => const DaySchedulePage(day: 'Tuesday'),
        '/wed': (context) => const DaySchedulePage(day: 'Wednesday'),
        '/thr': (context) => const DaySchedulePage(day: 'Thursday'),
        '/fri': (context) => const DaySchedulePage(day: 'Friday'),
      },
    );
  }
}

class TimeTablePage extends StatelessWidget {
  const TimeTablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Hello,",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            Text(
              "Hi Name",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          const Icon(
            Icons.favorite_border,
            color: Colors.black,
          ),
          const SizedBox(width: 16),
          const CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          // Dropdown and Divider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<String>(
                    value: 'FIRST',
                    underline: Container(), // Remove underline
                    items: <String>['FIRST', 'SECOND', 'THIRD', 'FOURTH']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.grey),
          // List of Cards
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  _buildCard("1", "MAJOR"),
                  _buildCard("2", "AEC 1"),
                  _buildCard("3", "MINOR 2"),
                  _buildCard("4", "AEC 2"),
                  _buildCard("5", "MDC"),
                ],
              ),
            ),
          ),
          // Bottom Navigation Bar
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomNavButton(context, "MON", "/mon"),
                _buildBottomNavButton(context, "TUE", "/tue"),
                _buildBottomNavButton(context, "WED", "/wed"),
                _buildBottomNavButton(context, "THR", "/thr"),
                _buildBottomNavButton(context, "FRI", "/fri"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Card Widget
  Widget _buildCard(String number, String subject) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: [
          // Shadow Layer
          Positioned(
            top: 10,
            left: 5,
            right: 5,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          // Foreground Card
          Container(
            height: 100,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE0E0), // Pink card
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Subject Number
                Text(
                  number,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 16),
                // Subject Name
                Expanded(
                  child: Text(
                    subject,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                // Detail Button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 12.0),
                  ),
                  child: const Text(
                    "Detail",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Bottom Navigation Button Widget
  Widget _buildBottomNavButton(BuildContext context, String label, String route) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class DaySchedulePage extends StatelessWidget {
  final String day;

  const DaySchedulePage({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("$day's Schedule"),
      ),
      body: Center(
        child: Text(
          "Schedule for $day",
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
