import 'package:flutter/material.dart';

class StudentRegistrationScreen extends StatefulWidget {
  const StudentRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<StudentRegistrationScreen> createState() =>
      _StudentRegistrationScreenState();
}

class _StudentRegistrationScreenState
    extends State<StudentRegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Form field controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String selectedDepartment = 'Computer Science'; // Default department

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 180,
        title: const Text(
          'Faculty Registration',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0XFF0B0B60),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(40),
            bottomEnd: Radius.circular(40),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28.0),
          onPressed: () {
            Navigator.pop(context); // Return to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Register as Student',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF0B0B60),
                  ),
                ),
                const SizedBox(height: 20),
                // Name Field with Prefix Icon
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    prefixIcon: const Icon(Icons.person, color: Color(0XFF0B0B60)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                // Email Field with Prefix Icon
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    prefixIcon: const Icon(Icons.email, color: Color(0XFF0B0B60)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                // Phone Number Field with Prefix Icon
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    prefixIcon: const Icon(Icons.phone, color: Color(0XFF0B0B60)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Please enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                // Department Dropdown with Prefix Icon
                DropdownButtonFormField<String>(
                  value: selectedDepartment,
                  items: [
                    'Computer Science',
                    'Psychology',
                    'Sociology',
                    'BSW',
                    'MSW',
                    'MCJ',
                  ]
                      .map((department) => DropdownMenuItem<String>(
                            value: department,
                            child: Text(department),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedDepartment = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Department',
                    prefixIcon: const Icon(Icons.school, color: Color(0XFF0B0B60)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your department';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                // Password Field with Prefix Icon
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Set Password',
                    prefixIcon: const Icon(Icons.lock, color: Color(0XFF0B0B60)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please set a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                // Register Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("Student Registration Successful!");
                        print("Name: ${nameController.text}");
                        print("Email: ${emailController.text}");
                        print("Phone: ${phoneController.text}");
                        print("Department: $selectedDepartment");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0XFF0B0B60),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
