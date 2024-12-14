import 'package:flutter/material.dart';

class TimetablePage extends StatelessWidget {
  final String studentName;

  const TimetablePage({super.key, required this.studentName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$studentName - Timetable'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildTimetableItem('Monday', 'Math - 9:00 AM'),
            _buildTimetableItem('Tuesday', 'Physics - 11:00 AM'),
            _buildTimetableItem('Wednesday', 'Chemistry - 10:00 AM'),
            _buildTimetableItem('Thursday', 'Biology - 1:00 PM'),
            _buildTimetableItem('Friday', 'Computer Science - 3:00 PM'),
          ],
        ),
      ),
    );
  }

  Widget _buildTimetableItem(String day, String subject) {
    return ListTile(
      title: Text(day),
      subtitle: Text(subject),
    );
  }
}
