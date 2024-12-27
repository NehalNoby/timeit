import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      home: SchedulePage(),
    );
  }
}

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<String>(
                    value: 'FIRST',
                    items: const [
                      DropdownMenuItem(
                        value: 'FIRST',
                        child: Text('FIRST',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      ':)',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Greeting Section
              const Text(
                'Hello,',
                style: TextStyle(fontSize: 24, color: Colors.grey),
              ),
              const Text(
                'Hi Name',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),

              // Schedule List Section
              Expanded(
                child: ListView.builder(
                  itemCount: 5, // Number of items in the list
                  itemBuilder: (context, index) {
                    return _buildScheduleCard(index + 1);
                  },
                ),
              ),

              // Bottom Navigation Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBottomNavItem('MON'),
                  _buildBottomNavItem('TUE'),
                  _buildBottomNavItem('WED'),
                  _buildBottomNavItem('THR'),
                  _buildBottomNavItem('FRI'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScheduleCard(int index) {
    // Determine the title and subject dynamically
    String title;
    String subject;

    switch (index) {
      case 1:
        title = 'FIRST SEMESTER';
        subject = 'SUBJECT';
        break;
      case 2:
        title = 'NO CLASSES';
        subject = '';
        break;
      case 3:
        title = 'THIRD SEMESTER';
        subject = 'SUBJECT';
        break;
      case 4:
        title = 'NO CLASSES';
        subject = '';
        break;
      case 5:
        title = 'FIFTH SEMESTER';
        subject = 'SUBJECT';
        break;
      default:
        title = 'UNKNOWN';
        subject = '';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pink[100],
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$index',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  subject,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Detail', style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(String label) {
    return TextButton(
      onPressed: () {},
      child: Text(
        label,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }
}
