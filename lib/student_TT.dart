import 'package:flutter/material.dart';



class StudentTimeTablePage extends StatefulWidget {
  const StudentTimeTablePage({super.key});

  @override
  _StudentTimeTablePageState createState() => _StudentTimeTablePageState();
}

class _StudentTimeTablePageState extends State<StudentTimeTablePage> {
  int _selectedIndex = 0;

  final List<String> _days = ['MON', 'TUE', 'WED', 'THR', 'FRI'];

  final List<List<String>> _timetable = [
    ['MAJOR', 'AEC 1', 'MINOR 2', 'AEC 2', 'MDC'], // Monday
    ['AEC 1', 'MAJOR', 'MDC', 'MINOR 2', 'AEC 2'], // Tuesday
    ['MINOR 2', 'MDC', 'MAJOR', 'AEC 1', 'AEC 2'], // Wednesday
    ['AEC 2', 'MINOR 2', 'AEC 1', 'MAJOR', 'MDC'], // Thursday
    ['MDC', 'AEC 2', 'AEC 1', 'MINOR 2', 'MAJOR'], // Friday
  ];

  final List<List<String>> _facultyDetails = [
    ['Prof. Smith', 'Dr. Johnson', 'Dr. Lee', 'Prof. Brown', 'Dr. Davis'], // Monday
    ['Dr. Taylor', 'Prof. Jackson', 'Dr. White', 'Dr. Harris', 'Prof. Martin'], // Tuesday
    ['Prof. Clark', 'Dr. Lewis', 'Dr. Walker', 'Prof. Young', 'Dr. Allen'], // Wednesday
    ['Dr. Scott', 'Prof. King', 'Dr. Adams', 'Dr. Nelson', 'Prof. Carter'], // Thursday
    ['Prof. Rodriguez', 'Dr. Mitchell', 'Dr. Perez', 'Dr. Evans', 'Prof. Thomas'], // Friday
  ];

  final List<bool> _showDetails = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 180,
        backgroundColor: const Color(0xFF6200EA), // Deep Purple
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
              'Student Timetable',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: 'FIRST',
              items: const [DropdownMenuItem(value: 'FIRST', child: Text('FIRST'))],
              onChanged: (value) {},
              dropdownColor: const Color(0xFF6200EA),
              underline: const SizedBox.shrink(),
              iconEnabledColor: Colors.white,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF3E5F5), // Lavender
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
                color: Color(0xFF311B92), // Dark Purple
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
                          colors: [Color(0xFF9575CD), Color(0xFFD1C4E9)], // Purple gradient
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
                              backgroundColor: const Color(0xFF7E57C2), // Medium Purple
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
                                style: const TextStyle(color: Color(0xFF311B92)), // Dark Purple
                              ),
                            ),
                          ),
                          if (_showDetails[index])
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEDE7F6), // Light Purple
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
        backgroundColor: const Color(0xFF6200EA), // Deep Purple
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
