import 'package:flutter/material.dart';

class Student {
  final String name;
  final int id;
  final String course;
  final String email;

  Student({
    required this.name,
    required this.id,
    required this.course,
    required this.email,
  });
}

class StudentRegistrationScreen extends StatelessWidget {
  final Student student;

  const StudentRegistrationScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${student.id}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text('Course: ${student.course}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text('Email: ${student.email}', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
