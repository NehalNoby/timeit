import 'package:flutter/material.dart';
import 'package:timeit/logn_screen.dart';

class Student {
  final String name;
  final String course;
  final String email;

  Student({
    required this.name,
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

  // Helper function for form fields
  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(color: Color(0xFF4B0082)), // Deep Lavender Text
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color(0xFF4B0082)),
        prefixIcon: Icon(icon, color: const Color(0xFF4B0082)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFBA55D3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF9370DB)),
        ),
        filled: true,
        fillColor: const Color(0xFFF8F9FA), // Light Lavender Input Background
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }
}
