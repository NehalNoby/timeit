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
        primarySwatch: Colors.blue, // Bluish theme
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
        toolbarHeight: 150,
        backgroundColor: const Color(0XFF0B0B60), // Deep bluish color
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(40),
            bottomEnd: Radius.circular(40),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 7.0, top: 7.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 23.0),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: const Text(
          'Semester Updation',
          style: TextStyle(color: Colors.white, fontSize: 24.0),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello,',
              style: TextStyle(fontSize: 24, color: Colors.black87),
            ),
            const Text(
              'Hi there!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0XFF0B0B60), // Deep bluish color
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'SEMESTER UPDATION',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: semesters.length,
                itemBuilder: (context, index) {
                  return SemesterButton(
                    label: semesters[index],
                    color: index % 2 == 0
                        ? Colors.blue[100]
                        : Colors.blue[50], // Alternating bluish colors
                    onPressed: () {
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
  final Color? color;
  final VoidCallback onPressed;

  const SemesterButton({
    super.key,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Customizable button background color
          foregroundColor: Colors.black, // Text color
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 4, // Shadow effect for a 3D look
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
