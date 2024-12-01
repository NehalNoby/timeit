import 'package:flutter/material.dart';
import 'package:timeit/hod.dart';
import 'package:timeit/faculty.dart';
import 'package:timeit/student.dart';

// Placeholder for the Registration screens

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  String? selectedRole; // To store the selected role
  String? _errorText; // To store error text for role selection

  final List<String> roles = ['H.O.D', 'Faculty', 'Student']; // Available roles

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method returns the same UI structure for both "Sign In" and "Sign Up"
    Widget buildSignInForm() {
      return Column(
        children: [
          const SizedBox(height: 10),
          const Text(
            'Welcome Back!',
            style: TextStyle(
              fontSize: 30,
              color: Color(0XFF0B0B60),
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              wordSpacing: 3.0,
              fontFamily: 'time',
            ),
          ),
          const SizedBox(height: 20),
          Image.asset(
            'assets/images/lissahlogo.png.jpg', // Replace with your logo path
            height: 175,
            width: 175,
          ),
          const SizedBox(height: 20),
          // Existing email and password fields for Sign In
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0), // Adds margin to both sides
            child: SizedBox(
              height: 60,
              child: Card(
                color: Colors.white,
                elevation: 8,
                child: TextField(
                  style: const TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.all(20),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          // Password Input Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0), // Same margin for consistency
            child: SizedBox(
              height: 60,
              child: Card(
                color: Colors.white,
                elevation: 10,
                child: TextField(
                  style: const TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: const Icon(Icons.visibility),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.all(20),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 2.0),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                print("Sign In");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF0B0B60),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 140),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      );
    }

    Widget buildSignUpForm() {
      return Column(
        children: [
          const SizedBox(height: 10),
          const Text(
            'Create Account',
            style: TextStyle(
              fontSize: 30,
              color: Color(0XFF0B0B60),
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              wordSpacing: 3.0,
              fontFamily: 'time',
            ),
          ),
          const SizedBox(height: 20),
          Image.asset(
            'assets/images/lissahlogo.png.jpg',
            height: 175,
            width: 175,
          ),
          const SizedBox(height: 20),
          // Only for Sign Up, add Role Selection Dropdown
          const SizedBox(height: 20),
          const Text(
            'Please select your role:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: DropdownButton<String>(
                value: selectedRole,
                hint: const Text("Select Role"),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedRole = newValue;
                  });
                },
                isExpanded: true,
                underline: const SizedBox(),
                items: roles.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          // Error Text for role selection
          if (_errorText != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                _errorText!,
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),
            ),
          const SizedBox(height: 25),
          // Elevated Button for Sign Up
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                if (selectedRole == null || selectedRole!.isEmpty) {
  setState(() {
    _errorText = "Please select a role.";
  });
} else {
  setState(() {
    _errorText = null;
  });

  // Show a SnackBar and navigate to the appropriate registration screen based on the role
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Role $selectedRole selected!')),
  );

  // Navigate based on the selected role
  if (selectedRole == 'H.O.D') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HODRegistrationScreen()),
    );
  } else if (selectedRole == 'Faculty') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FacultyRegistrationScreen()),
    );
  } else if (selectedRole == 'Student') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const StudentRegistrationScreen()),
    );
  }
}

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF0B0B60),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 140),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 180,
        backgroundColor: const Color(0XFF0B0B60),
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
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Sign In"),
            Tab(text: "Sign Up"),
          ],
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildSignInForm(),
          buildSignUpForm(),
        ],
      ),
    );
  }
}


