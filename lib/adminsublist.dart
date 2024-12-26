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
      home: SubjectListPage(),
    );
  }
}

class SubjectListPage extends StatelessWidget {
  final List<String> subjects = [
    "MINOR 1",
    "MINOR 2",
    "AEC 1",
    "AEC 2",
    "MDC",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          "Subject List",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Hello,\nHi THERE",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 145, 180, 240),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1),
            
            // Search Bar Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "VIEW SUBJECTS",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "SEARCH",
                  filled: true,
                  fillColor: Color.fromARGB(255, 215, 213, 227),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                ),
              ),
            ),
            const SizedBox(height: 8),
            
            // Subject Cards Section
            Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 211, 203, 255),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        title: Text(
                          "VIEW ${subjects[index]}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            // Handle edit click
                          },
                        ),
                      ),
                    ),
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
