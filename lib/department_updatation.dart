import 'package:flutter/material.dart';

void main() {
  runApp(const DepartmentApp());
}

class DepartmentApp extends StatelessWidget {
  const DepartmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DepartmentDetailsPage(),
    );
  }
}

class DepartmentDetailsPage extends StatefulWidget {
  const DepartmentDetailsPage({super.key});

  @override
  _DepartmentDetailsPageState createState() => _DepartmentDetailsPageState();
}

class _DepartmentDetailsPageState extends State<DepartmentDetailsPage> {
  // Controllers for form fields
  final TextEditingController _deptNameController = TextEditingController();
  final TextEditingController _deptIdController = TextEditingController();
  final TextEditingController _collegeNameController = TextEditingController();

  // Form submission
  void _saveDepartment() {
    if (_deptNameController.text.isEmpty ||
        _deptIdController.text.isEmpty ||
        _collegeNameController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Error"),
          content: const Text("Please fill in all fields."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Department Saved"),
        content: Text(
          "Department Name: ${_deptNameController.text}\n"
          "Department ID: ${_deptIdController.text}\n"
          "College Name: ${_collegeNameController.text}",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _deptNameController.dispose();
    _deptIdController.dispose();
    _collegeNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: const Color(0XFF0B0B60),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(40),
            bottomEnd: Radius.circular(40),
          ),
        ),
        title: const Text(
          "Department Details",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 4.0, top: 7.0),
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Department Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(
              controller: _deptNameController,
              decoration: const InputDecoration(
                hintText: "Enter department name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            const Text("Department ID", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(
              controller: _deptIdController,
              decoration: const InputDecoration(
                hintText: "Enter department ID",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            const Text("College Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(
              controller: _collegeNameController,
              decoration: const InputDecoration(
                hintText: "Enter college name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),

            Center(
              child: ElevatedButton(
                onPressed: _saveDepartment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0B0B60),
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
