import 'package:flutter/material.dart';

void main() {
  runApp(const TeacherTimeTable());
}

class TeacherTimeTable extends StatelessWidget {
  const TeacherTimeTable({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TeacherTimeTablePage(),
    );
  }
}

class TeacherTimeTablePage extends StatefulWidget {
  const TeacherTimeTablePage({super.key});

  @override
  _TeacherTimeTablePageState createState() => _TeacherTimeTablePageState();
}

class _TeacherTimeTablePageState extends State<TeacherTimeTablePage> {
  int _selectedIndex = 0;

  String _dropdownValue = 'FIRST'; // Dropdown selection state

  final List<String> _days = ['MON', 'TUE', 'WED', 'THR', 'FRI'];

  final List<List<String>> _timetable = [
    ['Math', 'Physics', 'Chemistry', 'Biology', 'English'], // Monday
    ['History', 'Math', 'Chemistry', 'Physics', 'Physical Education'], // Tuesday
    ['Biology', 'English', 'Math', 'History', 'Chemistry'], // Wednesday
    ['Physics', 'Biology', 'English', 'Math', 'History'], // Thursday
    ['Chemistry', 'Physical Education', 'Biology', 'Math', 'English'], // Friday
  ];

  final List<List<String>> _facultyDetails = [
    ['Mr. Adams', 'Ms. Baker', 'Dr. Clark', 'Prof. Davis', 'Ms. Evans'], // Monday
    ['Dr. Fisher', 'Mr. Green', 'Ms. Hall', 'Prof. Ives', 'Mr. Johnson'], // Tuesday
    ['Prof. King', 'Ms. Lewis', 'Mr. Martinez', 'Dr. Nelson', 'Ms. O’Brien'], // Wednesday
    ['Mr. Perez', 'Prof. Robinson', 'Dr. Smith', 'Ms. Taylor', 'Mr. White'], // Thursday
    ['Ms. Young', 'Mr. Zane', 'Prof. Allen', 'Dr. Brooks', 'Ms. Carter'], // Friday
  ];

  final List<bool> _showDetails = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: const Color(0xFF6200EA),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(40),
            bottomEnd: Radius.circular(40),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Teacher Timetable',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: _dropdownValue,
              items: ['FIRST', 'SECOND', 'THIRD']
                  .map((value) => DropdownMenuItem(value: value, child: Text(value)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _dropdownValue = value!;
                });
              },
              dropdownColor: const Color(0xFF6200EA),
              underline: const SizedBox.shrink(),
              iconEnabledColor: Colors.white,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF3E5F5),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${_days[_selectedIndex]} Timetable',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: Color(0xFF311B92),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Number of hours (5 periods)
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF9575CD), Color(0xFFD1C4E9)],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: const Color(0xFF7E57C2),
                              child: Text(
                                (index + 1).toString(),
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                            title: Text(
                              _timetable[_selectedIndex][index],
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            trailing: TextButton(
                              onPressed: () {
                                setState(() {
                                  _showDetails[index] = !_showDetails[index];
                                });
                              },
                              child: Text(
                                _showDetails[index] ? 'Hide Details' : 'Details',
                                style: const TextStyle(color: Color(0xFF311B92)),
                              ),
                            ),
                          ),
                          if (_showDetails[index])
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEDE7F6),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'Faculty: ${_facultyDetails[_selectedIndex][index]}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
        backgroundColor: const Color(0xFF6200EA),
        items: _days
            .map((day) => BottomNavigationBarItem(
                  icon: const Icon(Icons.calendar_today),
                  label: day,
                ))
            .toList(),
      ),
    );
  }
}
