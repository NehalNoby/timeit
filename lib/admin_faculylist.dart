import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FacultyList(),
    );
  }
}

class FacultyList extends StatefulWidget {
  const FacultyList({super.key});

  @override
  _FacultyListState createState() => _FacultyListState();
}

class _FacultyListState extends State<FacultyList> {
  String selectedDepartment = 'Department';
  List<String> departments = ['Department', 'Computer Science', 'Physics', 'Mathematics'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 180,
        backgroundColor: const Color.fromARGB(255, 18, 46, 74), // Very Dark Blue
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(40),
            bottomEnd: Radius.circular(40),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context); // Go back to previous screen
          },
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 16, bottom: 16),
          child: Row(
            children: [
              Text(
                "Hello,",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 4),
              Text(
                "Hi THERE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFF486D77), // Muted Teal
                child: Icon(
                  Icons.person,
                  color: Color(0xFFA8C3C8), // Soft Gray-Teal
                  size: 25,
                ),
              ),
            ],
          ),
        ),
        centerTitle: false, // Align the title to the left
      ),
      body: Scrollbar(
        thickness: 6.0,
        radius: const Radius.circular(10),
        interactive: true,
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            prefixIcon: const Icon(Icons.search, color: Color(0xFF12343B)), // Deep Teal
                            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Color(0xFFA8C3C8)), // Soft Gray-Teal
                            ),
                            filled: true,
                            fillColor: const Color(0xFFD9E1E2), // Light Gray
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9E1E2), // Light Gray
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFA8C3C8)), // Soft Gray-Teal
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedDepartment,
                              items: departments
                                  .map((String department) => DropdownMenuItem<String>(
                                        value: department,
                                        child: Text(
                                          department,
                                          style: const TextStyle(fontSize: 16, color: Color(0xFF12343B)), // Deep Teal
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedDepartment = value!;
                                });
                              },
                              icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF12343B)), // Deep Teal
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          "FACULTIES",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0A1B2C), // Very Dark Blue
                          ),
                        ),
                        const SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 5, // Adjust based on the number of faculty cards needed
                          itemBuilder: (context, index) {
                            return FacultyCard(
                              name: "Name $index",
                              subject: "Subject $index",
                              onPressed: () {
                                // Handle detail navigation
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FacultyCard extends StatelessWidget {
  final String name;
  final String subject;
  final VoidCallback onPressed;

  const FacultyCard({super.key, 
    required this.name,
    required this.subject,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFD9E1E2), // Light Gray
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xFF486D77), // Muted Teal
              child: Icon(
                Icons.person,
                color: Color(0xFFA8C3C8), // Soft Gray-Teal
                size: 30,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A1B2C), // Very Dark Blue
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subject,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF12343B), // Deep Teal
                  ),
                ),
              ],
            ),
            const Spacer(),
            TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF486D77), // Muted Teal
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                "Detail",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFD9E1E2), // Light Gray
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
