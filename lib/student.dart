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

<<<<<<< HEAD
class StudentRegistrationScreen extends StatelessWidget {
 

  const StudentRegistrationScreen({super.key});
=======
class StudentRegistrationScreen extends StatefulWidget {
  const StudentRegistrationScreen({super.key});

  @override
  State<StudentRegistrationScreen> createState() =>
      _StudentRegistrationScreenState();
}

class _StudentRegistrationScreenState extends State<StudentRegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController courseController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
>>>>>>> ddaaae47729ee11554e0c28fcd8e12f35bdd93b2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
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
=======
        toolbarHeight: 160,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Student Registration',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF8F9FA), Color(0xFFE6E6FA)], // Light Lavender Gradient
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
        ),
      ),
      backgroundColor: const Color(0xFFF8F9FA), // Very Light Lavender Background
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFE6E6FA), // Light Lavender Container
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Register Now',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4B0082), // Deep Lavender Text
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Full Name
                  _buildInputField(
                    controller: nameController,
                    label: 'Full Name',
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 15),
                  // Course
                  _buildInputField(
                    controller: courseController,
                    label: 'Course Name',
                    icon: Icons.book,
                  ),
                  const SizedBox(height: 15),
                  // Email
                  _buildInputField(
                    controller: emailController,
                    label: 'Email Address',
                    icon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 15),
                  // Password
                  _buildInputField(
                    controller: passwordController,
                    label: 'Password',
                    icon: Icons.lock,
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),
                  // Register Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print("Name: ${nameController.text}");
                          print("Course: ${courseController.text}");
                          print("Email: ${emailController.text}");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9370DB), // Medium Lavender Button
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white, // White Button Text
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
>>>>>>> ddaaae47729ee11554e0c28fcd8e12f35bdd93b2
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
