import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomUI(),
    );
  }
}

class CustomUI extends StatelessWidget {
  const CustomUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<String>(
                    value: "FIRST",
                    items: const [
                      DropdownMenuItem(value: "FIRST", child: Text("FIRST")),
                      DropdownMenuItem(value: "SECOND", child: Text("SECOND")),
                    ],
                    onChanged: (value) {},
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Hello,\nHi Name",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            // Subject Cards
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  final subjects = [
                    "MAJOR",
                    "AEC 1",
                    "MINOR 2",
                    "AEC 2",
                    "MDC"
                  ];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.pink[100],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        leading: Text(
                          "${index + 1}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        title: Text(
                          subjects[index],
                          style: const TextStyle(fontSize: 16),
                        ),
                        trailing: TextButton(
                          onPressed: () {
                            // Handle detail click
                          },
                          child: const Text(
                            "Detail",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Bottom Navigation
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text("MON"),
                  Text("TUE"),
                  Text(
                    "WED",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("THR"),
                  Text("FRI"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
