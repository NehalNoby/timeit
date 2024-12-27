import 'package:flutter/material.dart';
import 'package:timeit/student_tt.dart';

class Student {
  final String department;
  final String minor1;
  final String minor2;
  final String aec;
  final String mdc;

  Student({
    required this.department,
    required this.minor1,
    required this.minor2,
    required this.aec,
    required this.mdc,
  });
}

class StudentForm extends StatefulWidget {
  const StudentForm({super.key});

  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedDepartment;
  String? _selectedMinor1;
  String? _selectedMinor2;
  String? _selectedAEC;
  String? _selectedMDC;

  final List<String> departments = ['CS', 'IT', 'ECE', 'EEE'];
  final Map<String, List<String>> minorsByDepartment = {
    'CS': ['Data Science', 'AI', 'Cybersecurity'],
    'IT': ['Blockchain', 'Data Science', 'Cybersecurity'],
    'ECE': ['AI', 'Signal Processing', 'Robotics'],
    'EEE': ['Power Systems', 'AI', 'Robotics'],
  };
  final List<String> aecOptions = ['AEC 1', 'AEC 2', 'AEC 3'];
  final List<String> mdcOptions = ['MDC 1', 'MDC 2', 'MDC 3'];

  List<String> _filteredMinors = [];

  @override
  void initState() {
    super.initState();
  }

  void _updateMinors(String? department) {
    setState(() {
      _filteredMinors = department != null ? minorsByDepartment[department] ?? [] : [];
      _selectedMinor1 = null;
      _selectedMinor2 = null;
    });
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final student = Student(
        department: _selectedDepartment ?? '',
        minor1: _selectedMinor1 ?? '',
        minor2: _selectedMinor2 ?? '',
        aec: _selectedAEC ?? '',
        mdc: _selectedMDC ?? '',
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const StudentTimeTablePage(),
        ),
      );
    }
  }

  Widget _buildDropdown(String label, String? selectedValue, List<String> options, void Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: selectedValue,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.pink[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          items: options.map((option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: onChanged,
          validator: (value) => value == null || value.isEmpty ? 'Please select an option' : null,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 180,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Student Form',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0XFF0B0B60),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDropdown(
                'Select Department',
                _selectedDepartment,
                departments,
                (value) {
                  _selectedDepartment = value;
                  _updateMinors(value);
                },
              ),
              _buildDropdown(
                'Select Minor 1',
                _selectedMinor1,
                _filteredMinors,
                (value) {
                  setState(() {
                    _selectedMinor1 = value;
                  });
                },
              ),
              _buildDropdown(
                'Select Minor 2',
                _selectedMinor2,
                _filteredMinors.where((minor) => minor != _selectedMinor1).toList(),
                (value) {
                  setState(() {
                    _selectedMinor2 = value;
                  });
                },
              ),
              _buildDropdown('Select AEC', _selectedAEC, aecOptions, (value) {
                setState(() {
                  _selectedAEC = value;
                });
              }),
              _buildDropdown('Select MDC', _selectedMDC, mdcOptions, (value) {
                setState(() {
                  _selectedMDC = value;
                });
              }),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4B0082),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Generate', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StudentTimeTable extends StatelessWidget {
  final Student student;

  const StudentTimeTable({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Time Table'),
        backgroundColor: const Color(0xFF4B0082),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Department: ${student.department}', style: const TextStyle(fontSize: 18)),
            Text('Minor 1: ${student.minor1}', style: const TextStyle(fontSize: 18)),
            Text('Minor 2: ${student.minor2}', style: const TextStyle(fontSize: 18)),
            Text('AEC: ${student.aec}', style: const TextStyle(fontSize: 18)),
            Text('MDC: ${student.mdc}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}


