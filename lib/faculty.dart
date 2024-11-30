import 'package:flutter/material.dart';

class FacultyRegistrationScreen extends StatefulWidget {
  const FacultyRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<FacultyRegistrationScreen> createState() =>
      _FacultyRegistrationScreenState();
}

class _FacultyRegistrationScreenState
    extends State<FacultyRegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Form field controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Department dropdown value
  String? selectedDepartment;

  // List of departments
  final List<String> departments = [
    'Computer Science',
    'psycology',
    'sociology',
    'BSW',
    'MSW',
    'MCJ',
  ];

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
          'Faculty Registration',
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
                  'Register as Faculty',
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
                // Department Dropdown Field
                DropdownButtonFormField<String>(
                  value: selectedDepartment,
                  onChanged: (newValue) {
                    setState(() {
                      selectedDepartment = newValue;
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
                  items: departments.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your department';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                // Contact Field with Prefix Icon
                TextFormField(
                  controller: contactController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Contact Number',
                    prefixIcon: const Icon(Icons.phone, color: Color(0XFF0B0B60)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your contact number';
                    }
                    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Please enter a valid 10-digit number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                // Email Field with Prefix Icon
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
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
                    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
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
                        print("Faculty Registration Successful!");
                        print("Name: ${nameController.text}");
                        print("Department: $selectedDepartment");
                        print("Contact: ${contactController.text}");
                        print("Email: ${emailController.text}");
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
