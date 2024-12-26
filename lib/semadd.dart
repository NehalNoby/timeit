import 'package:flutter/material.dart';

void main() {
  runApp(const SemAdd());
}

class SemAdd extends StatelessWidget {
  const SemAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SemesterUpdationScreen(),
    );
  }
}

class SemesterUpdationScreen extends StatelessWidget {
  final List<String> semesters = [
    'FIRST SEMESTER',
    'SECOND SEMESTER',
    'THIRD SEMESTER',
    'FOURTH SEMESTER',
    'FIFTH SEMESTER',
    'SIXTH SEMESTER',
    'SEVENTH SEMESTER',
    'EIGHTH SEMESTER',
  ];

  SemesterUpdationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Semester Updation',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello,',
              style: TextStyle(fontSize: 24),
            ),
            const Text(
              'Hi there!',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'SEMESTER UPDATION',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: semesters.length,
                itemBuilder: (context, index) {
                  return SemesterButton(
                    label: semesters[index],
                    onPressed: () {
                      // Add functionality here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Selected ${semesters[index]}')),
                      );
                    },
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

class SemesterButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const SemesterButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[200], // Button background color
          foregroundColor: Colors.black, // Text color
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
