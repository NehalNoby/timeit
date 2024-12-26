import 'package:flutter/material.dart';
import 'package:timeit/logn_screen.dart';

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
 

  const StudentRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('f'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ffff', style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('Course: fff',
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('Email: ffff',
                style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
